<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

popd
=====

> removes the top entry from the directory stack and changes to the new top

- **popd**

---

[Bash Specification](https://www.gnu.org/software/bash/manual/html_node/Directory-Stack-Builtins.html#index-popd)

Basic Usage
-----------

Example:

    cd /tmp
    pwd
    pushd / >/dev/null 2>&1
    pwd
    popd
    pwd

Output:

    /tmp
    /
    /tmp
    /tmp

Non-Printing Variant
--------------------

Some shells instead provide a non-printing variant of pushd.

Example:

    cd /tmp
    pwd
    pushd / >/dev/null 2>&1
    pwd
    popd
    pwd

Output:

    /tmp
    /
    /tmp

Compatibility
-------------

| Feature              | ash | bash     | brush    | dash | hush | ksh | loksh | mksh | oksh | osh      | posh | yash   | yashrs | zsh     |
|:--------------------:|:---:|:--------:|:--------:|:----:|:----:|:---:|:-----:|:----:|:----:|:--------:|:----:|:------:|:------:|:-------:|
| Basic Usage          | -   | ?2.01.0+ | ?0.2.23+ | -    | -    | -   | -     | -    | -    | ?0.25.0+ | -    | ?2.10+ | -      | -       |
| Non-Printing Variant | -   | -        | -        | -    | -    | -   | -     | -    | -    | -        | -    | -      | -      | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
