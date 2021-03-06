# GarnetFlow
[![Build status](https://badge.buildkite.com/add25d748b7fd726dd53849ccb561ab99e3a43067fc370dd73.svg)](https://buildkite.com/stanford-aha/garnetflow)

Reliable end-to-end test flow for Garnet

# How to run locally
You need to have docker installed on your local machine. Please follow
[this guide](https://docs.docker.com/install/) to install Docker CE version.

After installing docker, please follow the commands below
```Bash
# pull docker image from docker hub
docker pull keyiz/garnet-flow

# give the image a name "garnet" and run it in the background
docker run -d -it --name garnet keyiz/garnet-flow bash

# clone the repo inside the docker
docker exec -i garnet bash -c "git clone https://github.com/StanfordAHA/GarnetFlow"

# build all dependences (this takes awhile!)
docker exec -i garnet bash -c "cd GarnetFlow/scripts && ./install.sh"

# run the tests
docker exec -i garnet bash -c "cd GarnetFlow/scripts && ./run.sh"
```

To attach to the running container, simply do
```Bash
docker attach garnet
```

You can stop a container and then remove it by invoking
```Bash
docker stop garnet
docker rm garnet
```

# How to run on kiwi
kiwi already has the latest docker image. You can skip the `docker pull` part. However,
by default, your user account won't be in `docker` user group. Please contact me (Keyi)
or Stephen Richardson to add you to the docker group. You may also need to use a
different container name other than `garnet` since very likely someone else is using
it.
