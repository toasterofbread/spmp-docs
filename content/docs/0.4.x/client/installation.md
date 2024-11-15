---
weight: 2
title: "Installation"
description: "Guide for installing the SpMp client on Android, Linux, and Windows"
icon: "bx bxs-download"
date: "2023-12-20"
toc: true
---

This page outlines methods of installing SpMp and its dependencies using pre-compiled packages. For instructions to compile SpMp from its source code, see [Building from source]({{% relref "./compilation" %}}).

## Android

On Android, SpMp is a self-contained app with no dependencies. It supports Android version 8.0 (SDK version 26) and later.

{{< rawhtml >}}
<div>
<a href="https://f-droid.org/en/packages/com.toasterofbread.spmp/">
<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png" style="height: 75px">
</a>
</div>
{{< /rawhtml >}}

APKs can be downloaded from the [release page](https://github.com/toasterofbread/spmp/releases) on SpMp's GitHub repository as well as from [F-Droid](https://f-droid.org/en/packages/com.toasterofbread.spmp/). There is no difference between APKs downloaded from GitHub and from F-Droid.

## Desktop

- [Tarball](#tarball)
- [Flatpak](#flatpak) (recommended)
- [AUR](#aur)
- [Nix Flake](#nix-flake)
- [Jar](#jar)
- [AppImage](#appimage)
- [Exe installer](#exe-installer)

There are several methods for installing SpMp on desktop platforms. For Linux, the [Flatpak](#flatpak) is recommended. For Windows, the [exe installer](#exe-installer) is recommended. SpMp is only available for x86_64 platforms.

Unless a method is marked with 'Dependencies included', the following must be installed on the system:

All OSes:
- [Java 22](https://www.oracle.com/java/technologies/downloads/#java22) or newer
- mpv ([Arch](https://archlinux.org/packages/extra/x86_64/mpv/), [Ubuntu](https://packages.ubuntu.com/libmpv-dev))

Linux only:
- libappindicator3 ([Arch](https://archlinux.org/packages/extra/x86_64/libappindicator-gtk3/files/), [Ubuntu](https://packages.ubuntu.com/libappindicator3-1))
- curl ([Arch](https://archlinux.org/packages/core/x86_64/curl/), [Ubuntu](https://packages.ubuntu.com/curl))
- libxcrypt ([Arch](https://archlinux.org/packages/core/x86_64/libxcrypt-compat/), [Ubuntu](https://packages.ubuntu.com/search?keywords=libcrypt-dev))

### Tarball
###### Available for Linux and Windows. Dependencies not included.

Download a tarball distribution from the [releases page](https://github.com/toasterofbread/spmp/releases), extract it, and run the executable contained in the `bin` directory.

### Flatpak
###### Available for Linux and Windows. Dependencies included.

##### 1. Add repositories

`flatpak remote-add toastbits https://flatpak.toastbits.dev/index.flatpakrepo`
`flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

##### 2. Install application

SpMp:

`flatpak install dev.toastbits.spmp`

### AUR
###### Available for Arch Linux. Dependencies included.

[https://aur.archlinux.org/packages/spmp](https://aur.archlinux.org/packages/spmp)

### Nix Flake
###### Available for Nix. Dependencies included.

##### 1. Add SpMp to flake inputs

```
spmp.url = "github:toasterofbread/spmp/v0.4.1";
...
outputs = { self, nixpkgs, spmp, ... }@inputs:
```

##### 2. Add SpMp to packages

```
home.packages = [
    ...
    inputs.spmp.packages.${system}.default
];
```

##### 3. Rebuild and run with `spmp`

### Jar
###### Available for Linux and Windows. Dependencies not included.

Download a jar distribution from the [releases page](https://github.com/toasterofbread/spmp/releases), then run it with `java -jar <path to jar>`.

### AppImage
###### Available for Linux. Dependencies not included.

Download an AppImage distribution from the [releases page](https://github.com/toasterofbread/spmp/releases) and run it.

### Exe installer
###### Available for Windows. Dependencies included (excluding Java).

Download an exe distribution from the [releases page](https://github.com/toasterofbread/spmp/releases), then install and run it.

### Nightly builds

Automatically built pre-release packages are available for all platforms on SpMp's [actions page](https://github.com/toasterofbread/spmp/actions) (as well as [the server's](https://github.com/toasterofbread/spmp-server/actions)). These are experimental builds which may not have been tested, so use with caution!.
