<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

export
======

> marks a _name_ so its value is passed to the environment of child processes

- **export** _name_[=_value_]...

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#export)

Basic Usage
-----------

Exporting a variable places it in the environment, so any command the shell
then runs inherits its value.

Example:

    export GREETING=hi
    /bin/sh -c 'echo $GREETING'

Output:

    hi

Mark Existing Variable
----------------------

A variable can be assigned first and exported afterwards; `export` then marks
the existing name for the environment.

Example:

    GREETING=hello
    export GREETING
    /bin/sh -c 'echo $GREETING'

Output:

    hello

Compatibility
-------------

| Feature                | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:----------------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage            | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Mark Existing Variable | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
