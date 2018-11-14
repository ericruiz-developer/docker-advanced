# Networking

The focus here is to understand the common types of networks you can create in Docker. How and when to use them, along with how they relate to Docker Compose.

Expect to become familiar with:
* Bridge network
* Host network
* Network in Docker Compose

**_HEB Gotchas:_**  
_When the Docker daemon starts with a default configuration, it will create a
bridge network with the IP range 172.17.0.0/16. Likewise, when docker-compose
tries to create a network, the docker daemon will create networks with the
ranges 172.[17-31].0.0/16 and 192.168.[0-240].0/20 for local scope networks, and
10.[0-255].[0-255].0/24 for global scope networks. Unfortunately, many of these
IP ranges conflict with networks in use by HEB._

_(See https://git.heb.com/devops/docker-networking)_

Try it out
--

1. Start by listing what networks exist.  
`docker network ls`

2. If you have more than a single network then go ahead and clean up.  
`docker network prune`

3. Now let's create a simple network and determine what driver (type) is created  
`docker network create -d bridge mynet1`
`docker network ls`

4. Let's get some more detail about this network  
`docker network inspect mynet1`

5. Let's actually add a container to this network and inspect again  
`docker run --network=mynet1 postgres:11-alpine`
`docker network inspect mynet1`

6. What's different now? 

Host network
--

1. Now we need a container to communicate with a service on our localhost. How do we do this?

2. Clean up your networks (cmon you know how..)

3. Restart our postgres container from before this time a little differently  
`docker run --network=host postgres:11-alpine`

4. Inspect the host network and see what shows up  
`docker network inspect host`

5. Why is this useful again?

Compose Networking
--

1. Compose has a pattern for creating networks. Navigate to the network/back-end directory.  
`cd network/back-end`

2. Comment out line 12 down in your docker-compose.yaml for demonstration sake, the file should look like this.  

```
version: '3.5'

services:
  api:
    build: .
    ports:
      - 8000:8000
    volumes:
      - .:/app
      - /app/node_modules
    command: npm run dev
    # networks:
    #   - app
# networks:
#   app:
#     name: myapp_network
```

3. Let's start this using docker compose  
`docker-compose up`

4. Lets list what networks have been created  
`docker network ls`

5. You'll see a network is created with the pattern `<project directory name>_default`  
and a container is named `<project directory name>_<service name>_1`

6. So what's the take away here? 

Multiple Compose Files/Projects
--

1. Uncomment line 12 down that was done in the previous section.

2. Let's now open 2 terminals navigate to front-end/back-end respectively and run  
`docker-compose up`