# Git Cheat-Sheet

> [!NOTE]
> DUNE encourages a feature-branch workflow (`feature/<user>/<desc>`, `bugfix/<user>/<desc>`)
> across its GitHub organizations. The recipes below show the common DUNE/LArSoft
> branch-and-PR cycle.

## Quick Reference

| Command | What it does |
|---|---|
| `git clone <url>` | Clone a repository to your local machine |
| `git checkout -b feature/<user>_<desc>` | Create and switch to a new feature branch |
| `git status` | Show working tree state (staged, unstaged, untracked) |
| `git add -p` | Interactively stage changes (review before committing) |
| `git commit -m "message"` | Commit staged changes with a message |
| `git push -u origin <branch>` | Push branch to GitHub and set upstream tracking |
| `git pull --rebase` | Fetch and rebase local commits on top of remote |
| `git fetch --all` | Fetch all remotes without merging |
| `git log --oneline --graph` | Compact visual history of commits and branches |
| `git diff` | Show unstaged changes |
| `git diff --staged` | Show staged changes (what would be committed) |
| `git stash` / `git stash pop` | Temporarily shelve / restore uncommitted changes |
| `git remote -v` | List configured remotes and their URLs |
| `git rm <file>` | Stop tracking and delete a file (stages the removal) |
| `git rebase -i HEAD~N` | Interactively squash / reorder / reword the last N commits |
| `git cherry -v` | List local commits not yet on the upstream branch |

## Annotated Copy-Paste Block

```bash
# ── Start a new feature branch ────────────────────────────────
git clone git@github.com:DUNE/dunecore.git
cd dunecore
git checkout -b feature/gsdavies/myfix    # DUNE naming: feature/<user>/<desc>; bugfix/<user>/<desc>

# ── Day-to-day workflow ───────────────────────────────────────
git status                              # what's changed?
git diff                                # see unstaged changes
git diff --staged                       # see what's already staged
git add -p                              # stage interactively (safer than git add .)
git commit -m "fix: correct reco threshold for HD FD geometry"

# ── Delete a tracked file ─────────────────────────────────────
git rm path/to/old_file.cc            # removes the file AND stages the deletion
git rm --cached path/to/secret.txt    # stop tracking but keep the local copy

# ── Keeping your branch up to date ────────────────────────────
git fetch --all                         # fetch without merging
git pull --rebase                       # rebase your commits on top of origin/main
# (preferred over git merge to keep history linear)

# ── Push and open a PR ────────────────────────────────────────
git push -u origin feature/gsdavies/myfix
# then open a PR on GitHub: DUNE/dunecore → main

# ── Inspect history ───────────────────────────────────────────
git log --oneline --graph               # compact branch graph
git log --oneline --graph --all         # include remote branches

# ── Stash work in progress ────────────────────────────────────
git stash                               # shelve uncommitted changes
git stash pop                           # restore them

# ── Remotes ───────────────────────────────────────────────────
git remote -v                           # show origin (and upstream for forks)
```

## Recipes

### Start a LArSoft feature branch and push
```bash
git clone git@github.com:LArSoft/larrecodnn.git
cd larrecodnn
git checkout -b feature/davies_newnetwork
# ... make changes ...
git add -p
git commit -m "add: new CNN for track/shower separation"
git push -u origin feature/davies_newnetwork
# Open a PR on GitHub: LArSoft/larrecodnn → develop (check repo's default branch)
```

### Sync a fork with upstream
```bash
git remote add upstream git@github.com:DUNE/dunecore.git
git fetch upstream
git checkout main
git rebase upstream/main
git push origin main
```

### Undo the last commit (keep changes staged)
```bash
git reset --soft HEAD~1
# Changes are back in staging; recommit when ready
```

### Squash related commits before opening a PR
```bash
git rebase -i HEAD~5
# In the editor: mark commits to 'squash' (s) into the one above,
# 'reword' (r) to fix a message, or reorder lines.
# Tidies "implement X", "tests for X", "fix X" into one clean commit.
# ⚠ Only squash commits you have NOT yet pushed.
```

### Recover a file you deleted and committed
```bash
git log --diff-filter=D --summary    # find the commit that deleted it; note its hash
git checkout <commit>^ -- path/to/file   # restore from the commit BEFORE the deletion
```

## Tips & gotchas

- **Write structured commit messages.** First line = short synopsis (many git
  commands only show that line); leave a blank line, then detail. Omit `-m`
  entirely to open your editor for longer messages.
- **Never rebase or amend anything already pushed** to a shared remote — your
  next push will (rightly) be rejected, and you'll disrupt collaborators.
- **`pull --rebase` over `pull`** keeps history linear (set it as the default
  with `git config --global pull.rebase true`).
- **Back up before uncertain operations.** Disk is cheap: `cp -r myrepo myrepo.bak`
  (the whole `.git` dir holds everything) before a hairy rebase or reset.
- **Check what you're about to push:** `git cherry -v` lists local commits not
  yet on the upstream branch.

---

> **Credit & further reading.** Several tips above are adapted from Chris Green's
> **Git Tips and Tricks** (Fermilab), a thorough longer-form guide; see it for
> the full "NoSY" linear-history branching workflow:
> <https://cdcvs.fnal.gov/redmine/projects/cet-is-public/wiki/GitTipsAndTricks>
