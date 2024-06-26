/* 
 ct_plog.sql: create a table and some exapels to log timestamped-events.

*/

create table plog ( 
  id bigint primary key generated always as identity
, ts timestamp default current_timestamp
, log_group text default 'default'
, log_txt  text
) ; 

insert into plog ( log_txt ) values ( 'Creation of plog' ) ;


select * from plog order by id ;

