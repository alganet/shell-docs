<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

echo
====

> writes zero or more _string_ arguments to standard output

- **echo** [-neE] [_string_...]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/echo.html)

Basic Usage
-----------

When no options are given, **echo** writes arguments followed by a newline:

Example:

    echo Hello World

Output:

    Hello World

Option: -n
----------

> does not write a newline at the end

Example:

    echo -n Hello
    echo World

Output:

    HelloWorld

Option: -e
----------

> expands escape sequences in arguments

Example:

    echo -e "Hello\nWorld"

Output:

    Hello
    World

Option: -E
----------

> explicitly does not expand escape sequences in arguments

Example:

    echo -E "Hello\nWorld"

Output:

    Hello\nWorld

Compatibility
-------------

| Feature     | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash       | yashrs  | zsh     |
|:-----------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:----------:|:-------:|:-------:|
| Basic Usage | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+     | ?0.3.0+ | ?4.0.9+ |
| Option: -n  | -       | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | -        | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10-2.21 | ?0.3.0+ | ?4.0.9+ |
| Option: -e  | -       | ?2.01.0+ | ?0.2.23+ | -       | -        | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | -        | ?2.10-2.21 | ?0.3.0+ | ?4.0.9+ |
| Option: -E  | -       | ?2.01.0+ | ?0.2.23+ | -       | -        | -                      | ?6.7.5+ | ?R30+ | ?6.5+ | -        | -        | ?2.10-2.21 | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
