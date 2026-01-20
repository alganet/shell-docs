<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

readonly
========

> declares a read-only variable _name_

- **readonly** _name_[=_value_]

Basic Usage
-----------

Example:

    readonly word=bird
    echo $word
    eval 'word=snake' >/dev/null 2>&1
    echo $word

Output:

    bird
    bird

Compatibility
-------------

| Feature       | ash      | bash       | brush    | dash       | hush     | ksh                         | loksh   | mksh   | oksh    | osh      | posh     | yash     | yashrs   | zsh     |
|:-------------:|:--------:|:----------:|:--------:|:----------:|:--------:|:---------------------------:|:-------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:-------:|
| Basic Usage   | -        | >=2.05b.13 | >=0.3.0  | -          | -        | >=2007-01-11                | -       | -      | -       | >=0.25.0 | -        | -        | -        | >=4.2.7 |
