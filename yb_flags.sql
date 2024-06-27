
-- capture gflags for comparison, per node

create table ybx_gflags ( 
  gflag text
, value text 
, nodename text default 'default_node'    /* replace ASAP with real nodename */
, node_uuid text
, node_type text    /* master or t-server */
, value_type text   /* text, integer, float, binary */
, flag_type text
, flag_comments  text
, constraint ybx_gflags_pk primary key ( gflag, nodename ) 
);

