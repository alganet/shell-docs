<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

popd
=====

> removes _dir_ to the directory stack

- **popd**

---

Basic Usage
-----------

Example:

    pwd
    pushd /tmp >/dev/null 2>&1
    pwd
    popd
    pwd

Output:

    /wdir
    /tmp
    /wdir
    /wdir

Non-Printing Variant
--------------------

Some shells instead provide a non-printing variant of pushd.

Example:

    pwd
    pushd /tmp >/dev/null 2>&1
    pwd
    popd
    pwd

Output:

    /wdir
    /tmp
    /wdir

Compatibility
-------------

| Feature              | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:--------------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage          | -        | >=2.05b.13 | >=0.2.23 | -          | -        | -                           | -       | -      | -       | >=0.25.0 | -        | >=2.45   | -        | -       |
| Non-Printing Variant | -        | -          | -        | -          | -        | -                           | -       | -      | -       | -        | -        | -        | -        | >=4.2.7 |
