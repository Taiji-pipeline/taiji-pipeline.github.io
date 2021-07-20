---
title: "Single cell RNA-seq (Preview)"
---

(Require version v1.3 or above)

The analysis may need following additional software:

* samtools >= v1.9.
* BWA >= v0.7.17.
* taiji-utils: install using `pip install taiji-utils`.

Preparing input and configuration files
=======================================

To start, create a TAB-delimited file named `input.tsv` and a YAML file named `config.yml`.
Taiji accepts multiple types of input. Below are example input and configuration files for common input types.
Detailed documentation about the input format can be found [here](https://taiji-pipeline.github.io/documentation/input.html).

<ul class="tabs" data-responsive-accordion-tabs="tabs medium-accordion large-tabs" id="example-tabs">
  <li class="tabs-title is-active"><a href="#panel1" aria-selected="true">Raw FASTQ</a></li>
  <li class="tabs-title"><a href="#panel2">Demultiplexed FASTQ</a></li>
</ul>

:::::: {.tabs-content data-tabs-content="example-tabs"}

::: {#panel1 .tabs-panel .is-active}

### File 1: input.tsv

```
type	id	rep	path
scRNA-seq	pbmc	1	pbmc_granulocyte_sorted_10k_RNA_R1.fastq.gz,pbmc_granulocyte_sorted_10k_RNA_R2.fastq.gz
```

In this example input file, we analyze the raw fastq files produced by the 10x Genomics platform.

### File 2: config.yml

```
output_dir: "output"
input: input.tsv

genome: "path-to-genome/GRCh38.fa"
star_index: "path-to-STAR/STAR_index"  # optional
genome_index: "path-to-genome/GRCh38.index"  # optional
annotation: "path-to-annotation/gencode.v31.annotation.gtf"

scrna_options:
  cell_barcode_length: 16   # specific to 10X genomics
  umi_length: 12   # specific to 10X genomics
```

See [here](https://taiji-pipeline.github.io/documentation/options.html) for all available options and their roles.

:::

::: {#panel2 .tabs-panel}

### File 1: input.tsv

```
type	id	group	rep	path	tags
scRNA-seq	forebrain_E11.5	forebrain_E11.5	1	E11.5_R1.fastq.gz,E11.5_R2.fastq.gz	Demultiplexed
scRNA-seq	forebrain_P0	forebrain_P0	1	P0_R1.fastq.gz,P0_R2.fastq.gz	Demultiplexed
```

In this example we used demultiplexed FASTQ files, in which each fastq record
were demultiplexed by adding the barcode to the beginning of each read
in the following format: "@" + "barcode" + ":" + "read_name".
Below is one example of demultiplexed fastq file:

```
$ zcat CEMBA180306_2B.demultiplexed.R1.fastq.gz | head 
@AGACGGAGACGAATCTAGGCTGGTTGCCTTAC:7001113:920:HJ55CBCX2:1:1108:1121:1892 1:N:0:0
ATCCTGGCATGAAAGGATTTTTTTTTTAGAAAATGAAATATATTTTAAAG
+
DDDDDIIIIHIIGHHHIIIHIIIIIIHHIIIIIIIIIIIIIIIIIIIIII
```

### File 2: config.yml

```
input: "input.tsv"
output_dir: "output/"
bwa_index: "path-to-BWAIndex/genome.fa"
genome: "path-to-genome-fasta/genome.fa"
```

If you don't have genome fasta file or BWA index on your computer, you can tell
Taiji to automatically download that for you by specifying the genome assembly:

```
input: "input.tsv"
output_dir: "output/"
assembly: "mm10"
```

:::

::::::

Quality control
===============

```
taiji run --config config.yml --select SCRNA_QC
```

More analyses
=============

Use `taiji view taiji.html` to see what are availiable!