#!/bin/bash

/Library/PostgreSQL/9.6/bin/psql -U postgres -c 'DROP DATABASE axotravel';
/Library/PostgreSQL/9.6/bin/psql -U postgres -c 'CREATE DATABASE axotravel';

#python manage.py migrate

#python manage.py makemigrations travelapp

#python manage.py migrate travelapp

gunzip axotravel.sql.gz | /Library/PostgreSQL/9.6/bin/psql -U postgres axotravel

exit 0
