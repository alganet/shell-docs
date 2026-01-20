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

Example:

    command echo 123

Output:

    123

Builtin Search
--------------

Passing `-v` to `command` with an existing builtin name displays that builtin name.

Example:

    command -v echo
    command -v non_existent || echo "non_existent does not exist"

Output:

    echo
    non_existent does not exist

Compatibility
-------------

| Feature        | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:--------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage    | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | >=1.29.3 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.41   | >=0.3.0  | -       |
| Builtin Search | >=1.27.2 | >=3.1.23   | >=0.2.23 | >=0.5.10.2 | >=1.29.3 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | -        | >=0.14.2 | -        | -        | >=4.2.7 |
