#!/bin/sh

echo "Beginning Build:"
cd FFmpeg
make clean
emconfigure ./configure --cc="emcc" --cxx="em++" --ar="emar" --ranlib=emranlib --prefix=$(pwd)/../dist --enable-cross-compile --target-os=none --arch=x86_32 --cpu=generic \
    --enable-gpl --enable-version3 --disable-avdevice --disable-postproc --disable-avfilter \
    --disable-programs --disable-logging --disable-everything \
	--enable-decoder=hevc --enable-decoder=h264 --enable-decoder=mpeg4 \
	--enable-decoder=aac --enable-decoder=mp3 --enable-decoder=pcm_alaw --enable-decoder=pcm_mulaw \
    --disable-ffplay --disable-ffprobe --disable-asm --disable-doc --disable-devices --disable-network \
    --disable-hwaccels --disable-parsers --disable-bsfs --disable-debug --disable-protocols --disable-indevs --disable-outdevs --disable-stripping \
	--disable-pthreads  

make
make install
cd ..

