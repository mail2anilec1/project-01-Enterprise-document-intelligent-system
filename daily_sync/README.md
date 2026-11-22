# Daily upstream sync

Use `sync_upstream.sh` to bring the upstream `master` branch into your
currently checked-out branch, then push that branch to your fork (`origin`).

## Requirements

- The repository has an `upstream` remote and an `origin` remote.
- You are on the branch you want to update and push.
- Commit or stash other local changes before running the script.

## Run

From the repository root:

```bash
./daily_sync/sync_upstream.sh
```

Or, from this directory:

```bash
./sync_upstream.sh
```

The script pulls from `upstream/master` using a merge (not a rebase), then
pushes the current branch to the same branch name on `origin`. If the pull
fails or has conflicts, the script stops without pushing. Resolve the issue
and run the script again.
