export ZONE="us-west2-b" # budget: "us-west1-b"
export INSTANCE_NAME="my-fastai-instance"

SOURCE=$1
DEST=$2

gcloud compute scp jupyter@$INSTANCE_NAME:$SOURCE $DEST --zone $ZONE
