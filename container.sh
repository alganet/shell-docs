#!/bin/sh

# SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>
#
# SPDX-License-Identifier: ISC

set -euf

SD_SELF="$0"
. "$(cd "$(dirname "$0")" && pwd)/lib.sh"
sd_init_tools
ROOT_DIR="$(sd_root_dir "$SD_SELF")"

container_run () {
    "$SD_RM" -rf "$ROOT_DIR/results"
    "$SD_MKDIR" -p "$ROOT_DIR/results"

    docker run --rm \
        -v"${PWD}/container_shells.txt:/wdir/container_shells.txt" \
        -v"${PWD}/container.sh:/wdir/container.sh" \
        -v"${PWD}/lib.sh:/wdir/lib.sh" \
        -v"${PWD}/results:/wdir/results" \
        -v"${PWD}/test_shell.sh:/wdir/test_shell.sh" \
        -v"${PWD}/tests:/wdir/tests" \
        -w"/wdir" \
        alganet/shell-versions:all \
        /bin/sh container.sh _all_shells_
}

container_failures () {
    "$SD_FIND" "${ROOT_DIR}/results" \
        -type f \
        -name "tap.txt" \
        -exec "$SD_GREP" "^not ok" {} \; |
            "$SD_SED" "s|^.* - ||" |
                "$SD_SORT"
}

container__all_shells_ () {
    "$SD_CAT" "$ROOT_DIR/container_shells.txt" | {
        while read -r TEST_SHELL
        do
            cd "$ROOT_DIR"
            export TEST_SHELL
            "$SD_MKDIR" -p "$ROOT_DIR/results$TEST_SHELL"
            {
                "$SD_SH" "${ROOT_DIR}/test_shell.sh" > "$ROOT_DIR/results/$TEST_SHELL/tap.txt"
            } || true
            echo $TEST_SHELL
        done
    }

    "$SD_CHMOD" -R 0777 "$ROOT_DIR/results"
}


container_"${1:-run}"
