<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

typeset
=======

> declares a variable _name_ with an optional _value_.

- **typeset** _name_[=_value_]

This builtin is non-standard but widely available.

[ksh Specification](https://cdesktopenv.sourceforge.io/man1/ksh.html#sect35)

Basic Usage
-----------

**typeset** declares a variable and optionally assigns it a value:

Example:

    typeset name="World"
    echo Hello $name

Output:

    Hello World

Function Introspection
----------------------

With **-f**, **typeset** prints the definition of a named function instead of declaring a variable:

Example:

    foo () { true; }
    typeset -f foo | /bin/tr -d ' \n\t;\\'
    echo

Output:

    foo(){true}

Integer
-------

With **-i**, the variable holds an integer and an arithmetic expression on the right of an assignment is evaluated. Support for the attribute varies between shells.

Example:

    typeset -i n
    n=2+3
    echo $n

Output:

    5

Export
------

With **-x**, **typeset** also marks the variable for export, so child processes inherit it.

Example:

    typeset -x V=exported
    /bin/sh -c 'echo $V'

Output:

    exported

Compatibility
-------------

| Feature                | ash | bash     | brush    | dash | hush | ksh                    | loksh   | mksh  | oksh  | osh      | posh | yash   | yashrs  | zsh     |
|:----------------------:|:---:|:--------:|:--------:|:----:|:----:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:----:|:------:|:-------:|:-------:|
| Basic Usage            | -   | ?2.01.0+ | ?0.2.23+ | -    | -    | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | -    | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Function Introspection | -   | ?2.01.0+ | ?0.2.23+ | -    | -    | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | 0.30.0+  | -    | -      | -       | ?4.0.9+ |
| Integer                | -   | ?2.01.0+ | -        | -    | -    | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | -        | -    | -      | -       | ?4.0.9+ |
| Export                 | -   | ?2.01.0+ | ?0.2.23+ | -    | -    | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | -    | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
