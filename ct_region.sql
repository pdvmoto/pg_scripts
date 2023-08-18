
drop table region ;

CREATE TABLE region (
    region_id smallint NOT NULL,
    region_description bpchar NOT NULL
);

ALTER TABLE region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);


COPY region (region_id, region_description) FROM stdin;
4 Southern
1 Eastern
2 Western
3 Northern
\.




