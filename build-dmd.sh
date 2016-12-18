startpath=$(pwd)

wget 'https://raw.githubusercontent.com/D-Programming-GDC/GDMD/master/dmd-script' -O gdcBin/x86_64-unknown-linux-gnu/bin/gdmd
chmod +x gdcBin/x86_64-unknown-linux-gnu/bin/gdmd

export PATH=$PATH:${startpath}/gdcBin/x86_64-unknown-linux-gnu/bin
cd dmd
make -j2 -C src -f posix.mak MODEL=64 HOST_DMD="gdmd" ENABLE_RELEASE=0

make -f posix.mak test
