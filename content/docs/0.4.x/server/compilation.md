---
weight: 11
title: "Building from source"
description: "Step-by-step instructions for compiling from source code for each platform"
icon: "fa-solid fa-wrench"
date: "2023-12-20"
toc: true
---

This page outlines procedures for compiling SpMs from its source code. For installing from pre-compiled packages, see [Installation]({{% relref "./installation" %}}).

##### Requirements

All platforms:
- [JDK 22](https://www.oracle.com/java/technologies/downloads/#java22) ([Arch](https://archlinux.org/packages/extra/x86_64/jre-openjdk/), [Ubuntu](https://packages.ubuntu.com/mantic/openjdk-22-jre))

Linux only:
- pkg-config ([Arch](https://archlinux.org/packages/core/x86_64/pkgconf/), [Ubuntu](https://packages.ubuntu.com/pkg-config))
- make ([Arch](https://archlinux.org/packages/core/x86_64/make/), [Ubuntu](https://packages.ubuntu.com/make))
- libcurl ([Arch](https://archlinux.org/packages/core/x86_64/curl/), [Ubuntu](https://packages.ubuntu.com/libcurl4-openssl-dev))

- Not required for minimal build:
    - libmpv ([Arch](https://archlinux.org/packages/extra/x86_64/mpv/), [Ubuntu](https://packages.ubuntu.com/libmpv-dev))
    - libappindicator3 ([Arch](https://archlinux.org/packages/extra/x86_64/libappindicator-gtk3/files/), [Ubuntu](https://packages.ubuntu.com/libappindicator3-dev))

### Download source code

From a command-line terminal:

1. Clone the spmp-server Git repository

    `git clone https://github.com/toasterofbread/spmp-server`

2. Enter the cloned directory `cd spmp-server`

{{< snippet "gradle_commands.md" >}}

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
# Configure build (x86)
LDFLAGS="-lgcc -lgcc_s" \
CC=<toolchain path>/bin/x86_64-unknown-linux-gnu-gcc \
CXX=<toolchain path>/bin/x86_64-unknown-linux-gnu-g++ \
./configure \
    --enable-drafts \
    --enable-static \
    --disable-shared \
    --disable-libbsd \
    --prefix=<absolute path to spms>/library/src/nativeInterop/linuxX64

# Configure build (Arm)
LDFLAGS="-lgcc -lgcc_s" \
CC=<toolchain path>/bin/aarch64-unknown-linux-gnu-gcc \
CXX=<toolchain path>/bin/aarch64-unknown-linux-gnu-g++ \
./configure \
    --host=arm-none-linux-gnueabi \
    --enable-drafts \
    --enable-static \
    --disable-shared \
    --disable-libbsd \
    --prefix=<absolute path to spms>/library/src/nativeInterop/linuxArm64

# Compile
make -j$(nproc)

# Install to prefix
make install
```

###### 3. Compile SpMs by running the Gradle command `app:linuxX64Binaries` (or `app:linuxArm64Binaries` for Arm)

###### 4. Upon completion, x86 and Arm executables will be contained in `spms/app/build/bin/linuxX64/releaseExecutable/` and `spms/app/build/bin/linuxArm64/releaseExecutable/` respectively

### Build binary on Windows

###### 1. Download and set up vcpkg
1. Clone the `https://github.com/Microsoft/vcpkg.git` Git repository (`--depth 1` argument recommended)
2. Run `bootstrap-vcpkg.bat` inside the cloned directory

###### 2. Build libzmq and libcurl
1. Run `vcpkg install zeromq[draft]:x64-windows curl:x64-windows` inside the vcpkg directory
2. Copy the `bin`, `include`, and `lib` directories from `<vcpkg directory>/installed/x64-windows` to `spms/library/src/nativeInterop/mingwX64`

###### 3. Download libmpv
1. Download ``mpv-dev-x86_64-20240121(...).7z`` from the [libmpv SourceForge page](https://sourceforge.net/projects/mpv-player-windows/files/libmpv/)

    https://sourceforge.net/projects/mpv-player-windows/files/libmpv/mpv-dev-x86_64-20240121-git-a39f9b6.7z

2. Extract the downloaded archive to a convenient location
3. Copy/move the following files/directories from the extracted zip:

    - `include` into `spms/library/src/nativeInterop/windows-x86_64`
    - `libmpv.dll.a` into `spms/library/src/nativeInterop/windows-x86_64/lib`
    - `libmpv-2.dll` into `spms/library/src/nativeInterop/windows-x86_64/bin`

<!-- {{< collapsible summary="Cross-compiling from Linux" >}}

1. Install mingw-w64-gcc ([Arch](https://archlinux.org/packages/extra/x86_64/mingw-w64-gcc/), [Ubuntu](https://packages.ubuntu.com/gcc-mingw-w64))
2. Clone the `https://github.com/Microsoft/vcpkg.git` Git repository (`--depth 1` argument recommended)
3. Run `./bootstrap-vcpkg.sh` inside the cloned directory
4. Run `./vcpkg install zeromq[draft]:x64-mingw-dynamic` inside the cloned directory
5. Copy the `bin`, `include`, and `lib` directories from `<cloned directory>/packages/zeromq_x64-mingw-dynamic` to `spms/library/src/nativeInterop`

{{< /collapsible >}} -->

###### 3. Compile SpMs by running the Gradle command `app:mingwX64Binaries`

###### 4. Upon completion, debug and release executables will be contained in `spms/app/build/bin/mingwX64/releaseExecutable/`
