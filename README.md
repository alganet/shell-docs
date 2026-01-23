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

This project is in its infancy. There are some important architectural goals we want:

 1. **No reliance on anything but portable coretools and portable sh.**

    We want the tools provided to be self hosting. They test and document the shells,
    but must also be _executable in those shells_, estabilishing a simpler dependency
    model.

    This certainly restricts our ability to do things (no fancy markdown parsers from
    higher languages, etc) but it is necessary.

 2. **Clear support definitions**

    The POSIX standard is great for the shell, however, it is not enough as a source
    of information of what shells in the wild _actually support_. Some features, such
    as _local_, are undefined in the spec but widely available.

    We aim to solve that by making a living executable documentation, in the spirit
    of MDN (Mozilla Developer Network) docs, providing extensive compatibility
    information.

### Working

Currently, the project works by taking documentation written by humans and running the example
code snippets as tests. The current implementation works by:

  1. Converting docs written by humans into an in-disk test suite
  2. Running the test suite against all available shells from https://github.com/alganet/shell-versions
  3. Examining the test suite failures to generate an in-disk compatibility report
  4. Appending or editing the compatibility table on the docs accordingly

Whole workflow (process docs, run tests, regenerate compat tables)

    rm -Rf tests/ compat/ results && sh gen_tests.sh && sh container.sh && sh gen_compat.sh && sh regen_docs.sh 

License docs files:

    reuse annotate --copyright "Alexandre Gomes Gaigalas <alganet@gmail.com>" --license GFDL-1.3-or-later --recursive docs

## Licensing

Code in this repository is licenced under ISC.

Documentation in this repository is licensed under GFDL-1.3 or later.