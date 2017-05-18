# April 2017

Recap part of March with starting from Page 80

- docker login: login to docker to get / push to your private images

## get basic container
docker run -i -t ubuntu /bin/bash
  (inside container)
  apt-get update
  apt-get install apache2
  exit

docker commit <CONTAINER_ID> btmash/apache2 -m "My image with apache" -a "Ashok Modi"

- 'docker images' will now list custom image with namespace
- 'docker inspect btmash/apache2' will now list comment and author


## dockerfile

- Instead of manually typing commands inside running container, build using dockerfile
'''
# You must specify a base image
FROM ubuntu:16.04
# This is meta information. Not necessary but still good to have
MAINTAINER Ashok Modi 'btmash@gmail.com'
# Use an environment variable if you want to easily get packages updated
ENV REFRESHED_AT 2017-04-19
# The real meat and bones
RUN apt-get update; apt-get install -y nginx
RUN echo 'My first web page' > /var/www/html/index.html
EXPOSE 80
'''

Each line in above is a new layer and will get cached. If you add anything in middle, the lines below are no longer cached and will re-run. Any new lines introduced to end of file will be run and then cached. In above case, I can get image rebuilt by just updating REFRESHED_AT env without touching rest of file.

Use

- docker build
  - Builds docker container based on docker file
- docker build -t="btmash/static_nginx"
  - Builds docker container and will give it name 'btmash/nginx'
- docker build -t="btmash/static_nginx:v1"
  - Builds docker container and will give it name 'btmash/nginx' and tag 'v1' (defaults to latest otherwise)

docker run -d -p 80 --name static_web btmash/nginx nginx -g "daemon off;"

- `-d`: Run as a daemon
- `-p`: Expose a port.
  - Format would be `PORT_ON_MACHINE:PORT_ON_CONTAINER`
  - If you specify port without `:`, port 80 from container above would be exposed and assigned a random port from machine for user to access (so you might access site at http://127.0.0.1:49024)
  - If you specify at `80:80`, port 80 from container would be exposed and assigned port 80 from machine for user to access (so you might access site at http://127.0.0.1).
  - If you specify at `8080:80`, port 80 from container would be exposed and site would be accessed at http://127.0.0.1:8080
  - Use this to also assign to specific interface (like 127.0.0.1:80:80)
    - Or to a random port (like 127.0.0.1::80)
- `-P`: Expose all ports identified in dockerfile

## More dockerfile commands

Some are CMD, ENTRYPOINT, ADD, COPY, VOLUME, WORKDIR, USER, ONBUILD, LABEL, STOPSIGNAL, ARG, SHELL, HEALTHCHECK and ENV

- `CMD`
  - Runs AFTER container has built.
  - Specify in array format to be very clear. ex `CMD ['/bin/bash', '-l']` will be interpreted as `/bin/bash -l`
- `ENTRYPOINT`
  - Similar to CMD
  - CMD would be default instruction after container is built. ENTRYPOINT overrides start instruction
