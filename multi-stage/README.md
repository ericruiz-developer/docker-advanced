### HEB DevOps Java buildpack 


## Components

### Builder image

It's very likely that the builder image might be missing dependencies for your application. In that case you can extend the image and add those dependencies/build tolls. Please look at Dockerfile.build-extend for an example. You can push that image to GCR or other repository and update the CICD configuration to use your expanded image instead of our default builder

### Dockerfile

To build the docker image execute
`docker build . -t myApp`

To execute the image once it has been built
`docker run --rm -d myApp`

To connect to the running image
`docker exec -it $CONTAINER_NAME sh`

# docker-compose 

The Docker Compose file allows you to define the multiple services that make up your application and easily execute them in your local docker environment

To build all images defined by docker-compose
`docker-compose build`

To start all services (containers)
`docker-compose up`

To stop all services (containers)
`docker-compose down`

# Spring profiles properties

The typical standard of having Spring properties files that live with source code makes the dynamically loading properties values difficult. To get around this we'll be externalizing property configs to environment files which are then mounted (both in docker-compose and kubernetes). 