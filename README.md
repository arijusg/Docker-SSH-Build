# Docker-SSH-Build
Sharing ssh securely while building docker image.

## Build image
```
sudo bash build.sh
```

## Run image
```
docker run -ti --rm docker-ssh-image /bin/bash
```

## Save docker image locally
```
docker save -o <save image to path> <image name>
```
## Load docker image locally
```
docker load -i <path to image tar file>
```

