<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

pushd
=====

> add _dir_ to the directory stack

- **pushd** _dir_

---

Basic Usage
-----------

Example:

    pwd
    pushd /tmp
    pwd

Output:

    /wdir
    /tmp /wdir
    /tmp

Non-Printing Variant
--------------------

Some shells instead provide a non-printing variant of pushd.

Example:

    pwd
    pushd /tmp
    pwd

Output:

    /wdir
    /tmp


Compatibility
-------------

| Feature              | ash | bash     | brush    | dash | hush | ksh | loksh | mksh | oksh | osh      | posh | yash  | yashrs | zsh     |
|:--------------------:|:---:|:--------:|:--------:|:----:|:----:|:---:|:-----:|:----:|:----:|:--------:|:----:|:-----:|:------:|:-------:|
| Basic Usage          | -   | ?2.01.0+ | ?0.2.23+ | -    | -    | -   | -     | -    | -    | ?0.25.0+ | -    | -     | -      | -       |
| Non-Printing Variant | -   | -        | -        | -    | -    | -   | -     | -    | -    | -        | -    | 2.22+ | -      | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
