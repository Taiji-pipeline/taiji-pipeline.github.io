---
title: "scATAC: Mouse forebrain"
---

The analysis requires following additional software:

* samtools >= v1.9.
* BWA >= v0.7.17

Preparing input
===============

Open a new file named `input.tsv` and write down the following content:

```
type	id	group	rep	path	tags
scATAC-seq	forebrain_E11.5	forebrain_E11.5	1	ENCFF951ZRW,ENCFF197HRD	ENCODE,Demultiplexed
scATAC-seq	forebrain_P0	forebrain_P0	1	ENCFF501RJM,ENCFF595BQU	ENCODE,Demultiplexed
```

This input file tells the Taiji to download data from the ENCODE portal and perform joint analysis of these two samples.
Remove the "ENCODE" tag if your files are in a local path, for example:

```
type	id	group	rep	path	tags
scATAC-seq	forebrain_E11.5	forebrain_E11.5	1	e11.5_R1.fastq.gz,e11.5_R2.fastq.gz	Demultiplexed
scATAC-seq	forebrain_P0	forebrain_P0	1	p0_R1.fastq.gz,p0_R2.fastq.gz	Demultiplexed
```

Configuration
=============

Open a new file named `config.yml` and write down the following content:

```
input: "input.tsv"
output_dir: "output/"
bwa_index: "path-to-BWAIndex/genome.fa"
genome: "path-to-genome-fasta/genome.fa"
```

Launch the preprocessing pipeline
=================================

The preprocessing pipeline consists of reads mapping, reads filtering, quality control.
Use the command below to execute the preprocessing pipeline:

```
taiji run --config config.yml --select SCATAC_Remove_Duplicates
```

A fragment file is finally generated for each FASTQ input.
For the format of the fragment file, see here: https://support.10xgenomics.com/single-cell-atac/software/pipelines/latest/output/fragments.