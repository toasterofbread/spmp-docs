---
weight: 11
title: "Building from source"
description: ""
date: "2023-12-20"
toc: true
---

This page outlines procedures for compiling SpMs from its source code. For installing from pre-compiled packages, see [Installation]({{% relref "docs/server/installation" %}}).

##### Requirements
- [Java Development Kit (JDK) 17](https://www.oracle.com/java/technologies/downloads/#java17) ([Arch](https://archlinux.org/packages/extra/x86_64/jre17-openjdk/), [Ubuntu]())

### Downloading source code

From a command-line terminal:

1. Clone the spmp-server Git repository and its submodules 
`git clone https://github.com/toasterofbread/spmp-server`

2. Enter the cloned directory `cd spmp-server`

### Compiling

{{< snippet "gradle_commands.md" >}}

#### Linux

1. Compile libzmq with draft APIs
    1. Download [4.3.5](https://github.com/zeromq/libzmq/releases/tag/v4.3.5) libzmq source code ([direct link](https://github.com/zeromq/libzmq/releases/download/v4.3.5/zeromq-4.3.5.tar.gz))
    2. Extract downloaded archive to a convenient location and cd into the extracted directory
    3. Configure build by running `./configure --enable-drafts --enable-static --disable-shared --disable-libbsd --prefix=<absolute path to spms/src/nativeInterop>`
    4. Build and install libzmq by running `make -j$(nproc) && make install`
2. Install other dependencies
    - libmpv ([Arch](https://archlinux.org/packages/extra/x86_64/mpv/), [Ubuntu](https://packages.ubuntu.com/libmpv-dev))
    - libappindicator3 ([Arch](https://archlinux.org/packages/extra/x86_64/libappindicator-gtk3/files/), [Ubuntu](https://packages.ubuntu.com/libappindicator3-1))
3. Compile SpMs by running the Gradle command `nativeBinaries`
4. Upon completion, debug and release executables will be contained in `spms/build/bin/native/debugExecutable/` and `spms/build/bin/native/releaseExecutable/` respectively

#### Windows

1. Download libmpv
    1. Download ``mpv-dev-x86_64-20240121(...).7z`` from https://sourceforge.net/projects/mpv-player-windows/files/libmpv/ ([direct link](https://deac-ams.dl.sourceforge.net/project/mpv-player-windows/libmpv/mpv-dev-x86_64-20240121-git-a39f9b6.7z))
    2. Extract the downloaded zip to a convenient location
    3. Copy/move the following files/directories from the extracted zip:
        - `include` -> `spms/src/nativeInterop/`
        - `libmpv.dll.a` -> `spms/src/nativeInterop/lib`
        - `libmpv-2.dll` -> `spms/src/nativeInterop/bin`
2. Download libzmq with draft APIs
    1. Clone the `https://github.com/Microsoft/vcpkg.git` Git repository (`--depth 1` argument recommended)
    2. Run `bootstrap-vcpkg.bat` inside the cloned directory
    3. Run `vcpkg install zeromq[draft]:x64-windows` inside the cloned directory
    4. Copy the `bin`, `include`, and `lib` directories from `<cloned directory>/packages/zeromq_x64-windows` to `spms/src/nativeInterop`
3. Compile SpMs by running the Gradle command `nativeBinaries`
4. Upon completion, debug and release executables will be contained in `spms/build/bin/native/debugExecutable/` and `spms/build/bin/native/releaseExecutable/` respectively
