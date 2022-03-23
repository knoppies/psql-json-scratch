-- Make sure that the data arrived as intended.
select j from tmpjson;

-- The first select will show we can grab the most parent objects without a problem
select * from json_populate_recordset(null::greatgrandparents, (select j->'insert' from tmpjson));

-- This syntax doesn't seeem to have a way to select multiple items in a list, I can't say get all children of the downgrandparent property.
-- So json_populate_recordset() to the rescue
select * from json_populate_recordset(null::grandparents, (select json_extract_path(j, '$.insert.downgrandparent[*]') from tmpjson));

-- Which keeps returning zero results, so I thought lets focus on the json_extract_path()

select json_extract_path(j, '$.insert.downgrandparent[*]') from tmpjson;

-- Didn't return anything either, so let's just get the roots.
select json_extract_path(j, '$.insert') from tmpjson;
select json_extract_path(j, '$') from tmpjson;
 
 -- and that doesn't return anything depsite what the documentation says