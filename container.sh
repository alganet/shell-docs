#!/bin/sh

# SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>
#
# SPDX-License-Identifier: ISC

set -euf

DIRNAME="$(command -v dirname)"
RM="$(command -v rm)"
MKDIR="$(command -v mkdir)"
FIND="$(command -v find)"
GREP="$(command -v grep)"
SED="$(command -v sed)"
SORT="$(command -v sort)"
CHMOD="$(command -v chmod)"
CAT="$(command -v cat)"
SH="$(command -v sh)"

ROOT_DIR="$(cd "$("$DIRNAME" "$0")" && pwd)"

container_run () {
    "$RM" -rf "$ROOT_DIR/results"
    "$MKDIR" -p "$ROOT_DIR/results"

    docker run --rm \
        -v"${PWD}/container_shells.txt:/wdir/container_shells.txt" \
        -v"${PWD}/container.sh:/wdir/container.sh" \
        -v"${PWD}/results:/wdir/results" \
        -v"${PWD}/test_shell.sh:/wdir/test_shell.sh" \
        -v"${PWD}/tests:/wdir/tests" \
        -w"/wdir" \
        alganet/shell-versions:all \
        /bin/sh container.sh _all_shells_
}

container_failures () {
    "$FIND" "${ROOT_DIR}/results" \
        -type f \
        -name "tap.txt" \
        -exec "$GREP" "^not ok" {} \; |
            "$SED" "s|^.* - ||" |
                "$SORT"
}

container__all_shells_ () {
    "$CAT" "$ROOT_DIR/container_shells.txt" | {
        while read -r TEST_SHELL
        do
            cd "$ROOT_DIR"
            export TEST_SHELL
            "$MKDIR" -p "$ROOT_DIR/results$TEST_SHELL"
            {
                "$SH" "${ROOT_DIR}/test_shell.sh" > "$ROOT_DIR/results/$TEST_SHELL/tap.txt"
            } || true
            echo $TEST_SHELL
        done
    }

    "$CHMOD" -R 0777 "$ROOT_DIR/results"
}


container_"${1:-run}"
