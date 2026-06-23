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
code snippets as tests. The pipeline is a single `build` entrypoint with four stages, all
sharing `lib.sh` (portable sh + coreutils only):

  1. `extract` — convert the docs into an on-disk test suite (`tests/`)
  2. `run` — run the suite against every shell from https://github.com/alganet/shell-versions (`results/`)
  3. `collect` — fold the TAP results into the durable compatibility ledger (`data/`), and
     report what changed versus the previous ledger: **recoveries** (fail→pass), **regressions**
     (pass→fail) and **new** failures. `./build changes` re-prints the last build's report.
  4. `render` — rewrite each doc's compatibility table from the ledger

Each example runs in a **fresh empty directory** under a **minimal, uniform environment** —
`env -i HOME=/home/shelldocs PATH=/bin:/usr/bin` for every shell — and only the example's
**standard output** is compared against its `Output:` block (stderr is discarded). This keeps
results reproducible (no stray files for an unquoted `*` to match) and consistent across shells.

Two consequences for writing examples:

  * **Be self-contained.** Don't assume a starting directory or environment — `cd` to a known
    path, or set `HOME`, inside the example if it matters.
  * **Normalize varying diagnostics with familiar shell, not magic.** Error wording differs
    wildly between shells, so don't try to match it. Test the *exit status* of a contained
    failure instead, e.g. `( readonly_var=x ) 2>/dev/null || echo "it is read-only"`. To show a
    diagnostic on purpose, opt into it with an explicit `2>&1` in the example.

Every document follows the same shape — [`docs/sh/builtins/echo.md`](docs/sh/builtins/echo.md)
is the reference:

  1. the **title**: the exact feature or command name;
  2. a one-line **`>` description** of what it does (present tense, active voice);
  3. a **usage line**, e.g. `- **echo** [-neE] [_string_...]`, with `_placeholders_` in italics;
  4. a **specification link** (POSIX where it applies, otherwise the defining shell);
  5. one **H2 section per behaviour/option**, each opening with a one-line explanation *before*
     its `Example:` / `Output:` block;
  6. the generated **Compatibility** table, left untouched by `render`.

The ledger under `data/` is the single durable source of truth: one TAB-delimited
`feature / shell / version / status` record per observation. It is committed to git, so
knowledge accumulates across shell-image refreshes — a version that later disappears from the
image keeps the result we already recorded for it. `tests/` and `results/` are disposable
scratch and are git-ignored.

Compatibility cells are derived honestly from the sparse set of tested versions:

  * `X+` — works from `X` onward (a lower tested version was observed to fail, so `X` is a
    confirmed introduction point)
  * `?X+` — works at `X`, the oldest version we tested; it may well work in older ones we lack
  * `X-Y` — worked from `X` through `Y`, then stopped (a newer tested version fails)
  * `-` unsupported in every tested version · `.` no data

Whole workflow (process docs, run tests, regenerate compat tables):

    ./build all

Individual stages: `./build extract`, `./build run`, `./build collect`, `./build render`.
`./build clean` removes the `tests/` and `results/` scratch (never `data/`).

License newly written docs (GFDL):

    reuse annotate --copyright "Alexandre Gomes Gaigalas <alganet@gmail.com>" --license GFDL-1.3-or-later --recursive docs

The `data/` ledger is licensed ISC (it is factual data produced by the ISC tooling). Each
`.results` file carries its own `# SPDX-...` header, written automatically by `collect`/`render`,
so it stays REUSE-compliant across regeneration — no `reuse annotate` step is needed for it. Run
`reuse lint` to check the whole tree.

## Licensing

Code and the `data/` compatibility ledger in this repository are licensed under ISC.

Documentation in this repository is licensed under GFDL-1.3 or later.