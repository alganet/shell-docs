<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

Here-Documents
==============

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_07_04)

Basic Usage
-----------

Example:

    /bin/cat <<MYDOC
    hello
    world
    MYDOC
    

Output:

    hello
    world

Indented Here-Docs
------------------

In indented here-docs `<<-`, any TAB character at the beginning of each line
is ignored.

Example:

    /bin/cat <<-MYDOC
    		hello
    	world
    MYDOC
    

Output:

    hello
    world

Compatibility
-------------

| Feature            | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:------------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage        | >=1.25.1 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | >=1.25.1 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.45   | >=0.3.0  | >=4.2.7 |
| Indented Here-Docs | >=1.25.1 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | >=1.25.1 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.45   | >=0.3.0  | >=4.2.7 |
