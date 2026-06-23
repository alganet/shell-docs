<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

Here-Documents
==============

> feeds the following lines to a command as its standard input

- _command_ **<<**[**-**]_delimiter_

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

Unquoted Delimiter Expands Variables
------------------------------------

When the delimiter is unquoted, parameter expansion is performed.

Example:

    my_var=world
    /bin/cat <<MYDOC
    hello $my_var
    MYDOC

Output:

    hello world

Quoted Delimiter Disables Expansion
-----------------------------------

When the delimiter is quoted, parameter expansion is not performed.

Example:

    my_var=world
    /bin/cat <<'MYDOC'
    hello $my_var
    MYDOC

Output:

    hello $my_var

Multiple Here-Documents
-----------------------

Multiple here-documents can be used in sequence.

Example:

    /bin/cat <<FIRST
    one
    FIRST
    /bin/cat <<SECOND
    two
    SECOND

Output:

    one
    two

Compatibility
-------------

| Feature                              | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:------------------------------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage                          | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Indented Here-Docs                   | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Unquoted Delimiter Expands Variables | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Quoted Delimiter Disables Expansion  | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Multiple Here-Documents              | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
