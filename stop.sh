export ZONE="europe-west1-b"
export INSTANCE_NAME="my-fastai-instance"

gcloud compute instances stop $INSTANCE_NAME --zone=$ZONE --async
