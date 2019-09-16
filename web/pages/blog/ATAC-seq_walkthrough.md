---
title: ATAC-seq walk-through
---

To see what analyses Taiji can do, type the following command:

```
taiji view Taiji.html
```

You can then open the "Taiji.html" using your web browser.

Preparing input
===============

We will get the example dataset from ENCODE. To do this, add the following lines to the "input.tsv" file:

```
type	id	group	rep	path	tags
ATAC-seq	control	control	1	ENCFF893KQZ,ENCFF443HVZ	ENCODE
ATAC-seq	2h	2h	1	ENCFF173INV,ENCFF322IZC	ENCODE
ATAC-seq	4h	4h	1	ENCFF562JHD,ENCFF943SYH	ENCODE
```

Please note that the columns are TAB-separated. This dataset is very large and 
takes a long time to process. Feel free to use other datasets as you want (just
replace the ENCODE IDs).

Preparing configuration file
============================

This is how the configuration file looks like:

```
input: "input.tsv"
output_dir: "output/"
assembly: "GRCh38"
```

Running the ATAC-seq analysis
=============================

Use the following command to run the pipeline using five concurrent threads:

```
taiji run --config config.yml -n 5 +RTS -N5
```

`-n 5 +RTS -N5` tells the `taiji` to use 5 cores/threads.

OR

```
taiji run --config config.yml -n 5 --cloud
```

if you are using job scheduling system.

Results
=======

