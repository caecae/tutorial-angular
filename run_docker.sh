# quick docker run script
DOCKER_IMAGE_NAME="ml-ng8"

docker run -it --rm \
    --entrypoint /bin/bash \
    -p 3000:3000 -p 4200:4200 -p 8620-8629:8620-8629 \
    -v `pwd`:/wip \
    ${DOCKER_IMAGE_NAME} "$@"
