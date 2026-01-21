<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

type
====

> write a description of command type

- **type** _name_...

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/type.html)

Basic Usage
-----------

Example:

    case $(type eval) in
        *builtin* | *built-in*)
            echo "eval is a shell builtin" ;;
    esac

Output:

    eval is a shell builtin

Compatibility
-------------

| Feature       | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | >=1.25.1 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | -        | >=2.41   | >=0.3.0  | >=4.2.7 |
