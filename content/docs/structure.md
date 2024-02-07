---
weight: 1
title: "Structure"
description: ""
icon: "fa-solid fa-code"
date: "2023-12-08"
toc: true
---

SpMp is made up of three main parts:

## Client

The main user-facing application with UI for music browsing and playback implemented on both Android and desktop. The client does not directly handle audio playback and queue management, which are instead managed by the server and player.

**[Read more]({{% relref "docs/client/about" %}}) • [Source code](https://github.com/toasterofbread/spmp)**

{{< alert context="info" text="By default, the server and player are automatically run as part of the client app and require no additional setup." />}}

## Server
AKA **SpMp-Server**, **SpMs**

The server component of SpMp's desktop version, implemented as a command-line program on desktop and as a background service on Android. By default, the server also acts as a player.

**[Read more]({{% relref "docs/server/about" %}}) • [Source code](https://github.com/toasterofbread/spmp-server)**

## Player

Connects to a server and acts as its own client in order to play audio. The player is a subcommand of SpMs.

**[Read more]({{% relref "docs/player/about" %}}) • [Source code](https://github.com/toasterofbread/spmp-server/tree/main/src/nativeMain/kotlin/spms/player)**

######

# Setup options

SpMp's split-architecture design allows for three main types of setup:

## Standalone client

The default setup on both Android and desktop in which the client starts and manages its own server and player for audio playback. 
The server and player are implemented as a background service on **Android**, so they will continue to run after closing the client app by default. 

On **desktop**, the server and player are run as a subprocess by default meaning that closing the client will result in the server also closing and audio playback being interrupted. To detach audio playback from the lifecycle of the client on desktop, use a **client-server** setup.

## Client-server

On desktop, the simplest example of this setup is to run `spmp` (client) and `spms` (server) in two terminals on the same device. Interacting with SpMp will send commands to SpMs which manages and maintains the state of the music queue and playback. Audio playback is also handled by SpMs which, by default, acts as a player as well as a server. 

Because the client and server are running independently in this case, the client can be closed and reopened freely without interrupting audio playback.

While the server can be run on a separate device from the client, this will leave the client device with no audio playback. A **client-server-player** setup does not have this limitation.

## Client-server-player

To provide audio playback on devices without a server, the player subcommand of SpMs can be used. Using the terminal example again, this time with three terminals, running `spmp` (client), `spms --headless` (server), and `spms player` (player) will provide this functionality.

In this, model the client sends playback control requests to the server which are then relayed to connected players, each of which will prepare to begin playback. Once each player has notified the server that it's ready to play the current media, the server will tell each client and player that playback has started.

{{< alert context="info" text="SpMp setups are fairly versatile. Any number of clients and players can be connected to a single server and on multiple devices." />}}
