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

    while read -r md_file
    do
        section=''
        example=''
        output=''
        last_line=''
        line_no=0
        current_h2=''
        current_h2_line=0
        example_line=0
        max_header_length=0

        while read -r md_line
        do
            line_no=$((line_no + 1))
            case "$md_line" in
                'Example:')
                    section='example'
                    example_line=$((line_no + 2))
                    ;;
                'Output:')
                    section='output'
                    ;;
                '')
                    case "$section" in
                        example)
                            case "$example" in 
                                '')
                                    ;;
                                *)
                                    section=''
                                    ;; 
                            esac
                            ;;
                        output)
                            case "$output" in 
                                '')
                                    ;;
                                *)
                                    test_nopad=$(printf "%04d\n" $test_no)
                                    test_dir="tests/$test_nopad"
                                    mkdir -p "$test_dir"

                                    {
                                        echo "TEST_DOC_FILE='$md_file'"
                                        echo "TEST_DOC_LINE=$current_h2_line"
                                        echo "TEST_DOC_EXAMPLE_LINE=$example_line"
                                        echo "TEST_NAME='$current_h2'"
                                        echo "TEST_FILE='${test_dir}/test.sh'"
                                        echo "TEST_EXPECTED='${test_dir}/expected.txt'"
                                        echo "TEST_OUTPUT='${test_dir}/output.txt'"
                                    } > "${test_dir}/vars.env"
                                    {
                                        printf '%s\n' "$example"
                                    } > "${test_dir}/test.sh"
                                    {
                                        printf '%s\n' "$output"
                                    } > "${test_dir}/expected.txt"

                                    section=''
                                    example=''
                                    output=''
                                    test_no=$((test_no + 1))
                                    ;;
                            esac 
                            ;;
                    esac
                    ;;
                *)
                    case "$section" in
                        example)
                            example="${example}${example:+$_EOL}${md_line#"    "}"
                            ;;
                        output)
                            output="${output}${output:+$_EOL}${md_line#"    "}"
                            ;;
                        '')
                            if
                                test -n "$md_line" &&
                                test -z "${md_line##-*}" &&
                                test ${#md_line} -eq ${#last_line}
                            then
                                current_h2="$last_line"
                                current_h2_line=$((line_no - 1))
                                current_h2_length=${#current_h2}
                                if
                                    test $current_h2_length -gt $max_header_length
                                then
                                    max_header_length=$current_h2_length
                                fi
                            fi
                            last_line="$md_line"
                            ;;
                    esac
            esac
            # printf '%s\n' "$md_line"
        done < "$md_file" # > "$md_file.new"
        info_file="${md_file#${ROOT_DIR}/docs/}"
        info_file="${info_file%.md}.vars"
        info_file="${ROOT_DIR}/compat/${info_file}"
        mkdir -p "${info_file%/*}"
        echo TEST_MAX_HEADER_LENGTH=$max_header_length > "$info_file"
    done
}