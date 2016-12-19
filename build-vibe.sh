startpath=$(pwd)


export PATH=$PATH:${startpath}/gdcBin/x86_64-unknown-linux-gnu/bin
cd vibe
git checkout v0.7.30
dub build --compiler=gdc
dub test --compiler=gdc
