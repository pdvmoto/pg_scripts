#!/bin/sh

psql -h localhost -p 26257 -U root -d defaultdb -X -q -t <<EOF

select 'export snap_id=' ||  nextval ( 'crx_snap_seq' ) ; 
EOF
