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

Please note that the columns are TAB-separated.

Preparing configuration file
============================

This is how the configuration file looks like:

```
input: "input.tsv"
output_dir: "output/"
genome: "/home/kai/tscc/genome/GRCh38/GRCh38.primary_assembly.genome.fa"
annotation: "/home/kai/tscc/genome/GRCh38/gencode.v30.annotation.gtf"
genome_index: "/home/kai/tscc/genome/GRCh38/GRCh38.index"
motif_file: "/home/kai/tscc/motif_databases/cisBP_human.meme"
bwa_index: "/home/kai/tscc/genome/GRCh38/BWAIndex"
```

Please modify the path to suit your need.

Running the ATAC-seq analysis
=============================

Use the following command to run the pipeline:

```
taiji run --config config.yml -n 5 +RTS -N5
```

OR

```
taiji run --config config.yml -n 5 --ip `hostname`
```

if you are using job scheduling system.

Results
=======

