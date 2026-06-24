<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

Arithmetic Expansion
====================

> evaluates an integer arithmetic _expression_ and substitutes the result

- **$((** _expression_ **))**

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_06_04)

Basic Usage
-----------

`$(( ))` evaluates the enclosed integer expression, with the usual C operator
precedence, and substitutes the result.

Example:

    echo $((4 * 3 / 2 + 1 - 0))

Output:

    7

Square Bracket Syntax
---------------------

`$[ ]` is an obsolete, non-portable form of arithmetic expansion. Prefer
`$(( ))`; this is shown only to document where the old form still works.

Example:

    echo $[4 * 3 / 2 + 1 - 0]

Output:

    7

Comparison
----------

Relational operators evaluate to `1` when true and `0` when false.

Example:

    echo $((3 > 2))

Output:

    1

Bitwise
-------

Bitwise operators such as `&` (and), `|` (or), and `^` (xor) work on the binary representation of the operands.

Example:

    echo $((6 & 3))

Output:

    2

Ternary
-------

The `condition ? a : b` operator selects `a` when the condition is non-zero and `b` otherwise.

Example:

    echo $((1 ? 10 : 20))

Output:

    10

Compatibility
-------------

| Feature               | ash     | bash     | brush    | dash     | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:---------------------:|:-------:|:--------:|:--------:|:--------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage           | 1.19.4+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+  | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Square Bracket Syntax | -       | ?2.01.0+ | 0.4.0+   | -        | -        | -                      | -       | -     | -     | 0.37.0+  | -        | -      | -       | ?4.0.9+ |
| Comparison            | 1.19.4+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+  | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Bitwise               | 1.19.4+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+  | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Ternary               | 1.19.4+ | ?2.01.0+ | ?0.2.23+ | 0.5.5.1+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
