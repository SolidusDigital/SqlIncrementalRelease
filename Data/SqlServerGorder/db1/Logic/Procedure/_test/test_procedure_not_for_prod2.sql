create or alter procedure dbo.test_procedure_not_for_prod2 @ENV varchar(20)

as
set nocount on;
declare @error varchar(500) = '', @srv_name varchar(100) = (select convert(varchar(100), serverproperty('MachineName')) [ServerName])

if @srv_name like '%prod%' or isnull(nullif(@ENV,''), '') in ('', 'production', 'PROD')
	set @error = concat('You cant run this script on prod; input_inv', @env,' srv_name:', @srv_name)

print 'hi'
go

