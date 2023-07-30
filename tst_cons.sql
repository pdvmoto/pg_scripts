
-- note the color is effectively not-null, and as to be provided.. the dflt doesnt work.
create table tstcon ( id bigint primary key 
, color text NOT NULL DEFAULT 'BLACK' CHECK (color in ('RED', 'WHITE', 'BLUE'))) ; 

