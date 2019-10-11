---
title: ATAC-seq walk-through
---

This tutorial requires following additional software:

* fastq-dump
* samtools
* MACS2
* bwa

Preparing input
===============

We will get the example dataset from ENCODE.
To do this, add the following lines to the "input.tsv" file:

```
type	id	group	rep	path	format
ATAC-seq	TN	TN	1	SRR5305074	SRA
ATAC-seq	TN	TN	2	SRR5305075	SRA
ATAC-seq	TE	TE	1	SRR5305076	SRA
ATAC-seq	memory	memory	1	SRR5305080	SRA
```

Please note that the columns are TAB-separated.
If there are multiple runs, combine them using "+". For paired-end sequencing,
specify that using the "PairedEnd" tag.

```
type	id	group	rep	path	format	tags
ATAC-seq	memory	memory	1	SXXXX80+SXXXX81	SRA	
ATAC-seq	memory	memory	1	SXXXX80	SRA	PairedEnd
```

Taiji also supports ENCODE data. You can input the file ID for any fastq or bam
files and associate them with the "ENCODE" tag.
For pairend-end fastqs, separate them using ",".

```
type	id	group	rep	path	tags
ATAC-seq	control	control	1	ENCFF893KQZ,ENCFF443HVZ	ENCODE
```

Preparing configuration file
============================

This is how the configuration file looks like:

```
input: "input.tsv"
output_dir: "output/"
assembly: "mm10"
```

Running the ATAC-seq analysis
=============================

Use the following command to run the pipeline using five concurrent threads:

```
taiji run --config config.yml -n 5 +RTS -N5
```

The arguments `-n 5 +RTS -N5` tell the `taiji` to use 5 cores/threads.

OR

```
taiji run --config config.yml -n 5 --cloud
```

if you are using a job scheduling system like slurm or PBS.

Taiji is able to pick up where you left off! To demonstrate this,
after finishing a few steps, press `CTRL+C` to STOP the program and then re-run
the program using the exact same command.
You shall see the program continues from the last checkpoint.

Results
=======

