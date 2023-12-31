---
weight: 2
title: "Installation"
description: ""
date: "2023-12-20"
toc: true
---

This page outlines methods of installing SpMp and its dependencies using pre-compiled packages. For instructions to compile SpMp from its source code, see [Building from source]({{% relref "docs/client/compilation" %}}).

### Android

On Android, SpMp is a self-contained app with no dependencies. It supports Android version 6.0 (SDK version 23) and newer.

{{< rawhtml >}}
<div>
<a href="https://f-droid.org/en/packages/com.toasterofbread.spmp/">
<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png" style="height: 75px">
</a>
</div>
{{< /rawhtml >}}

APKs can be downloaded from the [release page](https://github.com/toasterofbread/spmp/releases) on SpMp's GitHub repository as well as from [F-Droid](https://f-droid.org/en/packages/com.toasterofbread.spmp/). There is no difference between APKs downloaded from GitHub and from F-Droid.

### Desktop

{{< snippet "server_warning.md" >}}

**TODO: System JRE Required?** 

The desktop version of SpMp is available on Linux and Windows. Both can be downloaded from SpMp's [release page](https://github.com/toasterofbread/spmp/releases). 

**A running instance of [SpMs]({{% relref "docs/server/about" %}}) is required to use SpMp on desktop.** Eventually, SpMs will be packaged as a part of SpMp, but currently it must be installed manually. See [here]({{% relref "docs/server/installation" %}}) for instructions.

For Linux, SpMp is packaged as a standalone AppImage which can be executed directly without installation. The Windows version comes as an installer which unpackages the application's files to `C:/Program Files/spmp` (by default). It can be run using the shortcut automatically added to the system.

### Nightly builds

Automatically built pre-release packages are available for all platforms on the repository's [actions page](https://github.com/toasterofbread/spmp/actions). These are experimental builds which may not have been tested thoroughly, so use with caution!.
