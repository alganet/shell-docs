<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

Parameter Expansion
===================

> substitutes — and optionally transforms — the value of a _parameter_

- **${**_parameter_**}**

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02)

Basic Usage
-----------

Braces delimit the parameter name; `${my_param}` is otherwise the same as
`$my_param`, and lets the name sit next to other text.

Example:

    my_param=hello
    echo ${my_param}

Output:

    hello

Default Value
-------------

`${param:-word}` yields `word` when `param` is unset or empty, without changing
`param` itself.

Example:

    my_param=
    echo ${my_param:-world}

Output:

    world

Default Assignment
------------------

`${param:=word}` assigns `word` to `param` when it is unset or empty, then
expands to it.

Example:

    my_param=
    echo ${my_param:=world}
    echo $my_param

Output:

    world
    world

Alternative if Present
----------------------

`${param:+word}` expands to `word` only when `param` is set and non-empty,
otherwise to nothing.

Example:

    my_param=hello
    echo ${my_param:+world}

Output:

    world

Remove Smallest Prefix
----------------------

`${param#pattern}` removes the shortest leading text matching `pattern`.

Example:

    my_param=foo-bar-example
    echo ${my_param#*-}

Output:

    bar-example

Remove Largest Prefix
---------------------

`${param##pattern}` removes the longest leading text matching `pattern`.

Example:

    my_param=foo-bar-example
    echo ${my_param##*-}

Output:

    example

Remove Smallest Suffix
----------------------

`${param%pattern}` removes the shortest trailing text matching `pattern`.

Example:

    my_param=example-foo-bar
    echo ${my_param%-*}

Output:

    example-foo

Remove Largest Suffix
---------------------

`${param%%pattern}` removes the longest trailing text matching `pattern`.

Example:

    my_param=example-foo-bar
    echo ${my_param%%-*}

Output:

    example

Compatibility
-------------

| Feature                | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:----------------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage            | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Default Value          | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Default Assignment     | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Alternative if Present | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Remove Smallest Prefix | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Remove Largest Prefix  | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Remove Smallest Suffix | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Remove Largest Suffix  | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
