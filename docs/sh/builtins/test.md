<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

test
====

> evaluates an expression

- **test** [_expression_]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/test.html)

Basic Usage
-----------

**test** evaluates an _expression_ and sets the exit status to success or failure, letting `if` branch on the result:

Example:

    if test 1 = 1
    then echo 'test true'
    fi
    if test 0 = 1
    then echo 'test false'
    fi

Output:

    test true

String Is Empty
---------------

`-z` is true when a string has zero length.

Example:

    test -z "" && echo empty

Output:

    empty

String Is Non-Empty
-------------------

`-n` is true when a string has non-zero length.

Example:

    test -n "hi" && echo "not empty"

Output:

    not empty

Numeric Comparison
------------------

Operators such as `-eq`, `-ne`, `-lt`, and `-gt` compare two integers.

Example:

    test 2 -lt 3 && echo less

Output:

    less

File Exists
-----------

`-f` is true when a regular file exists; `-d` tests for a directory.

Example:

    : > f
    test -f f && echo "file exists"

Output:

    file exists

Negation
--------

A leading `!` inverts the result of the expression.

Example:

    test ! -f none && echo absent

Output:

    absent

Compatibility
-------------

| Feature             | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:-------------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage         | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| String Is Empty     | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| String Is Non-Empty | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Numeric Comparison  | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| File Exists         | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Negation            | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
