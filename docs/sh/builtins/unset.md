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

| Feature             | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage         | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | >=1.25.1 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.45   | >=0.4.5  | >=4.2.7 |
| Unsetting Functions | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | >=1.25.1 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.45   | >=0.4.5  | >=4.2.7 |
