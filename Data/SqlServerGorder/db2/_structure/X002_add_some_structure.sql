-- ***********************************************************************
-- iac script part
-- ***********************************************************************
declare @script_num    varchar(10) = 'X' + '001'
declare @start_message varchar(100) = @script_num + ': some more structure'
print @start_message

begin transaction
-- exec sp_MSforeachtable "ALTER TABLE ? CHECK CONSTRAINT all"
begin try
	create table dbo.login2 (
		login_id   int                           not null identity constraint [PK_login] primary key,
		user_name  nvarchar(300)                 not null,
		login_uuid nvarchar(128) default newid() not null
	)

	create unique index [UC_UserName] on dbo.login2 (user_name)


	-- ***************************************************************************************
-- Register current script
-- ***************************************************************************************
	insert into dbo.script_log(name)
	values (@script_num)
	commit
	print @script_num + ' OK'

end try
begin catch
	rollback
	; throw
end catch

