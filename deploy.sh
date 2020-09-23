#!/bin/bash

NAMESPACE=$1
POD=`kubectl get pods --namespace $NAMESPACE -l "component=web,app=airflow" -o jsonpath="{.items[0].metadata.name}"`

echo "Pod name is $POD "
echo "Pod name is $NAMESPACE "
for entry in "dags"/*
do
  echo "`kubectl cp $entry $POD:/opt/airflow/dags -n=$NAMESPACE`"
done

