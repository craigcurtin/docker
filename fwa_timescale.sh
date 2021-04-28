#!/usr/bin/env bash
#
# https://www.postgresql.org/docs/9.2/app-psql.html
# -v /Users/dt230133:/root -d fwa

docker run  governmentpaas/psql --host=10-222-76-162.ssnc-corp.cloud  --port=5432  --username=$1 --password

