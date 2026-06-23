#!/bin/sh

# SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>
#
# SPDX-License-Identifier: ISC

# lib.sh — shared helpers for the shell-docs pipeline. Source it, don't run it.
#
# Data contract between stages (all POSIX sh, coreutils only):
#
#   extract  docs/sh/**/*.md  ->  tests/NNNN/{test.sh,expected.txt,vars.env}
#            vars.env: TEST_DOC_FILE TEST_DOC_LINE TEST_DOC_EXAMPLE_LINE
#                      TEST_NAME TEST_FILE TEST_EXPECTED TEST_OUTPUT
#   run      tests/  ->  results/opt/<shell>_<version>/.../tap.txt   (TAP13)
#            "ok N - <file> | <doc>:<line> | <feature>"
#   collect  results/  ->  data/sh/**/*.results   (durable, committed ledger)
#            one TAB-delimited line per observation: feature<TAB>shell<TAB>version<TAB>status
#            status is "pass" or "fail"; an absent line means "untested".
#   render   data/  +  docs/  ->  docs/sh/**/*.md  (Compatibility table rewritten in place)
#
# The ledger is the single durable source of truth; everything else is derived.

# Guard against being sourced twice (collect/render source it once; the container
# sources it from both container.sh and each test_shell.sh invocation).
test -n "${SD_LIB_LOADED:-}" && return 0
SD_LIB_LOADED=1

# A literal newline and tab, for IFS juggling and TSV parsing.
SD_EOL='
'
SD_TAB="$(printf '\t')"

# SPDX header written at the top of every generated ledger file. The ledger is
# factual data produced/consumed by this (ISC) tooling, so it carries ISC too.
# Ledger readers skip lines starting with '#', so this stays out of the data.
# REUSE-IgnoreStart  (the SPDX tags below are data, not lib.sh's own license)
SD_LEDGER_HEADER='# SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>
#
# SPDX-License-Identifier: ISC'
# REUSE-IgnoreEnd

# sd_log / sd_die — diagnostics on stderr.
sd_log () { printf '%s\n' "shell-docs: $*" >&2 ; }
sd_die () { printf '%s\n' "shell-docs: error: $*" >&2 ; exit 1 ; }

# sd_init_tools — resolve every external tool into SD_<NAME>, dying by name if one
# is missing. Replaces the per-script "X=$(command -v x)" blocks.
sd_init_tools () {
    for _sd_t in cat chmod comm cut diff dirname env find grep head mkdir mktemp mv rm sed sort touch tr wc sh
    do
        _sd_p="$(command -v "$_sd_t")" || sd_die "required tool not found: $_sd_t"
        eval "SD_$(printf '%s' "$_sd_t" | tr 'a-z' 'A-Z')=\$_sd_p"
    done
}

# sd_root_dir <$0> — absolute directory of the sourcing script.
sd_root_dir () { ( cd "$("$SD_DIRNAME" "$1")" && pwd ) ; }

# sd_require_dir / sd_require_nonempty_dir <path> <stage> — prerequisite gates.
sd_require_dir () {
    test -d "$1" || sd_die "missing '$1' — run the '$2' stage first"
}
sd_require_nonempty_dir () {
    sd_require_dir "$1" "$2"
    test -n "$("$SD_FIND" "$1" -mindepth 1 -print 2>/dev/null | "$SD_HEAD" -n1)" \
        || sd_die "'$1' is empty — the '$2' stage produced no output"
}

# sd_sort_versions  — version-aware, deduped (stdin -> stdout).
# sd_min_version    — oldest version (stdin -> stdout).
sd_sort_versions () { "$SD_SORT" -V -u ; }
sd_min_version   () { "$SD_SORT" -V -u | "$SD_HEAD" -n1 ; }

# sd_shell_name / sd_shell_version <token> — split a "<shell>_<version>" token on
# the FIRST underscore. Correct for ksh (e.g. "ksh_shvrChistory-b_2007-01-11"),
# which embeds underscores in its version.
sd_shell_name    () { printf '%s' "${1%%_*}" ; }
sd_shell_version () { printf '%s' "${1#*_}" ; }

# sd_is_h2_underline <line> <prev> — true when <line> is a setext "----" rule the
# same length as <prev> (so <prev> is an H2 heading). Shared by extract and render.
sd_is_h2_underline () {
    test -n "$1" && test -z "${1##-*}" && test ${#1} -eq ${#2}
}

# sd_tap_parse — read TAP on stdin, emit one TAB record per result line:
#   <status><TAB><number><TAB><file><TAB><docref><TAB><name>
# status is "ok" or "not ok". Replaces the scattered parameter-expansion parsers.
sd_tap_parse () {
    while read -r _sd_line
    do
        case "$_sd_line" in
            'ok '*)     _sd_st='ok'     ; _sd_rest="${_sd_line#ok }" ;;
            'not ok '*) _sd_st='not ok' ; _sd_rest="${_sd_line#not ok }" ;;
            *) continue ;;
        esac
        _sd_num="${_sd_rest%% - *}"   ; _sd_rest="${_sd_rest#* - }"
        _sd_file="${_sd_rest%% | *}"  ; _sd_rest="${_sd_rest#* | }"
        _sd_ref="${_sd_rest%% | *}"   ; _sd_name="${_sd_rest#* | }"
        printf '%s\t%s\t%s\t%s\t%s\n' \
            "$_sd_st" "$_sd_num" "$_sd_file" "$_sd_ref" "$_sd_name"
    done
}

# sd_ledger_data <file>... — emit ledger records only, dropping the SPDX/comment
# header and blank lines. The single entry point for reading ledger content.
sd_ledger_data () { "$SD_CAT" "$@" | "$SD_GREP" -vE '^#|^[[:space:]]*$' ; }

# sd_merge_results <current_file> <existing_file> — merge two ledgers onto stdout in
# canonical order (feature, shell, version-aware). For a (feature,shell,version) key
# the CURRENT run wins; keys present only in <existing> are retained (so knowledge
# survives a shell-image refresh). Headers/blanks are dropped. Either file may be
# missing/empty.
sd_merge_results () {
    { test -f "$1" && sd_ledger_data "$1" ; test -f "$2" && sd_ledger_data "$2" ; } |
        "$SD_SORT" -s -u -t "$SD_TAB" -k1,3 |
        "$SD_SORT" -V
}

# sd_write_ledger <dest> — read merged records on stdin, write <dest> with the SPDX
# header prepended.
sd_write_ledger () {
    { printf '%s\n\n' "$SD_LEDGER_HEADER" ; "$SD_CAT" ; } > "$1"
}

# sd_ledger_snapshot <data_dir> — emit every ledger record as
#   doc<TAB>feature<TAB>shell<TAB>version<TAB>status
# sorted. The doc prefix disambiguates feature names that repeat across docs (e.g.
# "Basic Usage"). Headers/blanks are dropped. Empty/absent dir -> empty output.
sd_ledger_snapshot () {
    test -d "$1" || return 0
    "$SD_FIND" "$1" -name '*.results' | while read -r _sd_f
    do
        _sd_doc="${_sd_f#"$1"/}" ; _sd_doc="${_sd_doc%.results}"
        sd_ledger_data "$_sd_f" | "$SD_SED" "s#^#${_sd_doc}${SD_TAB}#"
    done | "$SD_SORT"
}

# sd_ledger_changes <old_snapshot> <new_snapshot> — emit one line per status change:
#   recovered|regressed|new<TAB>doc<TAB>feature<TAB>shell<TAB>version
# The merge keeps every prior key, so an old-only record is a flip (binary status):
# old-only fail -> recovered (fail->pass), old-only pass -> regressed (pass->fail).
# A new-only fail whose (doc,feature,shell,version) key was absent from old is "new".
sd_ledger_changes () {
    _sd_d="$("$SD_MKTEMP" -d)"
    "$SD_COMM" -23 "$1" "$2" > "$_sd_d/oldonly"
    "$SD_COMM" -13 "$1" "$2" > "$_sd_d/newonly"
    "$SD_GREP" "${SD_TAB}fail$" "$_sd_d/oldonly" | "$SD_SED" "s/${SD_TAB}fail\$//; s/^/recovered${SD_TAB}/"
    "$SD_GREP" "${SD_TAB}pass$" "$_sd_d/oldonly" | "$SD_SED" "s/${SD_TAB}pass\$//; s/^/regressed${SD_TAB}/"
    "$SD_CUT" -f1-4 "$1" | "$SD_SORT" -u > "$_sd_d/oldkeys"
    "$SD_GREP" "${SD_TAB}fail$" "$_sd_d/newonly" | "$SD_CUT" -f1-4 | "$SD_SORT" -u > "$_sd_d/newfailkeys"
    "$SD_COMM" -23 "$_sd_d/newfailkeys" "$_sd_d/oldkeys" | "$SD_SED" "s/^/new${SD_TAB}/"
    "$SD_RM" -rf "$_sd_d"
}

# sd_format_changes — read change records (type<TAB>doc<TAB>feature<TAB>shell<TAB>version)
# on stdin and print them human-readably, one per line.
sd_format_changes () {
    while IFS="$SD_TAB" read -r _sd_t _sd_d _sd_f _sd_s _sd_v
    do printf '  %-9s %s :: %s  (%s %s)\n' "$_sd_t" "$_sd_d" "$_sd_f" "$_sd_s" "$_sd_v"
    done
}
