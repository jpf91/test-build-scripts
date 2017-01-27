startpath=$(pwd)
echo "Started in $startpath"
scripts=${startpath}/buildscripts
ls -la
whoami

ls -la ${startpath}/buildscripts
ls -la ${startpath}/buildscripts/bin

cd /home/build
mount nfs

# Setup build system
mkdir -p ~/.config/
cp ${scripts}/configs/gccbuild.json ~/.config/gccbuild.json
mkdir /home/build/nfs/download

${scripts}/bin/gcc-build-script download --toolchainConfig ${scripts}/configs/gcc-6/x86_64-unknown-linux-gnu/x86_64-unknown-linux-gnu.json
