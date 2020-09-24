#!/bin/bash

ARG=$1

if [ "$ARG" == "colpal-dev" ]
then 
	NAMESPACE=$ARG
elif [ "$ARG" == "colpal-test" ]
then
        NAMESPACE=$ARG
elif [ "$ARG" == "colpal-mockprod" ]
then
        NAMESPACE=$ARG
elif [ "$ARG" ==  "colpal-prod" ]
then
        NAMESPACE=$ARG
else 
	echo "NO NAMESPACES FOUND"
	exit 0
fi

echo $NAMESPACE

POD=`kubectl get pods --namespace $NAMESPACE -l "component=web,app=airflow" -o jsonpath="{.items[0].metadata.name}"`

for entry in "dags"/*
do
  kubectl cp $entry $POD:/opt/airflow/dags -n=$NAMESPACE
done

