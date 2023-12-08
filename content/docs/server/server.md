+++
weight = 1
date = "2023-11-28"
title = "SpMp-server"
icon = "fa-solid fa-book"
toc = false
+++

###### Shortened to SpMs

######

{{< snippet "server_warning.md" >}}

SpMs is the server component of SpMp's desktop version. It is built with [Kotlin/Native](https://kotlinlang.org/docs/native-overview.html), unlike the main SpMp codebase which uses [Kotlin Multiplatform](https://kotlinlang.org/docs/multiplatform.html#get-started) on the JVM. 

SpMs depends on several native C libraries through Kotlin/Native's cinterop:
- [ZeroMQ](https://zeromq.org/) - For communication with clients over TCP (the SpMp client uses its [Java implementation](https://github.com/zeromq/jeromq))
- [mpv](https://mpv.io/) - Audio playback, streaming, and queue management
- [libappindicator](https://launchpad.net/libappindicator) - Desktop tray icon on Linux

When running on desktop, the SpMp client sends playback and queue manipulation requests to the SpMp server over TCP. The server processes these requests, applies them to its internal state, and notifies connected clients of any events that occured.

The primary mode of SpMs is to run a server instance over TCP on the specified port. See [TCP interface]({{% relref "/docs/server/tcp" %}}) for more information.

SpMs also comes packaged with a command-line interface for interacting with another server running on a specific port. Its usage is documented at [Command-line interface]({{% relref "/docs/server/cli" %}}).
