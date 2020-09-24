#!/bin/bash

ARG=$1

if [ "$ARG" == "colpal-dev" ]
then 
	NAMESPACE=colpal-dev
elif [ "$ARG" == "colpal-test" ]
then
        NAMESPACE="colpal-test"
elif [ "$ARG" == "colpal-mockprod" ]
then
        NAMESPACE="colpal-mockprod"
elif [ "$ARG" ==  "colpal-prod" ]
then
        NAMESPACE="colpal-prod"
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

