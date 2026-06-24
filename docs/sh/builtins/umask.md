<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

umask
=====

> sets the file-creation mask applied to new files

- **umask** [-S] [_mask_]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/umask.html)

Basic Usage
-----------

`umask` sets the mask, and with no operand prints the current value in octal.
Leading zeros are trimmed here so the result is identical on every shell.

Example:

    umask 022
    umask | sed 's/^0*//'

Output:

    22

Symbolic Mode
-------------

`umask -S` prints the mask as symbolic permissions instead of octal — not every
shell supports this form.

Example:

    umask 022
    umask -S

Output:

    u=rwx,g=rx,o=rx

Compatibility
-------------

| Feature       | ash     | bash     | brush    | dash    | hush    | ksh                    | loksh   | mksh  | oksh  | osh      | posh     | yash   | yashrs  | zsh     |
|:-------------:|:-------:|:--------:|:--------:|:-------:|:-------:|:----------------------:|:-------:|:-----:|:-----:|:--------:|:--------:|:------:|:-------:|:-------:|
| Basic Usage   | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | 1.24.2+ | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | ?0.25.0+ | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |
| Symbolic Mode | ?1.2.2+ | ?2.01.0+ | ?0.2.23+ | ?0.5.3+ | -       | ?shvrA93uplusm-v1.0.1+ | ?6.7.5+ | ?R30+ | ?6.5+ | -        | ?0.12.6+ | ?2.10+ | ?0.3.0+ | ?4.0.9+ |

Legend: trailing `+` still works at newest tested · leading `?` lower bound uncertain (may be older) · `X-Y` worked X through Y then removed · `-` unsupported · `.` untested
