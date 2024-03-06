

\echo demo the explain of a qury and a function

\echo .
\echo check the amount of an order here using order and order_details

select o.customer_id || ' | ' ||  o.order_id || ' | ' || sum ( unit_price * quantity ) as amount
 from order_details od
    , orders o
where o.order_id = od.order_id
  and o.order_id = 10600 
group by o.customer_id, o.order_id ;

\echo now explain the sql to see activity and storage calls 

explain (analyze, dist  )
select o.customer_id || ' | ' ||  o.order_id || ' | ' || sum ( unit_price * quantity ) as amount
 from order_details od
    , orders o
where o.order_id = od.order_id
  and o.order_id = 10600 
group by o.customer_id, o.order_id ;

\echo check the explain plan for joining two tables

\! read -p "hit enter to continue with using a function " abc

\echo now create a function to do same

create or replace function fn_ord_amt ( smallint ) 
returns text 
as 
$$
select o.customer_id || ' | ' ||  o.order_id || ' | ' || sum ( unit_price * quantity ) as amount
 from order_details od
    , orders o
where o.order_id = od.order_id
  and o.order_id = $1 
group by o.customer_id, o.order_id ;
$$
language sql stable ; 

\echo select from the function

select fn_ord_amt ( o.order_id )  as func_result
from orders  o
where o.order_id = 10600 ; 

explain (analyze, dist ) 
select fn_ord_amt ( o.order_id )  as func_result
from orders o
where o.order_id = 10600 ; 

\echo note the explain when we call the function same result but diff explain
\echo on pg this reports index only scan and does NOT report the acitivty from inside the function
\echo on yb it reports index scan and 0 (zero?) storage requests
\echo ideally the explain with analyze and dist would report what the session really did in background
\echo which is probably 2 or 3 storage request ?

\! read -p "hit enter to continue and do explain of original sql once more..." abc

explain (analyze, dist  )
select o.customer_id || ' | ' ||  o.order_id || ' | ' || sum ( unit_price * quantity ) as amount
 from order_details od
    , orders o
where o.order_id = od.order_id
  and o.order_id = 10600 
group by o.customer_id, o.order_id ;


\echo end of demo. We showe diff in explain between normal SQL and hiding SQL in Function.

