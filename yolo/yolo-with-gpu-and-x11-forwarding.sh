# Requires to have a working DISPLAY (e.g. when connecting with 'ssh -Y')
# Requires xauth installed on remote host
# Requires to have downloaded the yolov3.weights into $PWD/yolo

XAUTH=/tmp/.docker.xauth
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run \
  --net=host \
  --rm \
  -it \
  --runtime=nvidia \
  -e DISPLAY \
  -v $XAUTH:$XAUTH \
  -e XAUTHORITY=$XAUTH \
  -v $PWD/yolo:/yolo \
  takuyatakeuchi/yolo-darknet:9.1-cudnn7-devel-ubuntu16.04 \
  bash

# inside run: ./darknet detect cfg/yolov3.cfg /yolo/yolov3.weights data/dog.jpg

# webcam: ./darknet detector demo cfg/coco.data cfg/yolov3.cfg /yolo/yolov3.weights
# https://medium.com/@jijupax/connect-the-webcam-to-docker-on-mac-or-windows-51d894c44468
