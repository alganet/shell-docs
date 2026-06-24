<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

trap
====

> runs commands when the shell receives a signal or is about to exit

- **trap** _action_ _condition_...

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#trap)

On Exit
-------

A trap on the special `EXIT` condition runs its commands when the shell is about
to exit — useful for cleanup. (Signal names such as `INT` and `TERM` work the
same way.)

Example:

    trap 'echo cleanup' EXIT
    echo working

Output:

    working
    cleanup

Reset a Trap
------------

`trap -` followed by a condition removes a previously set trap.

Example:

    trap 'echo cleanup' EXIT
    trap - EXIT
    echo done

Output:

    done

Compatibility
-------------

| Feature      | ash     | bash     | brush    | dash    | hush     | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:------------:|:-------:|:--------:|:--------:|:-------:|:--------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| On Exit      | ?1.2.2+ | ?2.01.0+ | 0.3.0+   | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Reset a Trap | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | ?1.19.4+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
