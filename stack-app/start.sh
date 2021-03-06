#!/bin/bash

# change these for an easier experience
IMAGE_NAME="$1"
CONTAINER="$2"
COMMAND="bash"

if docker inspect -f '{{.State.Running}}' "$CONTAINER" &> /dev/null
then docker exec -it "$CONTAINER" "$COMMAND"
else docker run -it --rm --name "$CONTAINER" \
  -v $(pwd):"/usr/local/src/app" \
  -v "/usr/local/src/app/.stack-work" \
  "$IMAGE_NAME" \
  "$COMMAND"
fi
