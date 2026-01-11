<!--
SPDX-FileCopyrightText: 2026 Alexandre Gomes Gaigalas <alganet@gmail.com>

SPDX-License-Identifier: GFDL-1.3-or-later
-->

⚠️ **VERY Early stage, experimental and incomplete.** ⚠️

# shell-docs

**shell-docs** is a living documentation source for the portable shell.

It's both *documentation* and *compatibility tests*, with each document providing
comprehensive support breakdown for shell compatibility.

Check the [echo builtin](docs/sh/builtins/echo.md) document for an example.

## Development

Whole workflow (process docs, run tests, regenerate compat tables)

    rm -Rf tests/ compat/ results && sh gen_tests.sh && sh container.sh && sh gen_compat.sh && sh regen_docs.sh 

License docs files:

    reuse annotate --copyright "Alexandre Gomes Gaigalas <alganet@gmail.com>" --license GFDL-1.3-or-later --recursive docs

## Licensing

Code in this repository is licenced under ISC.

Documentation in this repository is licensed under GFDL-1.3 or later.