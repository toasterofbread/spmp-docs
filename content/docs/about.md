---
weight: -1
title: "About SpMp"
description: ""
icon: "fa-solid fa-code"
date: "2023-11-28"
toc: false
---

######

SpMp is a YouTube Music client with a focus on customisation of colours and song metadata, built with [Compose Multiplatform](https://github.com/jetbrains/compose-multiplatform) and Kotlin.

There are two versions of SpMp. Both are part of the same multiplatform project, and as such share the same core UI and logic but have separate UI implementations for some screens.

#### Android
- [Media3](https://github.com/androidx/media)-based music player supporting background playback
- Supports Android 6.0 and higher
- Feature-complete and now in beta

#### Desktop

{{< snippet "server_warning.md" >}}

- Split client-server architecture to allow for background playback and synchronised one-server-to-many-client setups
- Uses [MPV](https://github.com/mpv-player/mpv) as a backend for audio and queue management
- Developed primarily for Linux, Windows support planned
- Currently in early development; some basic features are working but are yet to be tested thoroughly

######

SpMp, and all of its subprojects, are open-source and [available on GitHub](https://github.com/toasterofbread/spmp) under the GPLv3 license.
