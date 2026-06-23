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
    eval 'word=snake' >/dev/null 2>&1
    echo $word

Output:

    bird
    bird

Compatibility
-------------

| Feature     | ash | bash     | brush  | dash | hush    | ksh                    | loksh | mksh | oksh | osh      | posh | yash       | yashrs | zsh     |
|:-----------:|:---:|:--------:|:------:|:----:|:-------:|:----------------------:|:-----:|:----:|:----:|:--------:|:----:|:----------:|:------:|:-------:|
| Basic Usage | -   | ?2.01.0+ | 0.3.0+ | -    | 1.28.4+ | ?shvrA93uplusm-v1.0.1+ | -     | -    | -    | ?0.25.0+ | -    | ?2.10-2.40 | -      | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
