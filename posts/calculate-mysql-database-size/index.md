---
title: "Calculate MySQL database size"
date: "2011-07-08"
permalink: false
tags: ["programming-stuff", "post"]
---

Not sure anymore where I found this, but this is a nice script to see which MySQL tables take how much space.

``` sql
SELECT NOW(), VERSION();
# Per Schema Queries 
SET @schema = IFNULL(@schema,DATABASE());

# One Line Schema Summary 
SELECT table_schema, SUM(data_length+index_length)/1024/1024 AS total_mb, SUM(data_length)/1024/1024 AS data_mb, SUM(index_length)/1024/1024 AS index_mb, COUNT(*) AS tables, CURDATE() AS today FROM information_schema.tables WHERE table_schema=@schema GROUP BY table_schema;

# Schema Engine/Collation Summary 
SELECT table_schema,engine,table_collation, COUNT(*) AS tables FROM information_schema.tables WHERE table_schema=@schema GROUP BY table_schema,engine,table_collation;

# Schema Table Usage 
SELECT table_schema,table_name,engine,row_format, table_rows, avg_row_length, (data_length+index_length)/1024/1024 as total_mb, (data_length)/1024/1024 as data_mb, (index_length)/1024/1024 as index_mb, CURDATE() AS today FROM information_schema.tables WHERE table_schema=@schema ORDER BY 7 DESC;

# Schema Table BLOB/TEXT Usage 
select table_schema,table_name,column_name,data_type from information_schema.columns where table_schema= @schema and ( data_type LIKE '%TEXT' OR data_type like '%BLOB');
set @schema = NULL;
```
