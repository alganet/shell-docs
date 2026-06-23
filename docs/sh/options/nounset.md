<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

nounset
=======

> treats the expansion of an unset variable as an error

- **set** -u

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#set)

Basic Usage
-----------

With `set -u`, expanding an unset variable is an error rather than an empty
string; here that failure is contained in a subshell and caught.

Example:

    set -u
    echo defined is ok
    ( echo "$UNDEFINED" ) 2>/dev/null || echo "unset variable is rejected"

Output:

    defined is ok
    unset variable is rejected

Compatibility
-------------

| Feature     | ash     | bash     | brush  | dash    | hush | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:-----------:|:-------:|:--------:|:------:|:-------:|:----:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage | ?1.2.2+ | ?2.01.0+ | 0.4.0+ | ?0.5.3+ | -    | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
