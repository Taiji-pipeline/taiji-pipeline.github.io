---
title: "scATAC: Mouse forebrain"
---

(Require version v1.3 or above)

The analysis may need following additional software:

* samtools >= v1.9.
* BWA >= v0.7.17.
* taiji-utils: install using `pip install taiji-utils`.

Preparing input
===============

Create a new file named `input.tsv` and follow instructions below based on the type of input files.

<ul class="tabs" data-responsive-accordion-tabs="tabs medium-accordion large-tabs" id="example-tabs">
  <li class="tabs-title is-active"><a href="#panel1" aria-selected="true">Fragment file</a></li>
  <li class="tabs-title"><a href="#panel2">FASTQ</a></li>
</ul>

:::::: {.tabs-content data-tabs-content="example-tabs"}

::: {#panel1 .tabs-panel .is-active}

```
type	id	rep	path	tags	format
scATAC-seq	pbmc_10k	1	URL:https://cf.10xgenomics.com/samples/cell-atac/1.2.0/atac_pbmc_10k_nextgem/atac_pbmc_10k_nextgem_fragments.tsv.gz	PairedEnd,Gzip	Bed
```

In this example, we downloaded the fragment file from the 10x Genomics website.

:::

::: {#panel2 .tabs-panel}

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

:::

::::::

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
If you don't have genome fasta file or BWA index on your computer, you can tell
Taiji to automatically download that for you by specifying the genome assembly:

```
input: "input.tsv"
output_dir: "output/"
assembly: "mm10"
```

Launch the preprocessing pipeline
=================================

The preprocessing pipeline consists of reads mapping, reads filtering, quality control.
Use the command below to execute the preprocessing pipeline:

```
taiji run --config config.yml --select SCATAC_Remove_Duplicates
```

A fragment file will be generated for each FASTQ input in the output directory.
For the format of the fragment file, see here: https://support.10xgenomics.com/single-cell-atac/software/pipelines/latest/output/fragments.

Quality control
===============

```
taiji run --config config.yml --select SCATAC_QC
```

Joint clustering analysis
=========================

```
taiji run --config config.yml --select SCATAC_Merged_Cluster
```

More analyses
=============

Use `taiji view taiji.html` to see what are availiable!