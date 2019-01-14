# Single stage builds

Let's take a quick look at a Node.js API. Nothing fancy here but there are a few points of interest.

Try it out
--

Let's talk about it
--

1. Open the Dockerfile, we've chosen to do some interesting things here, like copying only the package.json file over. Why is that?

2. Open up the docker-compose.yaml, lets walk through this.

3. We're building `.` what does this mean to docker compose?

4. Interesting volume mapping, deeper explanation of this when we get to volumes.

5. Notice the `CMD` in the Dockerfile, and the `command` in the docker-compose.yaml. What's going on?

6. Run it  
`docker-compose up --build`