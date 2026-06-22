<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

local
=====

> declares a local variable _name_ with an optional _value_.

- **local** _name_[=_value_]

This builtin is non-standard but widely available.

Basic Usage
-----------

**local** is meant to be used within functions:

Example:

    my_func () {
        local name="$1"
        echo Hello $name
    }
    my_func World
    echo "name should be empty: $name."

Output:

    Hello World
    name should be empty: .

Compatibility
-------------

| Feature       | ash       | bash       | brush    | dash       | hush      | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:---------:|:----------:|:--------:|:----------:|:---------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | -                           | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.48   | -        | >=4.0.9 |
