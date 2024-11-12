---
weight: 2
date: "2023-11-28"
title: "Usage"
description: "Features, functions, and options of the SpMs command-line interface"
icon: "bx bxs-book"
toc: true
---

######

The default mode of SpMp. Starts an SpMp server instance on the specified port. By default, it also acts as a player client for audio playback using mpv (see `--headless`).

######

#### Options

{{< snippet "universal_options.md" >}}

{{< cmdline-option name="port" alt="p" args="port" >}}

The server will run on the specified port, or port `3973` by default.

{{< cmdline-option name="headless" alt="x" >}}

Runs the server in headless mode (without the player client). Audio playback will not be handled by the server, so a [player client]({{% relref "/docs/0.4.x/player/about" %}}) must be ran manually.

######

#### Player options

These options apply to the player client, and therefore have no effect when the `--headless` flag is in use.

{{< snippet "player_options.md" >}}
