# Git Hooks

This repository installs a simple `pre-commit` hook that runs locally in `.git/hooks/pre-commit`.
On every commit it prints "Helle Codex" and then downloads and runs a small linter script from a pinned gist revision using `curl` (or `wget` as a fallback). If neither tool is available, it skips the linter and allows the commit to proceed.

