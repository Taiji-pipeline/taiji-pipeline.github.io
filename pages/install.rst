---
title: install
install: yes
---

Installation instruction for command line interface
---------------------------------------------------

The pre-built binary for Linux system can be downloaded from `github <https://github.com/Taiji-pipeline/Taiji/releases>`_.
The binary depends on several external libraries. Most of them should have
already been installed in standard Linux environment, except for igraph C library
which can be downloaded and installed from `here <http://igraph.org/c/#downloads>`_.

After downloading the binary, put it in your system's PATH. To verify that the
installation is successful, type ``taiji --help`` in your command line.

External software
-----------------

Taiji uses serveral other software, listed below:

Mandatory:

- `samtools-v1.3.1 <https://github.com/samtools/samtools/releases>`_
- BWA-v0.7.12
- `MACS2-v2.1.1.20160309 <https://pypi.python.org/pypi/MACS2/2.1.1.20160309>`_
- `Picard <https://github.com/broadinstitute/picard/releases/tag/2.6.0>`_
- java-v1.8 (required by Picard)

Optional:

- STAR-v2.5.2b (RNA-seq analysis)
- `RSEM-1.2.31 <https://github.com/deweylab/RSEM/releases>`_ (RNA-seq analysis)

.. warning::
    Software with older versions might not work.
