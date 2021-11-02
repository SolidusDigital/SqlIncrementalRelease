create or alter procedure app.app_get_some_data2
							@error nvarchar(max) = '' output
as
set nocount on;

select 'get_some_data' get_some_data
go
