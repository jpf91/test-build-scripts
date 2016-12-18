startpath=$(pwd)


export PATH=$PATH:${startpath}/gdcBin/x86_64-unknown-linux-gnu/bin
cd vibe
dub build --compiler=gdc
