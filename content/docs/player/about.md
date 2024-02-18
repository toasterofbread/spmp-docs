---
weight: 1
date: "2023-12-08"
title: "Player client"
icon: "fa-solid fa-book"
toc: false
---

Standalone client for the SpMp [server]({{% relref "/docs/server/about" %}}) that plays audio using mpv.

######

## Usage

Start with: `spms player`

#### Options

{{< cmdline-option name="ip" alt="i" args="address" >}}

The IP address of the server to connect to, or `127.0.0.1` by default.

{{< cmdline-option name="port" alt="p" args="port" >}}

The port of the server to connect to, or `3973` by default.

{{< snippet "player_options.md" >}}
{{< snippet "universal_options.md" >}}
