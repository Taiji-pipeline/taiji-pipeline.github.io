---
title: "scRNA: Mouse heart and brain (preview)"
---

The analysis requires following additional software:

* STAR
* samtools
* taiji-utils: install using `pip install taiji-utils`

Preparing input
===============

```
type	id	group	rep	path
scRNA-seq	heart_1k_v3	heart	1	data/heart_1k_v3_R1.fastq.gz,data/heart_1k_v3_R2.fastq.gz
scRNA-seq	neuron_1k_v3	neuron	1	data/neuron_1k_v3_R1.fastq.gz,data/neuron_1k_v3_R2.fastq.gz
```

```
output_dir: output
input: input.tsv
assembly: mm10
scrna_cell_barcode_length: 16
scrna_umi_length: 12
cluster_optimizer: CPM
cluster_resolution: 0.5
```