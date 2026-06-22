<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

false
=====

> sets the exit code to 1 (generic error)

- **false**

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/false.html)

Basic Usage
-----------

Example:

    false
    echo $?

Output:

    1

Compatibility
-------------

| Feature       | ash       | bash       | brush    | dash       | hush      | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:---------:|:----------:|:--------:|:----------:|:---------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.37.0  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
