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

The input file is tab-delimited.
It tells the Taiji to download data from the ENCODE portal and perform joint analysis of these two samples.
Remove the "ENCODE" tag if your files are in a local path, for example:

```
type	id	group	rep	path	tags
scATAC-seq	forebrain_E11.5	forebrain_E11.5	1	e11.5_R1.fastq.gz,e11.5_R2.fastq.gz	Demultiplexed
scATAC-seq	forebrain_P0	forebrain_P0	1	p0_R1.fastq.gz,p0_R2.fastq.gz	Demultiplexed
```

The FASTQ input should be demultiplexed by adding the barcode to the beginning of each read in the following format: "@" + "barcode" + ":" + "read_name". Below is one example of demultiplexed fastq file:

```
$ zcat CEMBA180306_2B.demultiplexed.R1.fastq.gz | head 
@AGACGGAGACGAATCTAGGCTGGTTGCCTTAC:7001113:920:HJ55CBCX2:1:1108:1121:1892 1:N:0:0
ATCCTGGCATGAAAGGATTTTTTTTTTAGAAAATGAAATATATTTTAAAG
+
DDDDDIIIIHIIGHHHIIIHIIIIIIHHIIIIIIIIIIIIIIIIIIIIII
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

Please modify the path of `bwa_index` and `genome`.

Launch the preprocessing pipeline
=================================

The preprocessing pipeline consists of reads mapping, reads filtering, quality control.
Use the command below to execute the preprocessing pipeline:

```
taiji run --config config.yml --select SCATAC_Remove_Duplicates
```

A fragment file will be generated for each FASTQ input in the output directory.
For the format of the fragment file, see here: https://support.10xgenomics.com/single-cell-atac/software/pipelines/latest/output/fragments.