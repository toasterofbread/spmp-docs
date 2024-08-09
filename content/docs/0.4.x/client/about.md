---
weight: 1
title: "About"
description: "The main SpMp program for browsing songs and controlling playback"
icon: "fa-solid fa-code"
date: "2023-12-08"
toc: true
---

On desktop, the SpMp client sends playback and queue manipulation requests to the server over TCP. The server processes these requests, applies them to its internal state, and notifies connected clients of any events that occured. By default, the server is started automatically (à la Minecraft) and requires no additional setup.
