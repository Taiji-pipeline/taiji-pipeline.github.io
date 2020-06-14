---
title: "scATAC: Mouse forebrain"
---

The analysis requires following additional software:

* STAR
* samtools
* taiji-utils: install using `pip install taiji-utils`

Preparing input
===============

Open a new file named `input.tsv` and write down the following content:

```
type	id	group	rep	path	tags
scATAC-seq	forebrain_E11.5	forebrain_E11.5	1	ENCFF951ZRW,ENCFF197HRD	ENCODE
scATAC-seq	forebrain_E11.5	forebrain_E11.5	2	ENCFF891VAQ,ENCFF552XGT	ENCODE
scATAC-seq	forebrain_E12.5	forebrain_E12.5	1	ENCFF081FAO,ENCFF904ZDS	ENCODE
scATAC-seq	forebrain_E12.5	forebrain_E12.5	2	ENCFF374NTA,ENCFF301LQM	ENCODE
scATAC-seq	forebrain_E13.5	forebrain_E13.5	1	ENCFF581OAJ,ENCFF812AUY	ENCODE
scATAC-seq	forebrain_E13.5	forebrain_E13.5	2	ENCFF077GKE,ENCFF710ATX	ENCODE
scATAC-seq	forebrain_E14.5	forebrain_E14.5	1	ENCFF587KRI,ENCFF283EGO	ENCODE
scATAC-seq	forebrain_E14.5	forebrain_E14.5	2	ENCFF061SMB,ENCFF839ERM	ENCODE
scATAC-seq	forebrain_E15.5	forebrain_E15.5	1	ENCFF591IHF,ENCFF661QAL	ENCODE
scATAC-seq	forebrain_E15.5	forebrain_E15.5	2	ENCFF884MDH,ENCFF404JQZ	ENCODE
scATAC-seq	forebrain_E16.5	forebrain_E16.5	1	ENCFF205SAY,ENCFF025ZBZ	ENCODE
scATAC-seq	forebrain_E16.5	forebrain_E16.5	2	ENCFF977WVQ,ENCFF109MET	ENCODE
scATAC-seq	forebrain_P0	forebrain_P0	1	ENCFF501RJM,ENCFF595BQU	ENCODE
scATAC-seq	forebrain_P0	forebrain_P0	2	ENCFF602DGM,ENCFF167TIP	ENCODE
scATAC-seq	forebrain_8w	forebrain_8w	1	ENCFF035ZNU,ENCFF102XWY	ENCODE
scATAC-seq	forebrain_8w	forebrain_8w	2	ENCFF995HXS,ENCFF461BNI	ENCODE
```

configuration
=============

Open a new file named `config.yml` and write down the following content:

```
input: "input.tsv"
output_dir: "output/"
assembly: "mm10"
cluster_optimizer: CPM
cluster_resolution: 0.1
```

Launch the analysis
===================

Instead of running the full pipeline, we want to inspect the clustering result first.
To do this, we can stop the pipeline after finishing clustering:

```
taiji run --config config.yml --select SCATAC_Merged_Clustering
```
