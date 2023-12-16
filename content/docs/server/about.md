+++
weight = 1
date = "2023-11-28"
title = "About"
icon = "fa-solid fa-book"
toc = false
+++

######

## SpMs
###### Short for SpMp-Server

######

{{< snippet "server_warning.md" >}}

SpMs is the server component of SpMp's desktop version. It is built with [Kotlin/Native](https://kotlinlang.org/docs/native-overview.html), unlike the main SpMp codebase which uses [Kotlin Multiplatform](https://kotlinlang.org/docs/multiplatform.html#get-started) on the JVM. 

SpMs depends on several native C libraries through Kotlin/Native's cinterop:
- [ZeroMQ](https://zeromq.org/) - For communication with clients over TCP (the SpMp client uses its [Java implementation](https://github.com/zeromq/jeromq))
- [mpv](https://mpv.io/) - Audio playback, streaming, and queue management
- [libappindicator](https://launchpad.net/libappindicator) - Desktop tray icon on Linux

The primary mode of SpMs is to run a server instance over TCP on the specified port. See [usage]({{% relref "/docs/server/usage" %}}) for more information.

SpMs also comes packaged with a command-line interface for interacting with another server running on a specific port. Its usage is documented [here]({{% relref "/docs/server/cli" %}}).
