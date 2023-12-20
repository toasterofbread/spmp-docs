---
weight: 10
title: "Installation"
description: ""
date: "2023-12-20"
toc: true
---

This page outlines methods of installing SpMs and its dependencies using pre-compiled packages. For instructions to compile SpMs from its source code, see [Building from source]({{% relref "docs/server/compilation" %}}).

### Requirements

- [yt-dlp](https://github.com/yt-dlp/yt-dlp/wiki/Installation) ([Arch](https://archlinux.org/packages/extra/any/yt-dlp/))

Yt-dlp must be present on the system running the SpMs player for it to be able to fetch audio stream URLs for playback. This requirement will be removed at some point.

### Linux

Download the Linux executable from the [releases page](https://github.com/toasterofbread/spmp-server/releases) and run it directly.

### Windows

ZeroMQ cannot (practically) be statically linked to the Windows executable due to incompatibilies between it and Kotlin/Native. Instead, it is bundled with the SpMs executable in a zip file. Download the Windows package from from the [releases page](https://github.com/toasterofbread/spmp-server/releases), then extract it and run the contained executable.
