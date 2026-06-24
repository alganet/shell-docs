<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

printf
======

> writes its arguments under the control of a _format_ string

- **printf** _format_ [_argument_...]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/printf.html)

Basic Usage
-----------

`printf` substitutes each `%s` in the format with the next argument, and unlike
`echo` it never adds a newline of its own.

Example:

    printf '%s and %s\n' apples oranges

Output:

    apples and oranges

Format Specifiers
-----------------

Other specifiers format a value by type — `%d`, for instance, formats an
integer.

Example:

    printf '%s scored %d\n' Ana 95

Output:

    Ana scored 95

Escape Sequences
----------------

Backslash escapes such as `\n` are interpreted within the format string.

Example:

    printf 'one\ntwo\n'

Output:

    one
    two

Argument Reuse
--------------

When there are more arguments than the format consumes, the whole format is
reused until they run out.

Example:

    printf '%s\n' x y z

Output:

    x
    y
    z

Compatibility
-------------

| Feature           | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:-----------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage       | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Format Specifiers | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Escape Sequences  | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Argument Reuse    | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
