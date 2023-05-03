set -e 
UNAME=`whoami`
PWD=`pwd`

docker run \
    -it \
    --rm \
    --gpus all \
    --ipc=host \
    --ulimit memlock=-1 \
    -u ${UNAME} \
    --ulimit stack=67108864 \
    --net=host \
    -v ${PWD}:/workspaces\
    docker.cynn.io/xdrlsgt/iris:latest \
    /bin/bash -c "python src/main.py $*"
    # /bin/bash -c "tensorboard --port 6005 --logdir /workspaces/results"
    # /bin/bash -c "tensorboard --port 6005 --logdir /workspaces/results & python src/main.py $*"
