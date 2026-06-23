<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

Tilde Expansion
===============

---

Basic Usage
-----------

Example:

    echo ~

Output:

    /root

Compatibility
-------------

| Feature     | ash | bash     | brush    | dash | hush | ksh                                      | loksh | mksh | oksh | osh      | posh | yash | yashrs | zsh     |
|:-----------:|:---:|:--------:|:--------:|:----:|:----:|:----------------------------------------:|:-----:|:----:|:----:|:--------:|:----:|:----:|:------:|:-------:|
| Basic Usage | -   | ?2.01.0+ | ?0.2.23+ | -    | -    | ?shvrA93uplusm-v1.0.1-shvrB2020-2020.0.0 | -     | -    | -    | ?0.25.0+ | -    | -    | -      | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
