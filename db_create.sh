#!/bin/bash

CREATE DATABASE axotravel;

python manage.py migrate

python manage.py makemigrations travelapp

python manage.py migrate travelapp

gunzip axotravel.sql.gz | psql axotravel

exit 0
