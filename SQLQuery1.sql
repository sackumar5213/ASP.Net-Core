use employee_126;

select * from employee;







/* With Single Procedure*/
create procedure EMPLOYEE_PROCEDURE
@action varchar(30)=null,
@name varchar(50)=null,
@email varchar(50)=null,
@pass varchar(50)=null,
@phone varchar(20)=null,
@age int=0,
@command_argument int=0
as
begin
	if(@action='showData')
		begin
			select * from employee;
		end
	else if(@action='insertData')
		begin
			insert into employee(emp_name, emp_email, emp_pass, emp_phone, emp_age)
			values (@name, @email, @pass, @phone, @age);
		end
	else if(@action='deleteData')
		begin
			delete from employee where emp_id=@command_argument;
		end
	else if(@action='editData')
		begin
			select * from employee where emp_id=@command_argument
		end
	else if(@action='updateData')
		begin
			update employee set emp_name=@name,emp_email=@email, emp_pass=@pass, emp_phone=@phone, emp_age=@age
			where emp_id=@command_argument;
		end
end






/*User Insert Data*/
insert into employee (emp_name, emp_email, emp_pass, emp_phone, emp_age) values ('Mercie', 'mlevins0@netvibes.com', 'vV0@eIK"_h', '6213092842', 59);
insert into employee (emp_name, emp_email, emp_pass, emp_phone, emp_age) values ('Ward', 'wguyers1@nifty.com', 'gY4"3cA%VihrO05Q', '7382117124', 60);
insert into employee (emp_name, emp_email, emp_pass, emp_phone, emp_age) values ('Brit', 'bmountain2@purevolume.com', 'sZ0.0yd/AvQv', '6506442756', 95);
insert into employee (emp_name, emp_email, emp_pass, emp_phone, emp_age) values ('Daryle', 'dtawn3@sitemeter.com', 'zA2*)l8Oj?', '9906889859', 20);
insert into employee (emp_name, emp_email, emp_pass, emp_phone, emp_age) values ('Stanly', 'slawly4@studiopress.com', 'fE7,}Xx!Pz', '5944033992', 88);
insert into employee (emp_name, emp_email, emp_pass, emp_phone, emp_age) values ('Natty', 'nellington5@phpbb.com', 'xX6">gfJZ3xM', '3305593504', 48);
insert into employee (emp_name, emp_email, emp_pass, emp_phone, emp_age) values ('Ryan', 'rsilcocks6@techcrunch.com', 'oR5!SIB&XLY.', '6999450425', 59);
insert into employee (emp_name, emp_email, emp_pass, emp_phone, emp_age) values ('Dino', 'dhounsome7@reference.com', 'uV6?2a9zFGqCj', '6583720167', 28);
insert into employee (emp_name, emp_email, emp_pass, emp_phone, emp_age) values ('Chadwick', 'cmoncreiff8@about.me', 'cH5{ev*~yyf|I$*', '9316829056', 22);
insert into employee (emp_name, emp_email, emp_pass, emp_phone, emp_age) values ('Lil', 'lkochs9@homestead.com', 'mZ4{P0pc', '1788203124', 33);