# Spack Cheat-Sheet

> [!NOTE]
> DUNE distributes its software stack through Spack, sourced from CVMFS. The
> commands below assume the DUNE Spack stack has been set up (see the
> environment-setup block).

## Quick Reference

| Command | What it does |
|---|---|
| `spack find` | List all installed packages in the active environment |
| `spack find --loaded` | List packages currently loaded in the shell |
| `spack load <pkg>@<version>` | Load a package into the current shell environment |
| `spack unload <pkg>` | Remove a package from the current shell environment |
| `spack info <pkg>` | Show available versions, variants, and dependencies |
| `spack spec <pkg>` | Preview the concretized dependency DAG before installing |
| `spack env activate -p <dir>` | Activate a Spack environment (adds `spack:` to prompt) |
| `spack env list` | List all named Spack environments |
| `spack install <pkg>` | Build and install a package (respects active environment) |
| `spack location -i <pkg>` | Print the install prefix for a package |
| `spack arch` | Show the current platform / OS / target triple |
| `spack debug report` | Print version, config, and system info for bug reports |

## Annotated Copy-Paste Block

```bash
# ── Environment setup ──────────────────────────────────────────
. /cvmfs/dune.opensciencegrid.org/spack/setup-env.sh
# ^ sources the DUNE Spack stack from CVMFS; sets SPACK_ROOT etc.

# ── Finding packages ───────────────────────────────────────────
spack find                     # all installed in active env
spack find --loaded            # only what's in your shell right now
spack info dune-core            # versions, variants, dependencies

# ── Loading / unloading ────────────────────────────────────────
spack load dune-core@10.11.01d00   # load a specific release
spack load dune-ana             # load by name (picks the unique match)
spack unload dune-core          # remove from shell

# ── Inspecting a spec before you install ───────────────────────
spack spec dunecore            # show the full concretized DAG

# ── Environments (for dev work / MPD) ──────────────────────────
spack env create mydev         # create a named environment
spack env activate mydev    # activate it
spack env list                 # see all named environments
spack install                  # install everything in the active env's spec

# ── Introspection ──────────────────────────────────────────────
spack location -i dune-core     # print the install prefix
spack arch                     # platform/OS/target triple
spack debug report             # full diagnostic dump for bug reports
```

## Recipes

### Load a DUNE release and start working
```bash
. /cvmfs/dune.opensciencegrid.org/spack/setup-env.sh
spack env activate dune-prototype
# see what is loaded
spack find --loaded
# e.g. if it's not already loaded, load the core package for the release
spack load dune-core@10.11.01d00
# now art, ROOT, etc. are in PATH / LD_LIBRARY_PATH
```
