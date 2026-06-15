## metacat command summary

### Full documentation 
[Metacat](https://fermitools.github.io/metacat/)
[Notes on DUNE implementation](https://dune.github.io/DataCatalogDocs)

### Official datasets

Go to the [Official Datasets page](https://dune-tech.rice.edu/dunecatalog/) and enter keywords 

or do a query with 

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




