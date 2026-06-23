#!/bin/sh

# SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>
#
# SPDX-License-Identifier: ISC

set -euf

SD_SELF="$0"
. "$(cd "$(dirname "$0")" && pwd)/lib.sh"
sd_init_tools
ROOT_DIR="$(sd_root_dir "$SD_SELF")"

TEST_LIST="$("$SD_FIND" "${ROOT_DIR}/tests" -name '*vars.env' | "$SD_SORT")"
TEST_COUNT="$(echo "$TEST_LIST" | "$SD_WC" -l)"
TEST_SHELL="${TEST_SHELL:-${SHELL:-$SD_SH}}"

test_shell () {
    RUN_COUNT=0
    PASS_COUNT=0
    SKIP_COUNT=0
    echo "1..${TEST_COUNT}"
    while read -r TEST_ENV
    do
        RUN_COUNT=$((RUN_COUNT + 1))
        . "${TEST_ENV}"

        # Run in a fresh empty directory so unquoted globs in an example cannot
        # match repo files (keeps results reproducible). A uniform, minimal
        # environment is given to every shell: HOME so tilde expansion works, and
        # a real PATH so absolute-path coretools resolve and yash's semi-special
        # builtins (printf, test, ...) stay enabled. Only stdout is captured;
        # examples opt into stderr with their own redirections.
        _wd="$("$SD_MKTEMP" -d)"
        (
            cd "$_wd" &&
            "$SD_ENV" -i HOME=/home/shelldocs PATH=/bin:/usr/bin \
                $TEST_SHELL "$ROOT_DIR/$TEST_FILE" > "$ROOT_DIR/$TEST_OUTPUT" 2>/dev/null
        ) || true
        "$SD_RM" -rf "$_wd"

        if "$SD_DIFF" -u "$ROOT_DIR/$TEST_EXPECTED" "$ROOT_DIR/$TEST_OUTPUT"
        then
            printf 'ok'
            PASS_COUNT=$((PASS_COUNT + 1))
        else
            printf 'not ok'
        fi
        echo \ $RUN_COUNT - $TEST_FILE \| $TEST_DOC_FILE:$TEST_DOC_EXAMPLE_LINE \| $TEST_NAME
    done
    if ! test $(($PASS_COUNT + SKIP_COUNT)) -eq "$TEST_COUNT"
    then exit 1
    fi
}

echo "$TEST_LIST" | test_shell
