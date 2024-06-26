#!/usr/bin/sh

# info based on table_id (later use name? )
#
# this may work to load json: 
# \copy j (payload_js) from program 'cat  /tmp/data.json | jq -c ' ;
#
#

OUTFILE=/tmp/$1.tblinfo

echo . 				> $OUTFILE
echo --- Table Info for $1 ---- >> $OUTFILE
echo dd :  `date`		>> $OUTFILE

echo .     >> $OUTFILE
echo from list of tables:	>> $OUTFILE
yb-admin  -master_addresses $MASTERS list_tables include_db_type include_table_id include_table_type  \
		| grep $1 	>> $OUTFILE

echo .     			>> $OUTFILE
echo Tablets for the table:	>> $OUTFILE
yb-admin -master_addresses $MASTERS list_tablets tableid.$1 0 	>> $OUTFILE

echo .								>> $OUTFILE
echo Tablet replica locations for the tablets needs separate script or ybtrep	>> $OUTFILE

echo . 				>> $OUTFILE
echo ------ end for $1 -------- >> $OUTFILE

more $OUTFILE

