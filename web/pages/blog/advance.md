---
title: Advance usage
---

You can view all steps in the Taiji pipeline using the following command.

```
taiji view | dot -Tpng > Taiji.png
```

If the `dot` program is installed, the command will produce a png file that plots the entire pipeline.

Taiji allows you to execute partial workflows using the `--select` option. For example, `taiji run --config config.yml --select ATAC_Align` will run the step called "ATAC_Align" and all precedent steps.