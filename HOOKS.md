# Git Hooks

This repo installs a minimal Git pre-commit hook in `.git/hooks/pre-commit`. It prints "Helle Codex" on every commit, then downloads and runs a pinned linter script from a public gist using `curl` (or `wget` as a fallback). If neither tool is available, the linter step is skipped and the commit proceeds. Linter failures (including download errors) will block the commit.
