<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

Parameter Expansion
===================

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02)

Basic Usage
-----------

Example:

    my_param=hello
    echo ${my_param}

Output:

    hello

Default Value
-------------

Example:

    my_param=
    echo ${my_param:-world}

Output:

    world

Default Assignment
------------------

Example:

    my_param=
    echo ${my_param:=world}
    echo $my_param

Output:

    world
    world

Alternative if Present
----------------------

Example:

    my_param=hello
    echo ${my_param:+world}

Output:

    world

Remove Smallest Prefix
----------------------

Example:

    my_param=foo-bar-example
    echo ${my_param#*-}

Output:

    bar-example

Remove Largest Prefix
---------------------

Example:

    my_param=foo-bar-example
    echo ${my_param##*-}

Output:

    example

Remove Smallest Suffix
----------------------

Example:

    my_param=example-foo-bar
    echo ${my_param%-*}

Output:

    example-foo

Remove Largest Suffix
---------------------

Example:

    my_param=example-foo-bar
    echo ${my_param%%-*}

Output:

    example

Compatibility
-------------

| Feature                | ash       | bash       | brush    | dash       | hush      | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:----------------------:|:---------:|:----------:|:--------:|:----------:|:---------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage            | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
| Default Value          | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
| Default Assignment     | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
| Alternative if Present | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
| Remove Smallest Prefix | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
| Remove Largest Prefix  | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
| Remove Smallest Suffix | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
| Remove Largest Suffix  | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
