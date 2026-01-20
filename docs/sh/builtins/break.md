<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

break
=====

> exits the loop _level_

- **break** [_level_]

---

[POSIX Specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#break)

Basic Usage
-----------

Example:

    dots=''
    while true
    do 
        case $dots in 
            ...) break ;;
        esac
        dots="$dots."
        echo $dots
    done
        

Output:

    .
    ..
    ...

Compatibility
-------------

| Feature       | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | >=1.27.2 | >=2.05b.13 | >=0.2.23 | >=0.5.10.2 | >=1.25.1 | >=2007-01-11                | >=6.7.5 | >=R45  | >=6.5   | >=0.25.0 | >=0.12.6 | >=2.41   | >=0.3.0  | >=4.2.7 |
