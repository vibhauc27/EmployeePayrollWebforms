--CREATE DATABASE--
create database EmpPayrollWebform;

use EmpPayrollWebform;
---------------------------------------------

--TABLE PAYROLL FORM DETAILS--

create table EmpPayrollDetails(
	ID int identity (1,1) primary key,
	IMG varchar(250) not null, 
	NAME varchar(40) not null, 
	GENDER varchar(10) not null, 
	DEPARTMENT varchar(60) not null, 
	SALARY varchar(10) not null, 
	START_DATE varchar(15) not null, 
	NOTES varchar(200)
);

--TO SEE PAY FORM DETAILS TABLE--

select * from EmpPayrollDetails;

--STORE PROCEDURES OF PAY FORM--


Create procedure EmployeePayrollCredential
(
 @NAME varchar(40),
 @IMG varchar(250),
 @GENDER varchar(10),
 @DEPARTMENT varchar(60),
 @SALARY varchar(10),
 @START_DATE varchar(15),
 @NOTES varchar(200)
)
as
begin try
     insert into EmpPayrollDetails (NAME,IMG,GENDER,DEPARTMENT,SALARY,START_DATE,NOTES) values ( @NAME, @IMG, @GENDER, @DEPARTMENT, @SALARY, @START_DATE, @NOTES)
end try
begin catch
select
    ERROR_NUMBER() as ErrorNumber,
    ERROR_STATE() as ErrorState,
    ERROR_PROCEDURE() as ErrorProcedure,
    ERROR_LINE() as ErrorLine,
    ERROR_MESSAGE() as ErrorMessage;
End catch

---------------------------------------------------------------------
--TABLE LOGIN DETAILS--

create table LogInDetails(
	Id int identity (1,1) primary key, 
	Email varchar(50) not null, 
	Password varchar(15) not null, 
	LoggedTime datetime default sysdatetime()
);

--TO SEE LOGIN DETAILS TABLE--

select * from LogInDetails; 

--STORE PROCEDURES OF LOGIN--

Create procedure LogInCredentials
(
 @Email varchar(20),
 @Password varchar(15)
)
as
declare @count int
begin try     
     select @count = count(Email) from EmployeeDetails where (Email=@Email and Password=@Password) 
     if(@count = 1)
	 begin
		insert into LogInDetails (Email,Password) values ( @Email, @Password)
		select * from EmployeeDetails where (Email=@Email and Password=@Password)
		select 1 as ReturnCode
	 end
	 else
	 begin
		select -1 as ReturnCode
	 end
end try
begin catch
select
    ERROR_NUMBER() as ErrorNumber,
    ERROR_STATE() as ErrorState,
    ERROR_PROCEDURE() as ErrorProcedure,
    ERROR_LINE() as ErrorLine,
    ERROR_MESSAGE() as ErrorMessage;
End catch

-----------------------------------------------------------------------------------------

--TABLE EMPLOYEE DETAILS--

create table EmployeeDetails(
	Id int identity (1,1) primary key,
	FirstName varchar(20) not null,
	LastName varchar(20) not null, 
	Email varchar(40) unique not null, 
	Phone bigint not null,
	Password varchar(15) not null, 
	RegisteredDate datetime default sysdatetime()
);

--TO SEE EMPLOYEE DETAILS ;TABLE--

select * from EmployeeDetails

---------------------------------------------------------

--STORE PROCEDURES OF SINGUP--
Create procedure SignUpDetails
(
 @FirstName varchar(20),
 @LastName varchar(20),
 @Email varchar(40),
 @Phone bigint,
 @Password varchar(15)
)
as
begin try
     declare @Count int
	 declare @ReturnCode int
	 select @Count = count(Email) from EmployeeDetails where Email = @Email
	 if(@Count>0)
		begin
		set @ReturnCode = -1
		end
	 else
		begin
		set @ReturnCode = 1
	    insert into EmployeeDetails (FirstName,LastName,Email,Phone,Password) values ( @FirstName, @LastName , @Email, @Phone, @Password)
		end
	 select @ReturnCode as ReturnValue
end try
begin catch
select
    ERROR_NUMBER() as ErrorNumber,
    ERROR_STATE() as ErrorState,
    ERROR_PROCEDURE() as ErrorProcedure,
    ERROR_LINE() as ErrorLine,
    ERROR_MESSAGE() as ErrorMessage;
End catch