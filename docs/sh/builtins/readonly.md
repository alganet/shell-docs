<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

readonly
========

> declares a read-only variable _name_

- **readonly** _name_[=_value_]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#readonly)

Basic Usage
-----------

Example:

    readonly word=bird
    echo $word
    ( word=snake ) 2>/dev/null || echo "word is read-only"
    echo $word

Output:

    bird
    word is read-only
    bird

Compatibility
-------------

| Feature     | ash     | bash     | brush  | dash    | hush    | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:-----------:|:-------:|:--------:|:------:|:-------:|:-------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage | ?1.2.2+ | 2.05a.0+ | 0.4.0+ | ?0.5.3+ | 1.28.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
