<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

unset
=====

> removes a variable or function declaration by _name_ if it exists

- **unset** [-vf] _name_ [_name_...]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#unset)

Basic Usage
-----------

**unset** removes a variable so referencing it afterwards yields an empty value:

Example:

    my_var="foo"
    echo Value: $my_var
    unset my_var
    echo Value: $my_var

Output:

    Value: foo
    Value:

Unsetting Functions
-------------------

With **-f**, **unset** removes a function definition rather than a variable:

Example:

    foo () { echo foo; }
    foo
    unset -f foo
    foo >/dev/null 2>&1 || echo 'foo does not exist'

Output:

    foo
    foo does not exist

Compatibility
-------------

| Feature             | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:-------------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage         | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Unsetting Functions | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
