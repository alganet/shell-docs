<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

getopts
=======

> parses the positional parameters as single-letter options

- **getopts** _optstring_ _name_ [_arg_...]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/getopts.html)

Basic Usage
-----------

`getopts` walks the positional parameters one option at a time, setting _name_ to
each option letter until there are none left.

Example:

    set -- -a -b
    while getopts ab opt
    do
        echo "got $opt"
    done

Output:

    got a
    got b

Options With Arguments
----------------------

A `:` after a letter in the option string means that option takes a value, which
`getopts` places in `$OPTARG`.

Example:

    set -- -f file.txt
    while getopts f: opt
    do
        echo "$opt = $OPTARG"
    done

Output:

    f = file.txt

Compatibility
-------------

| Feature                | ash     | bash     | brush  | dash    | hush    | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:----------------------:|:-------:|:--------:|:------:|:-------:|:-------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage            | ?1.2.2+ | ?2.01.0+ | 0.4.0+ | ?0.5.3+ | 1.28.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Options With Arguments | ?1.2.2+ | ?2.01.0+ | 0.4.0+ | ?0.5.3+ | 1.28.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
