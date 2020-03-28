+++
title = "Overview"

date = 2019-06-13
lastmod = 2020-01-23
draft = false

toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

math = true
[menu.docs]
    weight = 1
+++

{{% alert warning %}}
Aiicy and documentation are in active development, some content may need to be updated
{{% /alert %}}

Aiicy(/ˈaɪsi/, like icy) is a Modular Natural Interaction and Automatic Control System for IoT and User Terminal.

This section will help you install and configure the Aiicy Cluster, you can quickly deployed it with docker images, or compiled and installed Aiicy from source for development and testing.

Refer to [Design Goals]({{< relref "design.md" >}}) and [Aiicy Structure]({{< relref "structure.md" >}}) to understand the overall design of Aiicy.

## Deploy

{{% button href="setup_docker.md" %}}docker{{< icon name="docker" pack="fab" >}}{{% /button %}}

{{% button href="setup_native.md" %}}native{{< icon name="code" pack="fas" >}}{{% /button %}}