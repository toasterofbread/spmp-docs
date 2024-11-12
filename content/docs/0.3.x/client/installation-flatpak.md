---
weight: 2
title: "Installation (Flatpak)"
description: "Guide for installing the Flatpak version of the SpMp client"
icon: "bx bxs-download"
date: "2024-5-3"
toc: true
---

This page outlines the method for installing SpMp as a Flatpak. For instructions to compile SpMp from its source code, see [Building from source]({{% relref "./compilation" %}}).

##### 1. Add repository

`flatpak remote-add toastbits https://flatpak.toastbits.dev/index.flatpakrepo`

##### 2. Install SpMp and server

`flatpak install dev.toastbits.spmp dev.toastbits.spmp-server`

##### 3. Fix Discord RPC (Optional)

The SpMp Flatpak needs access to the Discord ipc socket in order to set the presence activity

`ln -f $XDG_RUNTIME_DIR/discord-ipc-0 $XDG_RUNTIME_DIR/app/com.discordapp.Discord/`

