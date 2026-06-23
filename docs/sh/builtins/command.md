<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

command
=======

> execute or obtain information about a simple command _name_

- **command** [-v] [_name_...]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/command.html)

Basic Usage
-----------

`command` without any options invoke its parameters as a command:

Example:

    command echo 123

Output:

    123

Builtin Search
--------------

Passing `-v` to `command` with an existing builtin name displays that builtin name.

Example:

    command -v echo
    command -v non_existent >/dev/null 2>&1 || echo "non_existent does not exist"

Output:

    echo
    non_existent does not exist

Compatibility
-------------

| Feature        | ash     | bash     | brush    | dash    | hush    | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh    |
|:--------------:|:-------:|:--------:|:--------:|:-------:|:-------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:------:|
| Basic Usage    | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | 1.29.3+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | -      |
| Builtin Search | ?1.2.2+ | 2.04.0+  | ?0.2.23+ | ?0.5.3+ | 1.29.3+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | 0.14.5+  | -      | -       | 4.2.7+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
