create or alter procedure dbo.update_some_data

as
set nocount on;
create table #temp (id int not null)

insert into #temp (id)
select 1
