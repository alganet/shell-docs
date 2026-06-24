<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

$- special parameter
====================

> the option flags currently set in the shell

- **$-**

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_05_02)

Basic Usage
-----------

`$-` lists the single-letter option flags that are active, so a `case` can test whether one is on.

Example:

    set -f
    case $- in *f*) echo "noglob on";; esac

Output:

    noglob on

Compatibility
-------------

| Feature     | ash     | bash     | brush    | dash    | hush | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash  | yashrs  | zsh     |
|:-----------:|:-------:|:--------:|:--------:|:-------:|:----:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:-----:|:-------:|:-------:|
| Basic Usage | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | -    | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | 2.11+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
