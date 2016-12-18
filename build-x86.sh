startpath=$(pwd)

mkdir -p /home/build/share/host-toolchains
mkdir -p /home/build/share/cache
cd /home/build/share

wget ftp://ftp.gdcproject.org/extra/build_tools.tar.xz
wget ftp://ftp.gdcproject.org/extra/configs.tar.xz
wget ftp://ftp.gdcproject.org/extra/patches.tar.xz
wget ftp://ftp.gdcproject.org/extra/x86_64-unknown-linux-gnu.tar.xz

tar xf build_tools.tar.xz
tar xf configs.tar.xz
cd host-toolchains
tar xf ../x86_64-unknown-linux-gnu.tar.xz
cd ../cache
tar xf ../patches.tar.xz
cd ../
rm *.xz

ls -l /home/build/

export PATH=$PATH:/home/build/share/build_tools
export PATH=$PATH:/home/build/share/host-toolchains/x86_64-unknown-linux-gnu/xbin

gcc-build-script /home/build/share/configs/sources-6-oldbinutils.json configs/x86_64/linux-ml.json --force-extract --num-cpus=4 --gdc-src=${startpath}/gdc-6 --mirrors=configs/mirrors.json '--variable=PKGVERSION:"gdcproject.org 20161218-v2.068.2_gcc6"' --type=cross --target-strip=strip --host-strip=x86_64_host-unknown-linux-gnu-strip --variable=HOST_TOOLPREFIX:x86_64_host-unknown-linux-gnu --host=x86_64-unknown-linux-gnu

mv -v /home/build/share/cache/install/x86_64-unknown-linux-gnu ${startpath}/result/
