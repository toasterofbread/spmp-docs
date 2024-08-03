---
weight: 3
title: "Building from source"
description: "Step-by-step instructions for compiling from source code for each platform"
icon: "fa-solid fa-wrench"
date: "2023-12-20"
toc: true
---

This page outlines procedures for compiling SpMp from its source code. For installing from pre-compiled packages, see [Installation]({{% relref "./installation" %}}).

### Requirements

##### All platforms:
- [Git](https://git-scm.com/download/)
- [JDK 22](https://www.oracle.com/java/technologies/downloads/#java22) ([Arch](https://archlinux.org/packages/extra/x86_64/jre-openjdk/), [Ubuntu](https://packages.ubuntu.com/mantic/openjdk-22-jre))

##### Linux (optional, for packaging AppImage):
- [appimagetool](https://github.com/AppImage/appimagetool/releases/) (must be accessible on PATH as `appimagetool`)
    - AUR: [appimagetool-bin](https://aur.archlinux.org/packages/appimagetool-bin)
- desktop-file-utils ([Arch](https://archlinux.org/packages/extra/x86_64/desktop-file-utils/), [Ubuntu](https://packages.ubuntu.com/desktop-file-utils))
- appstream ([Arch](https://archlinux.org/packages/extra/x86_64/appstream/), [Ubuntu](https://packages.ubuntu.com/search?keywords=appstream))

### Downloading source code

{{< alert context="warning" text="SpMp cannot be compiled directly from source code downloaded through GitHub's website, as this method does not include submodules" />}}

From a command-line terminal:

1. Clone the SpMp Git repository and its submodules
`git clone https://github.com/toasterofbread/spmp --recurse-submodules`

2. Enter the cloned directory `cd spmp`

### Compiling

{{< snippet "gradle_commands.md" >}}

##### Android

Gradle command: `androidApp:packageRelease` (Debug: `androidApp:packageDebug`)

To build separate APKs for each CPU architecture instead of a single universal APK, add the argument `-PenableApkSplit` to the Gradle command.

Compiled APK(s) will be stored in `androidApp/build/outputs/apk/`.

##### Linux

Gradle command:
- Tarball: `desktopApp:packageReleaseTarball`
- Jar: `desktopApp:packageReleaseUberJarForCurrentOS`
- AppImage: `desktopApp:packageReleaseAppImage`

Outputs will be placed in `desktopApp/build/outputs`.

##### Windows

Gradle command:
- Tarball: `desktopApp:packageReleaseTarball`
- Exe: `desktopApp:packageReleaseExe`

The installer executable will be packaged into `desktopApp/build/compose/binaries/`.

{{< alert context="info" text="Compilation of SpMp is known to occasionally fail with the following error: `BackendException: Backend Internal error: Exception during IR lowering`. This can be safely ignored, just try the build again." />}}

### Packaging with SpMs

Prior to [8d386c2](https://github.com/toasterofbread/spmp/commit/8d386c23412b469fa0cdf9c37793cf4c4b4231b6) (or release v0.4.0), SpMs had to be manually packaged with distributions of SpMp as a separate binary. It is now included in all builds (including local non-package builds) by default.
