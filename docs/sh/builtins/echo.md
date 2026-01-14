<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

echo
====

> writes zero or more _string_ arguments to standard output

- **echo** [-neE] [_string_...]

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

| Feature        | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:--------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage    | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | >=1.25.1 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.41   | >=0.3.0  | >=4.2.7 |
| Option: -n     | -        | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | -        | >=0.3.0  | >=4.2.7 |
| Option: -e     | -        | >=2.05b.13 | >=0.2.23 | -          | -        | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | -        | -        | >=0.3.0  | >=4.2.7 |
| Option: -E     | -        | >=2.05b.13 | >=0.2.23 | -          | -        | -                           | >=6.7.5 | >=R45  | >=6.5   | -        | -        | -        | >=0.3.0  | >=4.2.7 |
