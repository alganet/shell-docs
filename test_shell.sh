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
        cd "$ROOT_DIR"
        case "$TEST_SHELL" in
            # yash has some weird behavior that makes builtins unavailable if
            # they don't exist in the PATH, so we need to set it for true, test, printf
            # etc even though the internal builtin version is used anyway. Annoying.
            *yash*)
                "$SD_ENV" -i PATH=/bin $TEST_SHELL "$TEST_FILE" > "${TEST_OUTPUT}" 2>&1 || true
                ;;
            *)
                "$SD_ENV" -i PATH= $TEST_SHELL "$TEST_FILE" > "${TEST_OUTPUT}" 2>&1 || true
                ;;
        esac

        if "$SD_DIFF" -u "${TEST_EXPECTED}" "${TEST_OUTPUT}"
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
