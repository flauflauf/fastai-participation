export ZONE="us-west2-b" # budget: "us-west1-b"
export INSTANCE_NAME="my-fastai-instance"

gcloud compute instances start $INSTANCE_NAME --zone=$ZONE
