<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

noglob
======

> disables pathname expansion (globbing)

- **set** -f

---

Basic Usage
-----------

Example:

    /bin/rm -rf my-dir
    /bin/mkdir -p my-dir
    : > my-dir/a
    echo my-dir/*
    set -f
    echo my-dir/*
    set +f
    /bin/rm -rf my-dir

Output:

    my-dir/a
    my-dir/*

Quoted pattern is unchanged
---------------------------

Example:

    /bin/rm -rf my-dir
    /bin/mkdir -p my-dir
    : > my-dir/a
    set -f
    echo "my-dir/*"
    set +f
    /bin/rm -rf my-dir

Output:

    my-dir/*

Compatibility
-------------

| Feature                     | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:---------------------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage                 | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.45   | >=0.4.5  | -       |
| Quoted pattern is unchanged | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.45   | >=0.4.5  | >=4.2.7 |
