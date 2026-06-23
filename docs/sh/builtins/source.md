<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

source
======

> execute commands in the current environment

- **source** [_file_]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_19)

Source is an alias to [dot](dot.md) in some shells.

Basic Usage
-----------

Example:

    echo 'echo Hello New File' > /tmp/newfile.sh
    source /tmp/newfile.sh
    /bin/rm /tmp/newfile.sh

Output:

    Hello New File

Compatibility
-------------

| Feature     | ash     | bash     | brush    | dash | hush     | ksh                    | loksh | mksh  | oksh | osh      | posh | yash | yashrs  | zsh     |
|:-----------:|:-------:|:--------:|:--------:|:----:|:--------:|:----------------------:|:-----:|:-----:|:----:|:--------:|:----:|:----:|:-------:|:-------:|
| Basic Usage | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | -    | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | -     | R31d+ | -    | ?0.25.0+ | -    | -    | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
