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

Compatibility
-------------

| Feature       | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | -        | >=2.05b.13 | >=0.2.23 | -          | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | -        | >=2.45   | >=0.4.5  | >=4.2.7 |
