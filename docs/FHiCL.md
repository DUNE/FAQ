# FHiCL Cheat-Sheet

> [!NOTE]
> FHiCL (Fermilab Hierarchical Configuration Language) is the configuration
> language for art / LArSoft jobs. The commands below assume a set-up DUNE
> software environment (e.g. via `setup_dune.sh` or `spack load`).

## Syntax Mini-Reference

| Construct | Example | Meaning |
|---|---|---|
| Key–value | `timeout: 300` | Set a scalar parameter |
| Sequence | `modules: [mod1, mod2]` | Ordered list |
| Table | `physics: { ... }` | Named block of parameters |
| Include | `#include "mymodule.fcl"` | Pull in another `.fcl` file (resolved via `FHICL_FILE_PATH`) |
| PROLOG | `BEGIN_PROLOG` … `END_PROLOG` | Define named parameter sets before use |
| Local ref | `@local::my_prolog_table` | Substitute a named PROLOG table inline |
| Table ref | `@table::other_table` | Merge another table's keys into this one |
| Nil / erase | `key: @nil` | Remove a key that was set in an included file |
| Sequence append | `modules: [@sequence::base_mods, newmod]` | Extend a sequence from another config |

## Quick Reference

All of these utilities have helpful `-h` / `--help` messages with more options and examples.
e.g. `fhicl-get -h` for more ways to extract values from a config file.

The recipes below show common use cases for inspecting, debugging, and recovering FHiCL configs.
| Command | What it does |
|---|---|
| `art -c myconfig.fcl -n 10` | Run an art job with `myconfig.fcl`, processing 10 events |
| `art -c myconfig.fcl --no-output` | Dry-run: process events but suppress output files |
| `fhicl-dump myconfig.fcl` | Print the fully-resolved (expanded) configuration |
| `fhicl-expand myconfig.fcl` | Expand `#include` directives and print result |
| `fhicl-get --names-in myconfig.fcl` | List top-level parameter names in the config |
| `fhicl-get --atom-as string myconfig.fcl physics.producers.reco` | Extract a single value by dotted path |
| `config_dumper -P myoutput.root` | Print the `.fcl` config embedded in an art ROOT file |
| `config_dumper -P myoutput.root > recovered.fcl` | Save the embedded config to a file |
| `echo $FHICL_FILE_PATH` | Show the search path for `#include` resolution |
| `printenv \| grep FHICL` | Inspect all FHiCL-related environment variables |

## Annotated Copy-Paste Block

```bash
# ── Running an art job ─────────────────────────────────────────
art -c myconfig.fcl -n 100          # run 100 events
art -c myconfig.fcl --no-output     # no ROOT output (testing/validation)
art -c myconfig.fcl -s input.root   # specify an input file

# ── Inspecting / expanding a config ───────────────────────────
fhicl-dump myconfig.fcl             # full resolved config (all includes expanded)
fhicl-expand myconfig.fcl           # expand #include only (useful for debugging paths)
fhicl-get --names-in myconfig.fcl   # list all top-level keys

# ── Extract a specific value ───────────────────────────────────
fhicl-get --atom-as string myconfig.fcl physics.producers.reco.module_type
# ^ prints the value at that dotted path

# ── Recover the config from a finished art ROOT file ───────────
config_dumper -P myoutput.root              # print to stdout
config_dumper -P myoutput.root > saved.fcl  # save to file
# This is the fastest way to reproduce exactly what config ran on a file.

# ── Include path ───────────────────────────────────────────────
echo $FHICL_FILE_PATH               # see where #include looks for .fcl files
# Typically set by setup_dune.sh / spack load
```

## Recipes

### Reproduce the exact config that produced a ROOT file
```bash
config_dumper -P /path/to/output.root > recovered.fcl
fhicl-dump recovered.fcl            # expand to see fully-resolved config
```

### Debug a broken include path
```bash
echo $FHICL_FILE_PATH | tr ':' '\n' # list each directory on its own line
fhicl-expand myconfig.fcl            # see where includes resolve (or fail)
```

### Test a config without writing output
```bash
art -c myconfig.fcl -n 1 --no-output
# Quick sanity check: does the job start up cleanly?
```
