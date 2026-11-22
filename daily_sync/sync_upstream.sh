#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(git -C "$script_dir" rev-parse --show-toplevel)"
branch="$(git -C "$repo_root" branch --show-current)"

if [[ -z "$branch" ]]; then
    printf 'Error: no branch is currently checked out.\n' >&2
    exit 1
fi

if [[ -n "$(git -C "$repo_root" status --porcelain --untracked-files=all -- . ':(exclude)daily_sync/sync_upstream.sh')" ]]; then
    printf 'Error: commit or stash your local changes before syncing.\n' >&2
    exit 1
fi

git -C "$repo_root" pull --no-rebase upstream master
git -C "$repo_root" push origin "$branch"
