CREATE OR REPLACE VIEW public.ybx_tsiz_inf
AS SELECT i.oid,
    i.relname,
    i.num_tablets,
    i.size_bytes / 1024 / 1024 AS size_mb,
    cnt_rows(i.schemaname::text, i.relname::text) AS cnt_rows
   FROM ybx_tblinfo i
  WHERE i.relkind = 'r'::"char" 
    AND (i.relname IN ( SELECT pg_class.relname  
           FROM pg_class
          WHERE pg_class.relname ~~ 't_%'::text ))
  ORDER BY i.oid, i.relname;
