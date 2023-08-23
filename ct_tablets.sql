

-- test colocation and tablets, split, check storage...

create table t1_coloc_hsh ( 
  id                bigint
, active            char ( 1 )        -- Y/N, show small set of Active.
, amount            numeric ( 10,2 )  -- supposedly some amount of money.
, dt                timestamp         -- some date, case we want history stuff
, payload           varchar ( 200 )   -- some text
, filler            varchar ( 750 )   -- some data to create 1K recordsize
, constraint t1_coloc_hsh_pk primary key ( id ) 
)  with ( colocation = true ) ;

create table t1_coloc_asc ( 
  id                bigint
, active            char ( 1 )        -- Y/N, show small set of Active.
, amount            numeric ( 10,2 )  -- supposedly some amount of money.
, dt                timestamp         -- some date, case we want history stuff
, payload           varchar ( 200 )   -- some text
, filler            varchar ( 750 )   -- some data to create 1K recordsize
, constraint t1_coloc_asc_pk primary key ( id asc ) 
) ( with colocation = true ) ;

create table t1_1tab ( 
  id                bigint
, active            char ( 1 )        -- Y/N, show small set of Active.
, amount            numeric ( 10,2 )  -- supposedly some amount of money.
, dt                timestamp         -- some date, case we want history stuff
, payload           varchar ( 200 )   -- some text
, filler            varchar ( 750 )   -- some data to create 1K recordsize
, constraint t1_1tab_pk primary key ( id ) 
) with (colocation = false ) split into 1 tablets ; 

create table t1_4tab ( 
  id                bigint
, active            char ( 1 )        -- Y/N, show small set of Active.
, amount            numeric ( 10,2 )  -- supposedly some amount of money.
, dt                timestamp         -- some date, case we want history stuff
, payload           varchar ( 200 )   -- some text
, filler            varchar ( 750 )   -- some data to create 1K recordsize
, constraint t1_4tab_pk primary key ( id ) 
) with (colocation = false ) split into 4 tablets ; 

create table t1_8tab ( 
  id                bigint
, active            char ( 1 )        -- Y/N, show small set of Active.
, amount            numeric ( 10,2 )  -- supposedly some amount of money.
, dt                timestamp         -- some date, case we want history stuff
, payload           varchar ( 200 )   -- some text
, filler            varchar ( 750 )   -- some data to create 1K recordsize
, constraint t1_8tab_pk primary key ( id ) 
) with (colocation = false ) split into 8 tablets ; 


insert into t1_coloc_hsh select * from t ; 
insert into t1_coloc_asc select * from t ; 

insert into t1_1tab select * from t ; 
insert into t1_4tab select * from t ; 
insert into t1_8tab select * from t ; 

