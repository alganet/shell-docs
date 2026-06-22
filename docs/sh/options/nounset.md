<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

nounset
=======

---

Basic Usage
-----------

Example:

    set -u
    echo hello
    { echo $UNSET; } >/dev/null 2>&1
    echo world

Output:

    hello

Compatibility
-------------

| Feature       | ash       | bash       | brush    | dash       | hush      | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:---------:|:----------:|:--------:|:----------:|:---------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2  | >=2.01.0   | -        | >=0.5.3    | -         | >=2016-01-10                | >=6.7.5 | >=R30  | >=6.5   | -        | >=0.12.6 | >=2.10   | >=0.3.0  | >=5.0.8 |
