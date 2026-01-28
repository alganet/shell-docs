<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

unset
=====

> removes an alias declaration by _name_ if it exists

- **unalias** _name_ [_name_...]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/unalias.html)

Basic Usage
-----------

Example:

    shopt -s expand_aliases >/dev/null 2>&1 # bash requires this
    alias my_alias1='echo 123'
    my_alias1
    unalias my_alias1
    if ! command -v my_alias1 >/dev/null 2>&1
    then echo 'alias not found'
    fi

Output:

    123
    alias not found

Compatibility
-------------

| Feature       | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | -        | >=2.45   | >=0.3.0  | >=4.2.7 |
