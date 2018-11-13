# Multi-stage Builds

With multi-stage builds, you use multiple FROM statements in your Dockerfile. Each FROM instruction can use a different base, and each of them begins a new stage of the build. You can selectively copy artifacts from one stage to another, leaving behind everything you don’t want in the final image.

Try it out
--

1. First off, does anything stand out about our files?

2. Open __**Dockerfile.runtime**__, lets break it down

3. Now what's up with the other Dockerfile, why does it exist?

4. Open __**Dockerfile**__ and __**docker-compose.yml**__

