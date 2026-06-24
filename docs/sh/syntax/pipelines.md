<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

Pipelines
=========

> connects the standard output of one command to the standard input of the next

- _command_ **|** _command_...

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_09_02)

Basic Usage
-----------

A pipe `|` sends the output of the command on its left to the input of the
command on its right.

Example:

    echo hello | tr a-z A-Z

Output:

    HELLO

Multiple Stages
---------------

A pipeline can chain any number of commands, each transforming the previous
one's output.

Example:

    printf 'banana\napple\ncherry\n' | sort | head -1

Output:

    apple

Compatibility
-------------

| Feature         | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:---------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage     | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Multiple Stages | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
