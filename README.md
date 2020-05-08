# libffmpeg
ffmpeg static libraries for webassambly

## Prepare emscripten

skip this if you already have emscripten installed.

### install emscripten

```shell
# Download and install the latest SDK tools.
./emsdk install latest

# Make the "latest" SDK "active" for the current user. (writes ~/.emscripten file)
./emsdk activate latest

# Activate PATH and other environment variables in the current terminal
source ./emsdk_env.sh
```

## build
```shell
git clone https://github.com/wasm-player/libffmpeg.git
cd libffmpeg
git submodule init
./build.sh
```

The target files is placed in the `dist` directory
