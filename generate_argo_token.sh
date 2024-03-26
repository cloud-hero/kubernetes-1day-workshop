#!/bin/bash

kubectl create role jenkins --verb=list,update --resource=workflows.argoproj.io
kubectl create sa jenkins
kubectl create rolebinding jenkins --role=jenkins --serviceaccount=argo:jenkins
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: jenkins.service-account-token
  annotations:
    kubernetes.io/service-account.name: jenkins
type: kubernetes.io/service-account-token
EOF
ARGO_TOKEN="Bearer $(kubectl get secret jenkins.service-account-token -o=jsonpath='{.data.token}' | base64 --decode)"
echo $ARGO_TOKEN

