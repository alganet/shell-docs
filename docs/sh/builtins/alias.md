<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

alias
=====

> defines or displays aliases

- **alias** [-p] [_alias-name_=[_string_] ...]

Basic Usage
-----------

When no options are given, **alias** makes it so that future calls to _alias-name_ expand to a given _string_.

Example:

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
        while read -r aliasp
        do case $aliasp in *my_alias*) echo "$aliasp";; esac
        done

Output:

    alias my_alias1='echo 123'
    alias my_alias2='echo 456'

Compatibility
-------------

| Feature       | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2 | -          | >=0.2.23 | >=0.5.10.2 | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | -        | >=2.41   | >=0.3.0  | >=4.2.7 |
| Listing       | -        | >=2.05b.13 | -        | -          | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | -        | -        | >=2.41   | -        | -       |
