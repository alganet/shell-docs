#!/bin/sh

# SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>
#
# SPDX-License-Identifier: ISC

set -euf

ROOT_DIR="$(cd "$(/bin/dirname "$0")" && /bin/pwd)"
TEST_LIST="$(/bin/find "${ROOT_DIR}/tests" -name '*vars.env' | /bin/sort)"
TEST_COUNT="$(echo "$TEST_LIST" | /bin/wc -l)"
TEST_SHELL="${TEST_SHELL:-${SHELL:-/bin/sh}}"

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
        /bin/env -i PATH= $TEST_SHELL "$TEST_FILE" > "${TEST_OUTPUT}" 2>&1 || true

        if /bin/diff -u "${TEST_EXPECTED}" "${TEST_OUTPUT}"
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