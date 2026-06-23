<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

nounset
=======

---

Basic Usage
-----------

Example:

    set -u
    echo hello
    { echo $UNSET; } >/dev/null 2>&1
    echo world

Output:

    hello

Compatibility
-------------

| Feature     | ash     | bash     | brush | dash    | hush | ksh                        | loksh   | mksh  | oksh  | osh | posh     | yash   | yashrs  | zsh    |
|:-----------:|:-------:|:--------:|:-----:|:-------:|:----:|:--------------------------:|:-------:|:-----:|:-----:|:---:|:--------:|:------:|:-------:|:------:|
| Basic Usage | ?1.2.2+ | ?2.01.0+ | -     | ?0.5.3+ | -    | shvrChistory-b_2016-01-10+ | ?6.7.5+ | ?R30+ | ?6.5+ | -   | ?0.12.6+ | ?2.10+ | ?0.3.0+ | 5.0.8+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
