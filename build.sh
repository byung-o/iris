set -e
# UID=`id -u`
GUID=`id -g`
UNAME=`whoami`
GNAME=`id -gn`
TAG="iris"
FILE=.devcontainer/devcontainer.json

function makedev () {
	mkdir -p .devcontainer
	if [[ ! -f "$FILE" ]]; then
		echo "{
  \"image\": \"docker.cynn.io/xdrlsgt/${TAG}:latest\",
  \"customizations\": {
    \"vscode\": {
      \"extensions\": [
        \"ms-python.python\",
        \"ms-python.vscode-pylance\"
      ]
    }
  },
  \"runArgs\": [
    \"--gpus=all\",
    \"--net=host\" 
  ],
  \"forwardPorts\": [
    3000,
    
  ],
  \"remoteUser\": \"${UNAME}\"

}" >> .devcontainer/devcontainer.json
fi
}

makedev

docker build --build-arg user_id=${UID} --build-arg group_id=${GUID} --build-arg user_name=${UNAME} --build-arg group_name=${GNAME} -t docker.cynn.io/xdrlsgt/${TAG}:latest .