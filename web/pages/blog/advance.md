---
title: Advance usage
---

You can view all steps in the Taiji pipeline using the following command.

```
taiji view Taiji.html
```

Open the "Taiji.html" using your web browser to see what the pipeline can do.

Taiji allows you to execute partial workflows using the `--select` option. For example, `taiji run --config config.yml --select ATAC_Align` will run the step called "ATAC_Align" and all precedent steps.