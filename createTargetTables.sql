-- select concat('drop table ', table_name, ';') from information_schema.tables where table_schema <> 'pg_catalog' and table_schema <> 'information_schema';

create table greatgrandparents (
    id uuid primary key,
    name text null
);

create table grandparents (
    id uuid primary key,
    greatgrandparentid uuid null,
    parentid int null,
    name text null
);

create table parents (
    id uuid primary key,
    name text null
);

create table parentchilds (
    parentid uuid,
    childid uuid,
    primary keys (parentid, childid)
);

create table childs (
    id uuid primary key,
    name text null,
    status text null
);

create table childgrandchilds (
    childid uuid,
    grandchildid uuid,
    primary key (childid, grandchildid)
);

create table grandchilds (
    id uuid primary key,
    name text null
);

create table grandchildgreatgrandchilds (
    grandchildid uuid,
    greatgrandchildid uuid,
    primary key(grandchildid, greatgrandchildid)
);

create table greatgrandchilds (
    id uuid primary key,
    name text null
--     grandchildid uuid null
);

create table names(
    id uuid primary key,
    greatgrandchildid uuid not null,
    name text
);

create table greatgrandchildnames (
    id uuid primary key,
    greatgrandchildid uuid not null,
    name text not null
);
