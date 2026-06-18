## metacat command summary

### Full documentation 
[Metacat](https://fermitools.github.io/metacat/)
[Notes on DUNE implementation](https://dune.github.io/DataCatalogDocs)

### Official datasets

Go to the [Official Datasets page](https://dune-tech.rice.edu/dunecatalog/) and enter keywords or do a query with 

```bash
metacat query "datasets matching <namespace>:* having datasetpar.official=True and dune.campaign=<campaign_name> and core.data_tier=<data_tier>"
```
### Find namespaces

```bash
metacat namespace list
```

### File Queries

see [the glossary](https://dune.github.io/DataCatalogDocs/glossary.html#minimal-terms-for-raw-and-processed-data) for explanation of search terms.

```bash
metacat query "files from <namespace>:* having core.run_type=<apparatus> and core.file_type=<mc/detector> and <run_number> in core.runs and core.data_tier=<data_tier> and created_timestamp > 2025-01-01"
```

### File Metadata

```bash
# -l gives parentage
metacat file show -m -l <namespace>:<filename> # pretty format
metacat file show -m -l -j <namespace>:<filename> # json format
```

### Important fields

| field | description |
| --- | --- |
| name | filename must be unique in namespace |
| namespace | (often the run_type) |
| created_timestamp | can be a normal date/time or unix timestamp|
| size | in bytes |
| core.run_type | (vd-protodune, fardet-hd ...) |
| core.file_type | (mc, detector) |
| core.data_tier | (raw, hit-reconstructed, full-reconstructed, caf ...) |
| dune.campaign | dune campaign |
| core.application.name | (cafmaker, reco2 ...) |
| core.application.version | (v10_03_01d1 ...) |
| dune_mc.gen_fcl_filename | what was generated |
| dune_mc.geometry_version | geomoetry version |
| dune_mc.generators | event generators used |

