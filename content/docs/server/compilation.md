---
weight: 11
title: "Building from source"
description: "Step-by-step instructions for compiling from source code for each platform"
icon: "fa-solid fa-wrench"
date: "2023-12-20"
toc: true
---

This page outlines procedures for compiling SpMs from its source code. For installing from pre-compiled packages, see [Installation]({{% relref "docs/server/installation" %}}).

##### Requirements

All platforms:
- [Java Development Kit (JDK) 17](https://www.oracle.com/java/technologies/downloads/#java17) ([Arch](https://archlinux.org/packages/extra/x86_64/jre17-openjdk/), [Ubuntu](https://packages.ubuntu.com/openjdk-17-jdk))

Linux only:
- pkg-config ([Arch](https://archlinux.org/packages/core/x86_64/pkgconf/), [Ubuntu](https://packages.ubuntu.com/pkg-config))
- make ([Arch](https://archlinux.org/packages/core/x86_64/make/), [Ubuntu](https://packages.ubuntu.com/make))
- libmpv ([Arch](https://archlinux.org/packages/extra/x86_64/mpv/), [Ubuntu](https://packages.ubuntu.com/libmpv-dev))
- libappindicator3 ([Arch](https://archlinux.org/packages/extra/x86_64/libappindicator-gtk3/files/), [Ubuntu](https://packages.ubuntu.com/libappindicator3-dev))
- libcurl ([Arch](https://archlinux.org/packages/core/x86_64/curl/), [Ubuntu](https://packages.ubuntu.com/libcurl4-openssl-dev))

### Download source code

From a command-line terminal:

1. Clone the spmp-server Git repository

    `git clone https://github.com/toasterofbread/spmp-server`

2. Enter the cloned directory `cd spmp-server`

{{< snippet "gradle_commands.md" >}}

### Build on Linux

###### 1. Install the Kotlin/Native gcc toolchain
1. Download toolchain from

    https://download.jetbrains.com/kotlin/native/x86_64-unknown-linux-gnu-gcc-8.3.0-glibc-2.19-kernel-4.9-2.tar.gz

2. Extract downloaded archive to a convenient location

###### 2. Compile libzmq with draft APIs
1. Download [4.3.5](https://github.com/zeromq/libzmq/releases/tag/v4.3.5) libzmq source code

    https://github.com/zeromq/libzmq/releases/download/v4.3.5/zeromq-4.3.5.tar.gz

2. Extract downloaded archive to a convenient location and cd into the extracted directory
3. Configure and compile the build by running the following commands

```
# Configure build
LDFLAGS="-lgcc -lgcc_s" \
CC=<toolchain path>/bin/x86_64-unknown-linux-gnu-gcc \
CXX=<toolchain path>/bin/x86_64-unknown-linux-gnu-g++ \
./configure \
    --enable-drafts \
    --enable-static \
    --disable-shared \
    --disable-libbsd \
    --prefix=<absolute path to spms>/src/nativeInterop/linux-x86_64

# Compile
make -j$(nproc)

# Install to prefix
make install
```

###### 3. Compile SpMs by running the Gradle command `linux-x86_64BinariesStatic`

###### 4. Upon completion, debug and release executables will be contained in `spms/build/bin/linux-x86_64/debugExecutable/` and `spms/build/bin/linux-x86_64/releaseExecutable/` respectively

### Build on Windows

###### 1. Download and set up vcpkg
1. Clone the `https://github.com/Microsoft/vcpkg.git` Git repository (`--depth 1` argument recommended)
2. Run `bootstrap-vcpkg.bat` inside the cloned directory

###### 2. Build libzmq and libcurl
1. Run `vcpkg install curl:x64-windows` inside the vcpkg directory
2. Run `vcpkg install zeromq[draft]:x64-windows` inside the vcpkg directory
3. Copy the `bin`, `include`, and `lib` directories from `<vcpkg directory>/installed/x64-windows` to `spms/src/nativeInterop/windows-x86_64`

###### 3. Download libmpv
1. Download ``mpv-dev-x86_64-20240121(...).7z`` from the [libmpv SourceForge page](https://sourceforge.net/projects/mpv-player-windows/files/libmpv/)

    https://deac-ams.dl.sourceforge.net/project/mpv-player-windows/libmpv/mpv-dev-x86_64-20240121-git-a39f9b6.7z

2. Extract the downloaded archive to a convenient location
3. Copy/move the following files/directories from the extracted zip:

    - `include` into `spms/src/nativeInterop/windows-x86_64`
    - `libmpv.dll.a` into `spms/src/nativeInterop/windows-x86_64/lib`
    - `libmpv-2.dll` into `spms/src/nativeInterop/windows-x86_64/bin`

<!-- {{< collapsible summary="Cross-compiling from Linux" >}}

1. Install mingw-w64-gcc ([Arch](https://archlinux.org/packages/extra/x86_64/mingw-w64-gcc/), [Ubuntu](https://packages.ubuntu.com/gcc-mingw-w64))
2. Clone the `https://github.com/Microsoft/vcpkg.git` Git repository (`--depth 1` argument recommended)
3. Run `./bootstrap-vcpkg.sh` inside the cloned directory
4. Run `./vcpkg install zeromq[draft]:x64-mingw-dynamic` inside the cloned directory
5. Copy the `bin`, `include`, and `lib` directories from `<cloned directory>/packages/zeromq_x64-mingw-dynamic` to `spms/src/nativeInterop`

{{< /collapsible >}} -->

###### 3. Compile SpMs by running the Gradle command `windows-x86_64Binaries`

###### 4. Upon completion, debug and release executables will be contained in `spms/build/bin/windows-x86_64/debugExecutable/` and `spms/build/bin/windows-x86_64/releaseExecutable/` respectively
