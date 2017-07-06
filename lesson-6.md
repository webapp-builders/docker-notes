# June 2017

Recap part of May 2017

- We went over some of the commands but primarily again went over ONBUILD since the concept was tricky to understand. We have a primary directory onbuild-example which is the originating docker file and onbuild2 which uses the container created by the onbuild-example dockerfile to add a different codebase.

## New Chapter - Testing with Docker

### Static web sites

- First tested with creating a static website. This involved directory consisting of the following files:
  - ```Dockerfile```
  - ```nginx.conf``` (main nginx configuration)
  - ```global.conf``` (main site configuration)
  - codebase (ours is named in the ```doug``` directory)
- The dockerfile installs nginx, creates a directory where the codebase will eventually be mounted, and exposes port 80 so the image is ready for usage
- ```docker run -d -p 80 --name <CONTAINERNAME> -v $PWD/doug:/var/www/html/doug <IMAGENAME> nginx```
  - Runs container as daemon in background
  - Exposes port 80 on container to some random port
  - mounts the ```doug``` directory to ```/var/www/html/doug``` inside the container
  - The ```nginx``` command is the ENTRYPOINT and main process for container.
- Type ```docker ps -l``` to see the port of the new running container.
- You can now access the site in your browser at ```http://localhost:<PORTNUMBER>```
- We then stopped and removed container and ran command ```docker run -d -p 80:80 --name <CONTAINERNAME> -v $PWD/doug:/var/www/html/doug <IMAGENAME> nginx```
  - This exposed the container on our local port 80 so we could access the site at ```http://localhost``` without the need for finding out any ports.

### Stage 1 dynamic site using Sinatra

- Tested with creating a container that runs ruby. This consists of 2 items:
  - ```Dockerfile```
  - webapp (which is our codebase)
- The dockerfile installs ruby, ruby-dev, json, and redis (for the eventual connection to a redis container), and exposes port 4567 (the WEBrick port)
- 
