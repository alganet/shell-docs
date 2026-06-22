<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

.
=

> execute commands in the current environment

- **.** [_file_]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_19)

Basic Usage
-----------

Example:

    echo 'echo Hello New File' > /tmp/newfile.sh
    . /tmp/newfile.sh
    /bin/rm /tmp/newfile.sh

Output:

    Hello New File

Compatibility
-------------

| Feature       | ash       | bash       | brush    | dash       | hush      | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:---------:|:----------:|:--------:|:----------:|:---------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2  | >=2.01.0   | >=0.2.23 | >=0.5.3    | >=1.19.4  | >=2007-01-11                | >=6.7.5 | >=R30  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.10   | >=0.3.0  | >=4.0.9 |
