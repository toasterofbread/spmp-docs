---
weight: 3
title: "Building from source"
description: "Step-by-step instructions for compiling from source code for each platform"
icon: "bx bxs-wrench"
date: "2023-12-20"
toc: true
---

This page outlines procedures for compiling SpMp from its source code. For installing from pre-compiled packages, see [Installation]({{% relref "./installation" %}}).

### Requirements

##### All platforms:
- [Git](https://git-scm.com/download/)
- [Java Development Kit (JDK) 17](https://www.oracle.com/java/technologies/downloads/#java17) ([Arch](https://archlinux.org/packages/extra/x86_64/jre17-openjdk/), [Ubuntu](https://packages.ubuntu.com/focal/openjdk-17-jre))

##### Linux (for packaging AppImage):
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

Gradle command: `desktopApp:packageReleaseAppImage` (Debug: `desktopApp:packageAppImage`)

The AppImage will be packaged into `desktopApp/build/`.

##### Windows

Gradle command: `desktopApp:packageReleaseExe` (Debug: `desktopApp:packageExe`)

The installer executable will be packaged into `desktopApp/build/compose/binaries/`.

{{< alert context="info" text="Compilation of SpMp is known to occasionally fail with the following error: `BackendException: Backend Internal error: Exception during IR lowering`. This can be safely ignored, just try the build again." />}}

### Packaging with SpMs

##### Prerequisites

Before starting, follow the instructions for compiling [SpMs]({{% relref "../server/compilation" %}}) up to (but not including) running the final Gradle command. However, instead of cloning the SpMs repository, perform the steps within the spmp-server submodule directory within the SpMp source code.

##### Packaging

To include an spmp-server executable in a desktop SpMp package (this is the default for releases of SpMp), append the Gradle build command with `WithServer`. For example, to build a release AppImage packaged with the server, run the task `desktopApp:packageReleaseAppImageWithServer`.
