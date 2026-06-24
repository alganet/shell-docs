<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

set
===

> sets or unsets positional parameters and options

- **set**

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#set)

Basic Usage
-----------

**set --** replaces the positional parameters with the given arguments, which then become `$1`, `$2`, and so on:

Example:

    set -- one two three
    echo $1
    echo $2
    echo $3

Output:

    one
    two
    three

Clearing Arguments
------------------

With no arguments after `--`, **set** discards all positional parameters, leaving none:

Example:

    set --
    echo $# args

Output:

    0 args

Exit on Error
-------------

`set -e` makes the shell stop as soon as a command fails. See [errexit](../options/errexit.md).

Example:

    ( set -e; false; echo "not reached" ) 2>/dev/null
    echo "after: $?"

Output:

    after: 1

Error on Unset Variable
-----------------------

`set -u` turns any use of an unset variable into an error. See [nounset](../options/nounset.md).

Example:

    ( set -u; echo "$undefined_var"; echo reached ) 2>/dev/null || echo "aborted on unset"

Output:

    aborted on unset

Trace Execution
---------------

`set -x` prints each command before running it. The trace goes to standard error, so only the command's own output appears here.

Example:

    set -x
    echo traced

Output:

    traced

Compatibility
-------------

| Feature                 | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:-----------------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage             | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Clearing Arguments      | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Exit on Error           | ?1.2.2+ | ?2.01.0+ | 0.4.0+   | ?0.5.3+ | 1.28.4+  | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Error on Unset Variable | ?1.2.2+ | ?2.01.0+ | 0.4.0+   | ?0.5.3+ | -        | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Trace Execution         | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
