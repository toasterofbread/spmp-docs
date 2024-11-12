---
weight: 10
title: "Installation"
description: "Guide for downloading SpMs and installing requirements on each platform"
icon: "bx bxs-download"
date: "2023-12-20"
toc: true
---

This page outlines methods of installing SpMs and its dependencies using pre-compiled packages. For instructions to compile SpMs from its source code, see [Building from source]({{% relref "./compilation" %}}).

### Linux (Flatpak)

###### 1. Add repositories

`flatpak remote-add toastbits https://flatpak.toastbits.dev/index.flatpakrepo`
`flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

###### 2. Install application

SpMp:

`flatpak install dev.toastbits.spmp-server`

### Linux (native binary)

###### Dependencies

- mpv ([Arch](https://archlinux.org/packages/extra/x86_64/mpv/), [Ubuntu](https://packages.ubuntu.com/libmpv-dev))
- libappindicator3 ([Arch](https://archlinux.org/packages/extra/x86_64/libappindicator-gtk3/files/), [Ubuntu](https://packages.ubuntu.com/libappindicator3-1))
- curl ([Arch](https://archlinux.org/packages/core/x86_64/curl/), [Ubuntu](https://packages.ubuntu.com/curl))
- libxcrypt ([Arch](https://archlinux.org/packages/core/x86_64/libxcrypt-compat/), [Ubuntu](https://packages.ubuntu.com/search?keywords=libcrypt-dev))

Download the Linux executable from the [releases page](https://github.com/toasterofbread/spmp-server/releases) and run it directly.

### Windows

1. Download the Windows package from from the [releases page](https://github.com/toasterofbread/spmp-server/releases)
2. Extract all files into the same directory
3. Run the extracted executable
