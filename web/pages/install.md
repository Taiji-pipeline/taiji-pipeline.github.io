Installation instruction for command line interface
===================================================

The pre-built binary for Linux system can be downloaded
from [github](https://github.com/Taiji-pipeline/Taiji/releases)
(For other platforms, you will need to build the program from the source following these [instructions](https://taiji-pipeline.github.io/documentation/install.html).)
The binary depends on several external libraries. Most of them should have
already been installed in standard Linux environment, except for igraph C library
which can be downloaded and installed from [here](http://igraph.org/c/#downloads).

After downloading the binary, put it in your system's PATH. To verify that the
installation is successful, type ``taiji --help`` in your command line.

Dependent software
------------------

Taiji may use other software depending on the input data type: 

- [samtools](https://github.com/samtools/samtools/releases): Filtering bam files.
- [BWA](https://github.com/lh3/bwa/releases): Reads alignment.
- [MACS2](https://pypi.org/project/MACS2/): Peak calling.
- [STAR](https://github.com/alexdobin/STAR/releases): RNA-seq reads alignment.
- [RSEM](https://github.com/deweylab/RSEM/releases): RNA-seq quantification.

<!-- 
Installation instruction for graphical user interface
=====================================================

After Taiji is successfully installed, download the ``taiji-viz`` binary from
[here](https://github.com/Taiji-pipeline/Taiji-viz/releases).


To use ``taiji-viz``, run ``taiji-viz`` on the command line. Then open
a web browser and go to "127.0.0.1:8787".

Remote Access
-------------

When you have installed ``taiji`` and ``taiji-viz`` on a remote server, you can
use your laptop or desktop to control and monitor the execution of the program.

To do so, follow these steps:

1. Run ``taiji-viz`` on a remote server.
2. On the local machine, create a SSH tunnel: ``ssh -L 8787:localhost:8787 username@server``
3. Open a web browser and go to "127.0.0.1:8787".

-->