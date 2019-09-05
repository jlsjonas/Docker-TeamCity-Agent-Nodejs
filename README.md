# Docker-TeamCity-Agent-Nodejs
[![Docker Pulls](https://img.shields.io/docker/pulls/jacobpeddk/teamcity-agent-nodejs.svg)](https://hub.docker.com/r/fluid/teamcity-agent-nodejs)
[![Docker Stars](https://img.shields.io/docker/stars/jacobpeddk/teamcity-agent-nodejs.svg)](https://hub.docker.com/r/fluid/teamcity-agent-nodejs)
[![](https://images.microbadger.com/badges/image/jacobpeddk/teamcity-agent-nodejs.svg)](https://microbadger.com/images/fluid/teamcity-agent-nodejs "Container Image size and layers")
[![](https://images.microbadger.com/badges/commit/fluid/teamcity-agent-nodejs.svg)](https://microbadger.com/images/fluid/teamcity-agent-nodejs "Current commit that the container is build from")
[![](https://images.microbadger.com/badges/version/fluid/teamcity-agent-nodejs.svg)](https://microbadger.com/images/fluid/teamcity-agent-nodejs "Container version")

Based on the official TeamCity Agent image with Nodejs LTS (10.x) added on top.

This image will automatically be updated when the official base image gets updated.

**Based on:**
https://hub.docker.com/r/jetbrains/teamcity-agent/

## Build
```docker build -t tc-agent-nodejs .```

## Example command for running
This will start it up with docker build support and remove the container when you exit.

**Remember to replace Server address that will point it to your TeamCity server.**
  
```docker run -it -e SERVER_URL="<Server address>" --privileged -e DOCKER_IN_DOCKER=start -e DOCKER_OPTS="--insecure-registry 10.0.0.10:5000 --insecure-registry http://10.0.0.10:5000" -e AGENT_NAME="DockerNodejs-Agent" --name tc-agent-nodejs --rm tc-agent-nodejs```

**Note:**
The two ```--insecure-registry``` Is only needed if communicating with a [insecure registry](https://docs.docker.com/registry/).


a Linux container:

```bash
docker run -it -e SERVER_URL="<url>"  \ 
    -v <path>:/data/teamcity_agent/conf  \      
    fluid/teamcity-agent-nodejs
```
  
or a Windows container:

```cmd
docker run -it -e SERVER_URL="<url>"
    -v <path>:C:/BuildAgent/conf
    fluid/teamcity-agent-nodejs
```
