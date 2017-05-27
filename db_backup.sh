#!/bin/bash

/Library/PostgreSQL/9.6/bin/pg_dump -U postgres axotravel | gzip > axotravel.sql.gz

exit 0
