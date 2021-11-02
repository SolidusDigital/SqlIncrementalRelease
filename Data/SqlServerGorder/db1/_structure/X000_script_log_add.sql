if not exists(select * from sys.databases where name = 'db2')
	create database db2
use iac
go

declare @script_num varchar(10) = 'X' + '000'
declare
	@start_message varchar(100) =  @script_num + ': creation of table dba.script_log'

print @start_message

begin transaction
begin try


create table dbo.script_log (
	script_log_id integer        not null constraint [PK_script_log] primary key identity,
	name          varchar(250)   not null,
	inserted_date datetimeoffset not null default sysutcdatetime()
);

create unique index [UX_Name] on dbo.script_log (name)

insert into dbo.script_log(name)
values (@script_num)

commit
print @script_num +  ' OK'
end try
begin catch
	rollback
	;throw
end catch




