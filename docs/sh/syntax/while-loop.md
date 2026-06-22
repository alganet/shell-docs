<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

While Loop
==========

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_09_04_09)

Basic Usage
-----------

Example:

    c=.
    while test "$c" != '...'
    do c="${c}."
    done
    echo "${c}Done"

Output:

    ...Done

Exit Behavior
-------------

When a condition for the while loop fails, the shell should not exit afterwards.

Example:

    set -e
    c=.
    while test "$c" != '...'
    do c="${c}."
    done
    echo "${c}Done"

Output:

    ...Done

Compatibility
-------------

| Feature       | ash       | bash       | brush    | dash       | hush      | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:---------:|:----------:|:--------:|:----------:|:---------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
| Exit Behavior | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | -         | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
