<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

alias
=====

> defines or displays aliases

- **alias** [-p] [_alias-name_=[_string_] ...]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/alias.html)

Basic Usage
-----------

When no options are given, **alias** makes it so that future calls to _alias-name_ expand to a given _string_.

Example:

    shopt -s expand_aliases >/dev/null 2>&1 # bash requires this
    alias write_output=echo
    write_output Hello
    write_output World

Output:

    Hello
    World

Listing
-------

Example:

    alias my_alias1='echo 123'
    alias my_alias2='echo 456'
    alias -p |
        /bin/grep my_alias |
        /bin/sort

Output:

    alias my_alias1='echo 123'
    alias my_alias2='echo 456'

Compatibility
-------------

| Feature       | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | -        | >=2.41   | >=0.3.0  | >=4.2.7 |
| Listing       | -        | >=2.05b.13 | >=0.2.23 | -          | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | -        | -        | >=2.41   | -        | -       |
