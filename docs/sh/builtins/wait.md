<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

wait
====

> await process completion

- **wait** [_pid_]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/wait.html)

Basic Usage
-----------

Example:

    { echo 1; } &
    wait

Output:

    1

Compatibility
-------------

| Feature       | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | >=1.25.1 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.29.0 | >=0.12.6 | >=2.45   | >=0.4.5  | >=4.2.7 |
