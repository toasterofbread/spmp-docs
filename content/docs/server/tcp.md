+++
weight = 2
date = "2023-11-28"
title = "TCP interface"
icon = "fa-solid fa-book"
toc = true
+++

######

Starts a SpMp server instance on the specified port. By default, it also acts as a player client for audio playback using mpv.

## Options

### --port `<port>` / -p `<port>`

The server will run on the specified port, or port `3973` by default.

### --headless / -x

Runs the server in headless mode (without the player client). Audio playback will not be handled by the server, so a [player client]({{% relref "/docs/client/about" %}}) must be ran manually.

## Player options

These options apply to the player client, and therefore have no effect when the `--headless` flag is in use.

### --gui / -g

Shows mpv's graphical interface.

### --mute / -m

Mutes mpv on startup.
