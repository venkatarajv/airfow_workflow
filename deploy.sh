#!/bin/bash
for entry in "dags"/*
do
  echo "`kubectl cp $entry airflow-1600869590-web-7cdbbffc98-t8gfq:/opt/airflow/dags -n=colpal-prod`"
done

