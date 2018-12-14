---
title: Quick demo
---

1. Use this [link](https://www.dropbox.com/s/cunnoftdhh5z9qs/example.tar.gz?dl=0) to download the example data set.

2. Extract the files from the archive:

``` code-block 
tar xf example.tar.gz
cd example/RA
```

3. Select certain steps from the workflow without running the whole pipeline:

``` code-block
taiji run --config config.yml --select ATAC_Call_Peak
```

4. Run the entire pipeline:

``` code-block
taiji run --config config.yml
```

5. You can rerun certain steps:

``` code-block
taiji rm Compute_Ranks
taiji run --config config.yml --select Compute_Ranks
```

6. In case a fresh restart is needed:

``` code-block
rm sciflow.db
taiji run --config config.yml
```

7. The output is in the "output" directory. See the meaning of the files [here](https://taiji-pipeline.github.io/documentation/tutorial.html#results).