<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

source
======

> execute commands in the current environment

- **source** [_file_]

---

Source is an alias to [dot](dot.md) in some shells.

Basic Usage
-----------

Example:

    echo 'echo Hello New File' > /tmp/newfile.sh
    source /tmp/newfile.sh
    /bin/rm /tmp/newfile.sh

Output:

    Hello New File

Compatibility
-------------

| Feature       | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | -        | >=2.05b.13 | >=0.2.23 | -          | -        | >=2007-01-11                | -       | >=R45  | -       | >=0.25.0 | -        | -        | >=0.3.0  | >=4.2.7 |
