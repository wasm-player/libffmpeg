#!/bin/sh

echo "Beginning Build:"
cd FFmpeg
make clean
emconfigure ./configure --cc="emcc" --cxx="em++" --ar="emar" --ranlib=emranlib --prefix=$(pwd)/../dist --enable-cross-compile --target-os=none --arch=x86_32 --cpu=generic \
    --enable-gpl --enable-version3 --disable-avdevice --disable-postproc --disable-avfilter \
    --disable-programs --disable-logging --disable-everything --enable-decoder=hevc --enable-decoder=h264 \
    --disable-ffplay --disable-ffprobe --disable-asm --disable-doc --disable-devices --disable-network \
    --disable-hwaccels --disable-parsers --disable-bsfs --disable-debug --disable-protocols --disable-indevs --disable-outdevs --disable-stripping \
	--disable-shared --disable-pthreads --extra-cflags="-s STANDALONE_WASM -s EMCC_FORCE_STDLIBS=1"

sed -i '' 's/HAVE_LRINT 0/HAVE_LRINT 1/g' config.h
sed -i '' 's/HAVE_LRINTF 0/HAVE_LRINTF 1/g' config.h
sed -i '' 's/HAVE_ROUND 0/HAVE_ROUND 1/g' config.h
sed -i '' 's/HAVE_ROUNDF 0/HAVE_ROUNDF 1/g' config.h
sed -i '' 's/HAVE_TRUNC 0/HAVE_TRUNC 1/g' config.h
sed -i '' 's/HAVE_TRUNCF 0/HAVE_TRUNCF 1/g' config.h
sed -i '' 's/HAVE_CBRT 0/HAVE_CBRT 1/g' config.h
sed -i '' 's/HAVE_RINT 0/HAVE_RINT 1/g' config.h
sed -i '' 's/HAVE_HYPOT 0/HAVE_HYPOT 1/g' config.h
sed -i '' 's/HAVE_ISFINITE 0/HAVE_ISFINITE 1/g' config.h
sed -i '' 's/HAVE_ISNAN 0/HAVE_ISNAN 1/g' config.h
sed -i '' 's/HAVE_ERF 0/HAVE_ERF 1/g' config.h
sed -i '' 's/HAVE_COPYSIGN 0/HAVE_COPYSIGN 1/g' config.h
sed -i '' 's/HAVE_CBRTF 0/HAVE_CBRTF 1/g' config.h

make
make install
cd ..

