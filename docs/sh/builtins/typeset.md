<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

typeset
=======

> declares a variable _name_ with an optional _value_.

- **typeset** _name_[=_value_]

This builtin is non-standard but widely available.

Basic Usage
-----------

Example:

    typeset name="World"
    echo Hello $name

Output:

    Hello World

Function Introspection
----------------------

Example:

    foo () { true; }
    typeset -f foo | /bin/tr -d ' \n\t'
    echo

Output:

    foo(){true}

Compatibility
-------------

| Feature                | ash       | bash       | brush    | dash       | hush      | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:----------------------:|:---------:|:----------:|:--------:|:----------:|:---------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage            | -         | >=2.01.0   | >=0.2.23 | -          | -         | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | -        | >=2.10   | >=0.3.0  | >=4.0.9 |
| Function Introspection | -         | >=2.01.0   | >=0.2.23 | -          | -         | -                           | >=6.7.5 | >=R30  | >=6.5   | -        | -        | -        | -        | >=4.0.9 |
