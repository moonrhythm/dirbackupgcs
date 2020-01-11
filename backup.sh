#!/bin/sh
export PATH=$PATH:/root/google-cloud-sdk/bin

if [[ ! -z "${GOOGLE_APPLICATION_CREDENTIALS_JSON}" ]]; then
  echo $GOOGLE_APPLICATION_CREDENTIALS_JSON > /root/google-credential.json
  gcloud auth activate-service-account --key-file /root/google-credential.json
fi

tar -cvf - /data | gzip | gsutil cp - gs://$BUCKET/$PREFIX$(date +"%Y%m%d%H%M%S")$SUFFIX.tar.gz
