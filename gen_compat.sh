#!/bin/sh

# SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>
#
# SPDX-License-Identifier: ISC

set -euf

DIRNAME="$(command -v dirname)"
FIND="$(command -v find)"
SORT="$(command -v sort)"
CAT="$(command -v cat)"
CUT="$(command -v cut)"
SED="$(command -v sed)"
HEAD="$(command -v head)"
TOUCH="$(command -v touch)"
TR="$(command -v tr)"
MKDIR="$(command -v mkdir)"

ROOT_DIR="$(cd "$("$DIRNAME" "$0")" && pwd)"

one_tap="$("$FIND" "${ROOT_DIR}/results/opt" -type f -name "tap.txt" -print -quit)"
read -r tap_n < "$one_tap"
tap_n="${tap_n#???}"

"$MKDIR" -p "$ROOT_DIR/compat/tap"
"$CAT" "$one_tap" | {
    while read -r tap_line
    do
        case "$tap_line" in
            'ok '* | 'not ok '* )
                tap_status_number="${tap_line%%-*}"
                tap_status="${tap_status_number%%[0-9]*}"
                tap_status="${tap_status%% }"
                tap_number="${tap_status_number#"$tap_status "}"
                tap_number="${tap_number%% }"
                tap_number=$(printf "%04d\n" $tap_number)
                tap_name="${tap_line#*\-}"
                tap_test="${tap_name%% \|*}"
                tap_test="${tap_test# }"
                tap_env="${tap_test%"test.sh"}vars.env"
                echo $tap_env
                "$MKDIR" -p "$ROOT_DIR/compat/tap/${tap_number}"
                "$CAT" "$tap_env" > "$ROOT_DIR/compat/tap/${tap_number}/vars.env"
                ;;
        esac
    done
}

eval "$(
    "$FIND" "${ROOT_DIR}/results" -name "tap.txt" |
        while read -r result_tap
        do
            result_name="${result_tap#${ROOT_DIR}/results/opt/}"
            result_name="${result_name%%\/*}"
            "$CAT" "$result_tap" | {
                while read -r tap_line
                do
                    case "$tap_line" in
                        ('ok '* | 'not ok '* )
                            tap_status_number="${tap_line%%-*}"
                            tap_status="${tap_status_number%%[0-9]*}"
                            tap_status="${tap_status%% }"
                            tap_number="${tap_status_number#"$tap_status "}"
                            tap_number="${tap_number%% }"
                            case "$tap_status" in
                                ('ok')
                                    echo "tap_pass$tap_number=\"\${tap_pass$tap_number:-}\${tap_pass$tap_number:+ }$result_name\""
                                    ;;
                                ('not ok')
                                    echo "tap_fail$tap_number=\"\${tap_fail$tap_number:-}\${tap_fail$tap_number:+ }$result_name\""
                                    ;;
                            esac
                            ;;
                    esac
                done
            }
        done
)"

current=1
last=$((tap_n + 1))
while test $current -lt $last
do
    current_pad=$(printf "%04d\n" $current)
    eval "tap_pass=\${tap_pass$current:-}"
    "$TOUCH" "$ROOT_DIR/compat/tap/$current_pad/passed.txt"
    for shell in $tap_pass
    do echo "$shell" >> "$ROOT_DIR/compat/tap/$current_pad/passed.txt"
    done

    eval "tap_fail=\${tap_fail$current:-}"
    "$TOUCH" "$ROOT_DIR/compat/tap/$current_pad/failed.txt"
    for shell in $tap_fail
    do echo "$shell" >> "$ROOT_DIR/compat/tap/$current_pad/failed.txt"
    done
    current=$((current + 1))
done

"$FIND" "$ROOT_DIR/compat/tap" -type f -name "*vars.env" | {
    while read -r vars_file
    do
        tap_number="${vars_file#${ROOT_DIR}/compat/tap/}"
        tap_number="${tap_number%%-*}"
        tap_shells=''
        echo $vars_file

        tap_shells="$(
            "$CAT" ${vars_file%"vars.env"}/passed.txt |
                "$CUT" -d_ -f1 |
                "$SORT" -u
        )"

        tap_compat="$(
            for tap_shell in $tap_shells
            do
                printf %s "$tap_shell>="
                "$CAT" ${vars_file%"vars.env"}/passed.txt |
                    "$SED" -n "s/^${tap_shell}_//p" |
                    "$CUT" -d_ -f2 |
                    "$SORT" -V -u |
                    "$HEAD" -n1
            done | "$TR" '\n' ' '
        )"

        echo "TEST_COMPAT='${tap_compat%% }'" >> "${vars_file}"
    done
}

"$FIND" "${ROOT_DIR}/results/opt" -mindepth 2 -maxdepth 2  -type d |
    while read -r shell_dir
    do
        shell_name="${shell_dir#${ROOT_DIR}/results/opt/}"
        shell_name="${shell_name%%_*}"
        "$MKDIR" -p "$ROOT_DIR/compat/shells/$shell_name"
    done

"$FIND" "${ROOT_DIR}/compat/shells" -mindepth 1 -type d |
    while read -r compat_shell
    do
        shell_name="${compat_shell#${ROOT_DIR}/compat/shells/}"
        shell_versions="$("$FIND" "${ROOT_DIR}/results/opt" -mindepth 2 -maxdepth 2 -type d |
            "$SED" -n "s/^.*\/${shell_name}_//p" |
            "$CUT" -d'/' -f1 |
            "$SORT" -V -u |
            "$TR" '\n' ' '
        )"
        max_version_length=${#shell_name}
        for version in $shell_versions
        do
            version_length=${#version}
            if
                test $version_length -gt $max_version_length
            then
                max_version_length=$version_length
            fi
        done
        max_version_length=$((max_version_length + 2))
        echo "TEST_SHELL_VERSIONS='${shell_versions% }'" > "$ROOT_DIR/compat/shells/$shell_name/vars.env"
        echo "TEST_SHELL_VERSION_MAX_LENGTH=$max_version_length" >> "$ROOT_DIR/compat/shells/$shell_name/vars.env"
    done

results_shells="$(
    "$FIND" "${ROOT_DIR}/compat/shells" -mindepth 1 -type d |
        while read -r compat_shell
        do
            shell_name="${compat_shell#${ROOT_DIR}/compat/shells/}"
            echo $shell_name
        done |
            "$SORT"
)"

"$MKDIR" -p "$ROOT_DIR/compat/docs"

printf '' > "$ROOT_DIR/compat/docs/shells.txt"
printf '' > "$ROOT_DIR/compat/docs/headers.txt"

for shell in $results_shells
do
    . "$ROOT_DIR/compat/shells/$shell/vars.env"
    printf "| %-${TEST_SHELL_VERSION_MAX_LENGTH}s " "$shell" >> "$ROOT_DIR/compat/docs/shells.txt"
    printf "|:%s:" "$(printf '%*s' "$TEST_SHELL_VERSION_MAX_LENGTH" '' | "$SED" 's/ /-/g')" >> "$ROOT_DIR/compat/docs/headers.txt"
done

echo '|' >> "$ROOT_DIR/compat/docs/shells.txt"
echo '|' >> "$ROOT_DIR/compat/docs/headers.txt"

table_shells="$("$CAT" "$ROOT_DIR/compat/docs/shells.txt")"
table_headers="$("$CAT" "$ROOT_DIR/compat/docs/headers.txt")"

"$FIND" "${ROOT_DIR}/docs" -name '*.md' | {
    while read -r md_file
    do
        compat_md="${md_file#${ROOT_DIR}/docs/}"
        . "${ROOT_DIR}/compat/docs/${compat_md%.md}.vars"
        echo 'Compatibility' > "${ROOT_DIR}/compat/docs/$compat_md"
        echo '-------------' >> "${ROOT_DIR}/compat/docs/$compat_md"
        echo '' >> "${ROOT_DIR}/compat/docs/$compat_md"

        printf "| %-${TEST_MAX_HEADER_LENGTH}s " "Feature" >> "${ROOT_DIR}/compat/docs/$compat_md"
        echo "$table_shells" >> "${ROOT_DIR}/compat/docs/$compat_md"
        printf "|:%s:" "$(printf '%*s' "$TEST_MAX_HEADER_LENGTH" '' | "$SED" 's/ /-/g')" >> "${ROOT_DIR}/compat/docs/$compat_md"
        echo $table_headers >> "${ROOT_DIR}/compat/docs/$compat_md"
    done
}

"$FIND" "${ROOT_DIR}/compat/tap" -type f -name "vars.env" | "$SORT" | {
    while read -r vars_file
    do
        . "$vars_file"
        . "${ROOT_DIR}/compat/${TEST_DOC_FILE%.md}.vars"
        test_name_pad=$(printf "%-${TEST_MAX_HEADER_LENGTH}s" "$TEST_NAME")
        printf '%s' "| $test_name_pad " >> "${ROOT_DIR}/compat/${TEST_DOC_FILE}"

        for shell in $results_shells
        do
            . "${ROOT_DIR}/compat/shells/$shell/vars.env"
            shell_cell=" ${TEST_COMPAT} "
            shell_cell="${shell_cell#* $shell>=}"
            shell_cell="${shell_cell%% *}"
            if test -n "$shell_cell"
            then
                printf "| %-${TEST_SHELL_VERSION_MAX_LENGTH}s " ">=$shell_cell" >> "${ROOT_DIR}/compat/${TEST_DOC_FILE}"
            else
                printf "| %-${TEST_SHELL_VERSION_MAX_LENGTH}s " "-" >> "${ROOT_DIR}/compat/${TEST_DOC_FILE}"
            fi
        done

        echo '|' >> "${ROOT_DIR}/compat/${TEST_DOC_FILE}"
    done
}
