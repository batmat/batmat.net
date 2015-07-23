---
Title: "Drop sequences for Oracle"
Date: 2008-12-22
Author: "Baptiste Mathus"
url: "2008/12/22/Drop-sequences-for-Oracle"
---



[Adam already showed how to generate all the drop table
statements](http://www.adam-bien.com/roller/abien/entry/generating_drop_tables_for_oracle)
(impossible to trackback):

     
    select 'drop table '||table_name||' CASCADE CONSTRAINTS;' from USER_TABLES

As I just needed to drop sequences, based on Adam's query, here's the
necessary:

     
    select 'drop sequence '||sequence_name||';' from USER_SEQUENCES;

Quite straightforward indeed.

Hope this helps.

