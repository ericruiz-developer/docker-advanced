FROM node:alpine

#Set directory for subsequent commands
WORKDIR /app

#Copy package.json separately to
#avoid unnecessary reruns of npm install
#(see Docker layer caching)
COPY package.json .

RUN npm cache clean --force \
    && npm install

#Now copy source code
#after dependency installs
COPY . /app

CMD ["npm", "start"]

EXPOSE 8000
