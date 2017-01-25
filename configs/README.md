## TODO ##

* Currently building x86_64 compilers does sometimes use the 'native' mode in
GCC. This means configure scripts in GCC expect to be able to run programs
built for a x86_64 target. This is not necessarily true: E.g. if we enable
x32 multilib, but the host kernel doesn't have x32 support we can't run these
programs. We therefore should force GCC to build a cross compiler. This can
be done in the crosstool-NG way, by 'mangling' the build triplet so the configure
scripts will now detect build != host. A better solution might be setting
cross_compiling=yes similar to the way it's done for glibc.

* We observed random build failures for certain cross compilers when using `-j4`.
In some cases the druntime library is linked before libbacktrace finished compiling.
As a workaround, use `-j1` or simply restart the build.

* When building a native GCC, the GCC configure scripts might detect binutils features from
the cross-compiler toolchain for the target. This at least happens when building the
X86_64 native compiler with the X86_64 sysrooted compiler. Verify if this is a problem for
the ARM native compilers as well. 
