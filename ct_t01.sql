
create table t01 ( id bigint primary key, payload text ) ;
create index t01_idx_pld on t01 ( payload ) ;
