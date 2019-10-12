---
title: ATAC-seq walk-through
---

In this tutorial, we will re-analyze the ATAC-seq data published in
[*Yu, 2017*](https://www.nature.com/articles/ni.3706).

The analysis requires following additional software:

* fastq-dump
* samtools
* MACS2
* bwa
* bedGraphToBigWig

Preparing input
===============

We will use the SRA ID as the input and Taiji will download the data for us.
To do this, add the following lines to the "input.tsv" file:

```
type	id	group	rep	path	format
ATAC-seq	TN	TN	1	SRR5305074	SRA
ATAC-seq	TN	TN	2	SRR5305075	SRA
ATAC-seq	TE	TE	1	SRR5305076	SRA
ATAC-seq	TE	TE	2	SRR5305077	SRA
ATAC-seq	MP	MP	1	SRR5305078	SRA
ATAC-seq	MP	MP	2	SRR5305079	SRA
ATAC-seq	memory	memory	1	SRR5305080	SRA
ATAC-seq	memory	memory	2	SRR5305081	SRA
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

It will take several hours for the program to finish. Once it finishes, all results
will be in the `output` directory, including BAM files, BED files, peaks, etc.

![](static/other/atac_demo/files.png)

Usually the first thing we want to look at is the quality of the data.
The QC metrics can be visualized by the `qc.html` file in the
`output/ATACSeq/QC` directory.

Here are some of the QC metrics:

![](static/other/atac_demo/fig1.png){ width=750px }

Taiji combines motif scanning, network inference and the PageRank algorithm to rank TFs.
This result will be saved in the `GeneRank.tsv` file. There is also a 
`GeneRank.html` file that you can visualize.

![](static/other/atac_demo/fig2.png)

The figure above shows different T cell population has its own unique transcriptional profile.