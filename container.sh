#!/bin/sh

# SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>
#
# SPDX-License-Identifier: ISC

set -euf
ROOT_DIR="$(cd "$(/bin/dirname "$0")" && /bin/pwd)"

container_run () {
    /bin/rm -rf "$ROOT_DIR/results"
    /bin/mkdir -p "$ROOT_DIR/results"

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
    /bin/find "${ROOT_DIR}/results" \
        -type f \
        -name "tap.txt" \
        -exec /bin/grep "^not ok" {} \; |
            /bin/sed "s|^.* - ||" |
                /bin/sort
}

container__all_shells_ () {
    cat "$ROOT_DIR/container_shells.txt" | {
        while read -r TEST_SHELL
        do
            cd "$ROOT_DIR"
            export TEST_SHELL
            /bin/mkdir -p "$ROOT_DIR/results$TEST_SHELL"
            {
                /bin/sh "${ROOT_DIR}/test_shell.sh" > "$ROOT_DIR/results/$TEST_SHELL/tap.txt"
            } || true
            echo $TEST_SHELL
        done
    }

    /bin/chmod -R 0777 "$ROOT_DIR/results"
}


container_"${1:-run}"