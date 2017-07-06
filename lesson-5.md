# May 2017

Recap part of April 2017

- We once again went over the CMD vs ENTRYPOINT since the concept was confusing.

## Continued Dockerfile commands

- `ENV`
  - Sets environment variables. Dockerfile can subsequently use set ENV vars (along with container).
- `WORKDIR`
  - Sets the working directory to run commands from.
- `USER`
  - Sets the working user for the container
  - Otherwise it will run as ROOT
- `VOLUME`
  - Attach a directory to the container
- `ADD`
  - Copy content from a directory/zip to the container
- `COPY`
  - Same as add except cannot do zip
- `LABEL`
  - Adds a label to the image
- `STOPSIGNAL`
  - System call to container when asked to stop. Values 1-9
- `ARG`
  - Build arguments to pass to the container (like env variables except exposed during build so do not pass secrets)
- `SHELL`
  - Sets the shell along with any default arguments for any subsequent RUN commands
- `HEALTHCHECK`
  - FIle to use for checking on status of primary process. If check fails, container can automatically stop.
- `ONBUILD`
  - Is a way to trigger generic docker images on a codebase. You can use this to create docker templates such as:
    - Use an apache/php container that can make assumptions about the location of a codebase for serving the codebase to serve pages and expose the right ports
    - Build a codebase using tools like ```yarn``` and ```composer`` install`

### After the commands

We learnt to push images to dockerhub. Main command is ```docker push```
