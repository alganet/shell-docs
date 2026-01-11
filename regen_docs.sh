#!/bin/sh

# SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>
#
# SPDX-License-Identifier: ISC

_EOL='
'
IFS=

ROOT_DIR="$(cd "$(/bin/dirname "$0")" && /bin/pwd)"

/bin/find docs -name '*.md' | /bin/sort | {
    test_no=1
    max_header_length=0

    while read -r md_file
    do
        line_no=0
        last_line=''
        current_h2=''

        while read -r md_line
        do
            line_no=$((line_no + 1))
            
            if
                test -n "$md_line" &&
                test -z "${md_line##-*}" &&
                test ${#md_line} -eq ${#last_line}
            then
                current_h2="$last_line"
                case $last_line in
                    'Compatibility')
                        last_line=
                        /bin/cat "${ROOT_DIR}/compat/${md_file#${ROOT_DIR}/docs/}"
                        break
                        ;;
                esac
            fi

            test $line_no -lt 2 || printf '%s\n' "$last_line"

            last_line="$md_line"
        done < "$md_file" > "$md_file.new"
        printf '%s' "$last_line" >> "$md_file.new"
        /bin/mv -f "$md_file.new" "$md_file"
    done
}