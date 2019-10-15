---
title: "ATAC+RNA: Mouse blood formation"
---

In this tutorial, we will perform an integrated analysis of ATAC-seq and RNA-seq
data published in [*Lara-Astiaso, 2014*](https://science.sciencemag.org/content/345/6199/943).

The analysis requires following additional software:

* fastq-dump
* samtools
* MACS2
* bwa
* STAR
* RSEM
* bedGraphToBigWig

Preparing input
===============

input.tsv:

```
type	id	group	rep	path	format
ATAC-seq	B_ATAC	B	1	SRR1533849+SRR1533848+SRR1533847	SRA
ATAC-seq	GMP_ATAC	GMP	1	SRR1533850+SRR1533851	SRA
ATAC-seq	Mono_ATAC	Mono	1	SRR1533852	SRA
ATAC-seq	CD4_ATAC	CD4	1	SRR1533853+SRR1533854+SRR1533855+SRR1533856	SRA
ATAC-seq	Granulocytes_ATAC	Granulocytes	1	SRR1533857+SRR1533858	SRA
ATAC-seq	NK_ATAC	NK	1	SRR1533859+SRR1533860	SRA
ATAC-seq	CD8_ATAC	CD8	1	SRR1533861	SRA
ATAC-seq	CMP_ATAC	CMP	1	SRR1533865+SRR1533866+SRR1533867	SRA
ATAC-seq	MEP_ATAC	MEP	1	SRR1533868+SRR1533869+SRR1533870	SRA
ATAC-seq	EryA_ATAC	EryA	1	SRR3001797	SRA
RNA-seq	B_RNA	B	1	SRR1536411+SRR1536412	SRA
RNA-seq	GMP_RNA	GMP	1	SRR1536393+SRR1536394+SRR1536395+SRR1536396	SRA
RNA-seq	Mono_RNA	Mono	1	SRR1536407+SRR1536408+SRR1536409+SRR1536410	SRA
RNA-seq	CD4_RNA	CD4	1	SRR1536413+SRR1536414+SRR1536415+SRR1536416	SRA
RNA-seq	Granulocytes_RNA	Granulocytes	1	SRR1536401+SRR1536402+SRR1536403+SRR1536404+SRR1536405+SRR1536406	SRA
RNA-seq	NK_RNA	NK	1	SRR1536421+SRR1536422	SRA
RNA-seq	CD8_RNA	CD8	1	SRR1536417+SRR1536418+SRR1536419+SRR1536420	SRA
RNA-seq	CMP_RNA	CMP	1	SRR1536389+SRR1536390+SRR1536391+SRR1536392	SRA
RNA-seq	MEP_RNA	MEP	1	SRR1536423+SRR1536424+SRR1536425+SRR1536426	SRA
RNA-seq	EryA_RNA	EryA	1	SRR1536427+SRR1536428	SRA
```

config.yml:

```
input: "input.tsv"
output_dir: "output/"
assembly: "mm10"
```

Running the analysis
====================

This is a large dataset and it will take a long time if we run it on a desktop.
Nowadays large-scale computing usually happens in the cloud.
So in this tutorial I will show you how to use Taiji in a HPC cluster.

First you need to have an access to a HPC cluster that supports slurm or PBS like
workload manager. Now, put following lines in your `config.yml` file:

```
submit_params: "-q home -l walltime=10:00:00"
submit_command: "qsub"
submit_cpu_format: "-l nodes=1:ppn=%d"
submit_memory_format: "-l mem=%dG
```

This configuration works for The Triton Shared Computing Cluster (TSCC) at UCSD.
You may need to make adjustment for your local environment.

The submission parameters of individual step are configurable as well:

```
resource:
  RNA_Align
    parameter: "-q home -l walltime=24:00:00"
    memory: 50

  ATAC_Align:
    memory: 10
```

Once you have your `config.yml` file ready, run the analysis using:

```
taiji run --config config.yml --cloud
```