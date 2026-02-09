<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

Arithmetic Expansion
====================

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_06_04)

Basic Usage
-----------

Example:

    echo $((4 * 3 / 2 + 1 - 0))

Output:

    7

Compatibility
-------------

| Feature       | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.45   | >=0.4.5  | >=4.2.7 |
