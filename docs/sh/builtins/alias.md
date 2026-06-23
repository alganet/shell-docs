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

    [ -n "${BASH_VERSION:-}" ] && shopt -s expand_aliases # bash requires this
    alias write_output=echo
    write_output Hello
    write_output World

Output:

    Hello
    World

Partial Aliasing
----------------

Some shells have the ability to declare partial aliases, with incomplete shell
commands that are completed once the shell executes:

Example:

    [ -n "${BASH_VERSION:-}" ] && shopt -s expand_aliases # bash requires this
    alias my_foreach='for WORD in'
    my_foreach foo bar baz
    do echo $WORD
    done

Output:

    foo
    bar
    baz

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

| Feature          | ash     | bash     | brush    | dash    | hush | ksh                    | loksh   | mksh  | oksh  | osh      | posh | yash   | yashrs  | zsh     |
|:----------------:|:-------:|:--------:|:--------:|:-------:|:----:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:----:|:------:|:-------:|:-------:|
| Basic Usage      | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | -    | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | -    | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Partial Aliasing | ?1.2.2+ | ?2.01.0+ | -        | ?0.5.3+ | -    | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | -        | -    | 2.15+  | ?0.3.0+ | ?4.0.9+ |
| Listing          | -       | ?2.01.0+ | ?0.2.23+ | -       | -    | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | -        | -    | ?2.10+ | -       | -       |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
