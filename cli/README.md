# Using Dockers CLI

Before we get into the meat of this training. We need to get some what familiar with the Docker CLI. Open up a terminal and lets explore some of the common commands you'll be using.

Try it out
--

1. Make sure docker works, run `docker --help`

2. Make sure docker-compose works, run `docker-compose --help`

#### Setup docker-compose alias (Mac only)

1. Run `vi ~/.bash_profile`

2. Add `alias dc=docker-compose` to the top of the file
 
3. Type `:wq!` and hit enter

4. Restart your terminal or type run `. ~/.bash_profile`

5. Test the alias by running `dc --help`

#### Working with Docker objects

You'll see a pattern when interacting with Docker objects, you'll use `ls` | `rm` | `inspect` | `prune` plenty. Let's take some time to explore objects and the commands used to interact with them.

#### Common Commands
- build -- Build an image from a Dockerfile
- cp    -- Copy files/folders between a container and the local filesystem
- exec  -- Run a command in a running container
- ps    -- List containers
- pull  -- Pull an image or a repository from a registry
- push  -- Push an image or a repository to a registry
- rm    -- Remove one or more containers
- rmi   -- Remove one or more images
- stop  -- Stop one or more running containers

#### Objects
- container
- image
- network
- volume

#### Working with Images

List out the images you have downloaded.  
1. `docker image ls` (or its alias `docker images`)  

Note: If you don't see any available images, download one with `docker pull node:alpine`, then try again.

Remove an image  
1. `docker image rm <name|id>` (or its alias `docker rmi <name|id>`)

Note: If you have the same image with multiple tags then specifying `<name>:<tag>` or `<id>` is necessary. If you reference an image by `name` without a tag then the `latest` is used by default.


#### Working with Containers

Start a container.  
1. `docker run hello-world`
2. `docker run node:alpine tail -f /dev/null`

View containers
1. `docker ps -a` or `docker container ls -a`

Inspect containers
1. Copy an any container id after running `docker ps -a`
2. `docker container inspect <container-id>`


#### System clean up

Occasionally, it's good to clean up old images, volumes, networks, etc. to avoid cluttering up your local system too much. There are several approaches to doing so but `prune` is most commonly used. Let's look at some manual ways and then will go full nuclear.

Images
1. `docker image rm <image-id>` -- only a single image.
2. `docker rmi $(docker images -aq)` -- Remove all images (not in use)
3. `docker image prune` -- this simply remove dangling images.

Containers
1. `docker container prune` -- removes stopped containers
2. `docker container prune -f` -- removes all containers regardless of status

Volumes & Networks
1. `docker <volume|network> ls` -- List and find volume or network to remove
2. `docker <volume|network> rm <name>`

Nuclear option
1. `docker system prune` -- removes only dangling images
2. `docker system prune -f` -- everythings gone, forget about it