create or alter procedure dbo.insert_some_data

as
set nocount on;
create table #temp (id int not null)

insert into #temp (id)
select 1
