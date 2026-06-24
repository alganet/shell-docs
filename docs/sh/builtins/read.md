<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

read
====

> reads from standard input into a variable _name_

- **read** [_name_]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/read.html)

Basic Usage
-----------

**read** consumes one line from standard input and stores it in the named variable:

Example:

    read my_var <<@
    foo
    @
    echo $my_var

Output:

    foo

Multiple Variables
------------------

Given several names, **read** splits the line on `$IFS` and assigns each field in turn; the last name absorbs whatever remains.

Example:

    read first second <<@
    hello world
    @
    echo "$second $first"

Output:

    world hello

Raw Mode
--------

With **-r**, backslashes in the input are kept literally instead of acting as escape characters.

Example:

    read -r my_var <<@
    a\tb
    @
    printf '%s\n' "$my_var"

Output:

    a\tb

Compatibility
-------------

| Feature            | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:------------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage        | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Multiple Variables | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Raw Mode           | ?1.2.2+ | ?2.01.0+ | 0.4.0+   | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
