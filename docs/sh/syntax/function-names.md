<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

Function Names
==============

---

Basic Usage
-----------

Example:

    my_name () { echo 123; }
    my_name

Output:

    123

Hyphenated Names
----------------

Example:

    my-name () { echo 123; }
    my-name

Output:

    123

Compatibility
-------------

| Feature          | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:----------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage      | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | >=1.25.1 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.45   | >=0.4.5  | >=4.2.7 |
| Hyphenated Names | >=1.37.0 | >=2.05b.13 | >=0.2.23 | -          | >=1.25.1 | -                           | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | -        | -        | >=0.4.5  | >=4.2.7 |
