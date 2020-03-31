### Introduction

#### What is Docker?  

Wikipedia defines Docker as

````
an open-source project that automates the deployment of software applications inside containers by providing an additional layer of abstraction and automation of OS-level virtualization on Linux.
````

### Let's take a step back
---

#### What are containers?  
The industry standard today is to use Virtual Machines (VMs) to run software applications. VMs run applications inside a guest Operating System, which runs on virtual hardware powered by the server’s host OS.

VMs are great at providing full process isolation for applications: there are very few ways a problem in the host operating system can affect the software running in the guest operating system, and vice-versa. But this isolation comes at great cost — the computational overhead spent virtualizing hardware for a guest OS to use is substantial.

Containers take a different approach: by leveraging the low-level mechanics of the host operating system, containers provide most of the isolation of virtual machines at a fraction of the computing power.


#### Why use containers?
Containers offer a logical packaging mechanism in which applications can be abstracted from the environment in which they actually run. This decoupling allows container-based applications to be deployed easily and consistently, regardless of whether the target environment is a private data center, the public cloud, or even a developer’s personal laptop. This gives developers the ability to create predictable environments that are isolated from the rest of the applications and can be run anywhere.


#### Virtual Machines vs. Containers
At the end of the day, containers are simply processes running on the host. They don't require running a Hypervisor (such as VMWare or VirtualBox) as VMs do, which means there’s no guest operating system to lug around. Virtual Machines still have there use, but they solve a different set of problems than Docker. You can use Docker to isolate individual applications, and use Virtual Machines to isolate entire systems. They are operating at different levels of abstraction.


#### Virtual Machines vs. Containers Visualized
<img src="../images/vm-vs-container.png" width="800">


### Docker Terminology
---

#### Images
The blueprints of our application which form the basis of containers. In the demo above, we used the docker pull command to download the busybox image.

#### Containers
Created from Docker images and run the actual application. We create a container using docker run which we did using the busybox image that we downloaded. A list of running containers can be seen using the docker ps command.

#### Docker Daemon
The background service running on the host that manages building, running and distributing Docker containers. The daemon is the process that runs in the operating system which clients talk to.

#### Docker Client
The command line tool that allows the user to interact with the daemon. More generally, there can be other forms of clients too - such as Kitematic which provide a GUI to the users.

#### Container Registry
Same concept as Github for code but used to store Images that are created by both official companies and everyday developers like yourself. Anyone can pull/push just like you can code on Github.

#### Docker Hub
A registry of Docker images. You can think of the registry as a directory of all available Docker images. If required, one can host their own Docker registries and can use them for pulling images.