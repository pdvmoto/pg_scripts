
create table test(id serial, json_data jsonb);

insert into test(json_data) values (
'{
  "id": 778,
  "shop": "Luigis Pizza",
  "name": "Edward Olson",
  "phoneNumbers": ["(935)503-3765x4154","(935)12345"],
  "address": "Unit 9398 Box 2056\nDPO AP 24022",
  "image": null,
  "pizzas": [
    {
      "pizzaName": "Salami",
      "additionalToppings": ["🥓", "🌶"]
    },
    {
      "pizzaName": "Margherita",
      "additionalToppings": ["🍌", "🌶", "🍍"]
    }
    ]
}'
);

-- data
select
json_data -> 'id' id,
json_data -> 'name' as name
from test;

-- data as text
select
json_data ->> 'id' id,
json_data ->> 'name' as name
from test;

-- extract subpath
select
json_data #>
'{pizzas,1,additionalToppings}'
as additional_toppings_2nd_pizza
from test;

-- item from array
select
json_data
-> 'phoneNumbers' -> 1
as second_phonenumber
from test;

-- path
select
jsonb_extract_path(json_data,
'pizzas','1','pizzaName') second_pizza_name
from test;

-- anything there ?
select
json_data
@? '$.pizzas[1].pizzaName == "Salami"'
as pizzaName_salami
from test;

