Installation instruction for command line interface
===================================================

Pre-built binaries are available for macOS and Linux systems from 
[github](https://github.com/Taiji-pipeline/Taiji/releases).

- `taiji-CentOS-x86_64`: for Red Hat Enterprise Linux derivatives.

- `taiji-Ubuntu-x86_64`: for Debian linux derivatives.

- `taiji-macOS-XX-XX`: for macOS.

Example:

```
curl -L https://github.com/Taiji-pipeline/Taiji/releases/latest/download/taiji-CentOS-x86_64 -o taiji
chmod +x taiji
./taiji --help
```

If a binary is not available for your platform, you can build the program from the source
following these [instructions](https://taiji-pipeline.github.io/documentation/install.html).

After installing the program, put it in your system's PATH. To verify that the
installation is successful, type ``taiji --help`` in your command line.