#!/bin/bash

POD=`kubectl get pods --namespace $1 -l "component=web,app=airflow" -o jsonpath="{.items[0].metadata.name}"`
echo "Pod name is $POD "
for entry in "dags"/*
do
  echo "`kubectl cp $entry $POD:/opt/airflow/dags -n=colpal-dev`"
done

