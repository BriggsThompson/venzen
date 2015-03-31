alter table space modify deposit decimal null;
alter table space modify cleaningFee decimal null;

alter table venue add column totalCapacity mediumint null after email;
alter table detail modify title varchar(1000) not null;
alter table detail modify description text;