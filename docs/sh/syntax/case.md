<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

Case Statement
==============

> runs the commands in the first branch whose pattern matches a word

- **case** _word_ **in** _pattern_**)** _commands_ **;; esac**

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_09_04_05)

Basic Usage
-----------

A `case` statement compares a word against each pattern in turn and runs the
commands of the first branch that matches.

Example:

    fruit=apple
    case $fruit in
        apple) echo "it is an apple" ;;
        *) echo "something else" ;;
    esac

Output:

    it is an apple

Multiple Patterns
-----------------

Several patterns can share one branch by separating them with `|`.

Example:

    letter=b
    case $letter in
        a|b|c) echo "early letter" ;;
        *) echo "later letter" ;;
    esac

Output:

    early letter

Default Pattern
---------------

A final `*)` branch matches anything, serving as a catch-all default.

Example:

    value=xyz
    case $value in
        yes) echo affirmative ;;
        *) echo "no match" ;;
    esac

Output:

    no match

Compatibility
-------------

| Feature           | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:-----------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage       | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Multiple Patterns | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Default Pattern   | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
