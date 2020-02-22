Installation instruction for command line interface
===================================================

Installing Taiji is as easy as downloading the binary file from
[github](https://github.com/Taiji-pipeline/Taiji/releases).

The binary works for most Linux systems.
If the binary does not work for you, you can build the program from the source
following these [instructions](https://taiji-pipeline.github.io/documentation/install.html).)

After installing the program, put it in your system's PATH. To verify that the
installation is successful, type ``taiji --help`` in your command line.

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