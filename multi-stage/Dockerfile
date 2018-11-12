#Use Maven image for build and create alias
FROM maven:3.5-jdk-8-alpine as build

#Set working directory for subsequent commands
WORKDIR /app

#Copy our project source into image workspace
COPY . .

#Build and compile deployable artifact
#Provide generic artifact name
RUN mvn clean install \
    && cp target/*.jar target/app.jar

## INSTALL NODE.js
RUN apk add --update nodejs-current nodejs-npm

# Install nodemon for auto-reload
RUN npm install -g nodemon