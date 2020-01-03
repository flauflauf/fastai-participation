export ZONE="europe-west1-b"
export INSTANCE_NAME="my-fastai-instance"

gcloud compute instances start $INSTANCE_NAME --zone=$ZONE
# sleep 10
gcloud beta compute ssh --zone=$ZONE jupyter@$INSTANCE_NAME -- -L 8080:localhost:8080
