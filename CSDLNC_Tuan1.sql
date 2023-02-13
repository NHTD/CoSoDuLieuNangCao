
/*
	 tạo view_money các nhân viên có mức lướng dưới 3000 trong công ty
*/
create view view_money5
as
	select first_name, last_name, email, phone_number, salary
    from employees where salary<3000;
    
select * from view_money5

/*
	 tạo view_job công việc bắt đầu bằng chữ "A"
*/
create view view_job1
as
	select e.first_name, e.last_name, e.email, e.phone_number, j.job_title from employees e join jobs j
    on e.job_id=j.job_id where j.job_title like 'A%'
    
select * from view_job1

/*
	 tạo proc(countryName) hiển thị thông tin của toàn bộ countries
*/
delimiter $$
create procedure proc_countryName (IN countryname varchar(40))
begin
	select country_id, country_name, region_id from countries where country_name like concat('%',countryname,'%');
end$$

call proc_1('Egypt')

/*
	tạo proc(firstName) dùng để xóa thông tin của 1 nhân viên
*/
delimiter $$
create procedure proc_deleteEmployee(IN firstName varchar(20))
begin
	delete from employees where first_name like concat('%',firstName,'%');
end$$

call proc_4('Alexander')
