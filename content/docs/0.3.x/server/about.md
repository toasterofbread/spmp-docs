---
weight: 1
date: "2023-11-28"
title: "About"
description: "The server component used in SpMp's desktop version, or optionally in the Android version"
icon: "fa-solid fa-book"
toc: false
---

######

## SpMs
###### Short for SpMp-Server

######

{{< snippet "server_warning.md" >}}

SpMs is the server component of SpMp's desktop version. It is built with [Kotlin/Native](https://kotlinlang.org/docs/native-overview.html), unlike the main SpMp codebase which uses [Kotlin Multiplatform](https://kotlinlang.org/docs/multiplatform.html) on the JVM.

SpMs depends on several native C libraries through Kotlin/Native's cinterop:
- [ZeroMQ](https://zeromq.org/) - For communication with clients over TCP (the SpMp client uses its [Java implementation](https://github.com/zeromq/jeromq))
- [mpv](https://mpv.io/) - Audio playback, streaming, and queue management
- [libappindicator](https://launchpad.net/libappindicator) - Desktop tray icon on Linux

The primary mode of SpMs is to run a server instance over TCP on the specified port. It comes packaged with a command-line interface for controlling the server itself as well as interacting with other servers. See [usage]({{% relref "/docs/0.3.x/server/usage" %}}) for more information.
