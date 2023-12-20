---
weight: 11
title: "Building from source"
description: ""
date: "2023-12-20"
toc: true
---

This page outlines procedures for compiling SpMs from its source code. For installing from pre-compiled packages, see [Installation]({{% relref "docs/server/installation" %}}).

##### Requirements
- [Java Development Kit (JDK) 17](https://www.oracle.com/java/technologies/downloads/#java17)

### Downloading source code

From a command-line terminal:

1. Clone the spmp-server Git repository and its submodules 
`git clone https://github.com/toasterofbread/spmp-server`

2. Enter the cloned directory `cd spmp-server`

### Compiling

{{< snippet "gradle_commands.md" >}}
