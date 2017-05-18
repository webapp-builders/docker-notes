March 2017

Started to look at Chapter 4 - Understanding Docker repositories

Get a better understanding of a "container"

Base Kernel -> Base image (like Ubuntu, RHEL, Debian) -> Image Commands -> Writeable Container!

Commands:

docker images

docker pull - just pulls image
docker run - pulls image if needed and runs a container of it

- can pull specific tag of an image
- specific hash of an image

docker search * - search for images with a specific name/description

Build own image

docker commit - to take an existing container (that is running or stopped) and create a new 'image from it)'