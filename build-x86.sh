startpath=$(pwd)
echo "Started in $startpath"
scripts=${startpath}/buildscripts
ls -la
whoami

ping -c 1 154.16.245.132

cd /home/build
mount nfs

# Setup build system
cp ${scripts}/configs/gccbuild.json ~/.config/gccbuild.json
mkdir /home/build/nfs/download

${scripts}/bin/gcc-build-script download --toolchainConfig ${scripts}/configs/gcc-6/x86_64-unknown-linux-gnu/x86_64-unknown-linux-gnu.json
