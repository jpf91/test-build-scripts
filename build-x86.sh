startpath=$(pwd)
echo "Started in $startpath"
ls -la
whoami

cd /home/build
mount nfs

# Setup build system
cp ${startpath}/configs/gccbuild.json ~/.config/gccbuild.json
mkdir /home/build/nfs/download

${startpath}/bin/gcc-build-script download --toolchainConfig ${startpath}/configs/gcc-6/x86_64-unknown-linux-gnu/x86_64-unknown-linux-gnu.json
