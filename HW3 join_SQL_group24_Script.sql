-- ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employee_name, monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id;

--������� ���� ���������� � ������� �� ������ 2000.
select employee_name, monthly_salary from  employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where monthly_salary<2000;

--������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select * from  employee_salary
left outer join employees on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id
where employees.id is null;

--������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select * from  employee_salary
left outer join employees on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id
where employees.id is null and monthly_salary < 2000;

--����� ���� ���������� ���� �� ��������� ��.
select * from  employees
left outer join employee_salary on employees.id = employee_salary.employee_id
where employee_salary.salary_id is null;

--������� ���� ���������� � ���������� �� ���������
select employee_name, role_name from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 

--������� ����� � ��������� ������ Java �������������
select employee_name, role_name from employees 
join roles_employee on employees.id =  roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name ilike  '%java%'

--������� ����� � ��������� ������ Python �������������.
select employee_name, role_name from employees 
join roles_employee on employees.id =  roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name ilike  '%python%';

--������� ����� � ��������� ���� QA ���������
select employee_name, role_name from employees 
join roles_employee on employees.id =  roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name ilike  '%qa%';

--������� ����� � ��������� ������ QA ���������
select employee_name, role_name from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name ilike  '%qa%' and roles.role_name ilike  '%manual%';

--������� ����� � ��������� ��������������� QA
select employee_name, role_name from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name ilike  '%qa%' and roles.role_name ilike  '%automation%';

--������� ����� � �������� Junior ������������
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id =  re.employee_id
join roles r on re.role_id = r.id 
where r.role_name ilike  '%junior%';

-- ������� ����� � �������� Middle ������������
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id =  re.employee_id
join roles r on re.role_id = r.id 
where r.role_name ilike  '%middle%';

--������� ����� � �������� Senior ������������
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id =  re.employee_id
join roles r on re.role_id = r.id 
where r.role_name ilike  '%senior%';

--������� �������� Java �������������
select  s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id =  re.employee_id
join roles r on re.role_id = r.id 
where r.role_name ilike  '%java%' and r.role_name ilike  '%developer%';

--������� �������� Python �������������
select s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id =  re.employee_id
join roles r on re.role_id = r.id 
where r.role_name ilike  '%python%' and r.role_name ilike  '%developer%';

--������� ����� � �������� Junior Python �������������
select  employee_name, monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike 'Junior Python developer';

--������� ����� � �������� Middle JS �������������
select  employee_name, monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike 'Middle JavaScript developer';

--������� ����� � �������� Senior Java �������������
select  employee_name, monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike 'Senior Java developer';
					
--������� �������� Junior QA ���������
select  employee_name, monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%QA engineer' and r.role_name ilike 'Junior%';
					
--������� ������� �������� ���� Junior ������������
select  avg(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where  r.role_name ilike 'Junior%';

--������� ����� ������� JS �������������
select  sum(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%Java developer';

--������� ����������� �� QA ���������
select  min(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%QA engineer';

--������� ������������ �� QA ���������
select  max(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%QA engineer';

--������� ���������� QA ���������
select  count(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%QA engineer';

--������� ���������� Middle ������������.
select  count(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%middle%';

-- ������� ���������� �������������
select  count(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%developer%';

--������� ���� (�����) �������� �������������.
select  sum(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%developer';

--������� �����, ��������� � �� ���� ������������ �� �����������
select e.employee_name, r.role_name, s.monthly_salary  from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
order by e.employee_name ;

--������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select e.employee_name, r.role_name, s.monthly_salary  from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where s.monthly_salary between 1700 and 2300;

--������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select e.employee_name, r.role_name, s.monthly_salary  from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where s.monthly_salary < 2300;

--������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary  from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where s.monthly_salary in (1100,1500,2000);
