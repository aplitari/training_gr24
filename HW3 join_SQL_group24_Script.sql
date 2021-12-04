-- Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id;

--Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from  employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where monthly_salary<2000;

--Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select * from  employee_salary
left outer join employees on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id
where employees.id is null;

--Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select * from  employee_salary
left outer join employees on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id
where employees.id is null and monthly_salary < 2000;

--Найти всех работников кому не начислена ЗП.
select * from  employees
left outer join employee_salary on employees.id = employee_salary.employee_id
where employee_salary.salary_id is null;

--Вывести всех работников с названиями их должности
select employee_name, role_name from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 

--Вывести имена и должность только Java разработчиков
select employee_name, role_name from employees 
join roles_employee on employees.id =  roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name ilike  '%java%'

--Вывести имена и должность только Python разработчиков.
select employee_name, role_name from employees 
join roles_employee on employees.id =  roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name ilike  '%python%';

--Вывести имена и должность всех QA инженеров
select employee_name, role_name from employees 
join roles_employee on employees.id =  roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name ilike  '%qa%';

--Вывести имена и должность ручных QA инженеров
select employee_name, role_name from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name ilike  '%qa%' and roles.role_name ilike  '%manual%';

--Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name ilike  '%qa%' and roles.role_name ilike  '%automation%';

--Вывести имена и зарплаты Junior специалистов
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id =  re.employee_id
join roles r on re.role_id = r.id 
where r.role_name ilike  '%junior%';

-- Вывести имена и зарплаты Middle специалистов
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id =  re.employee_id
join roles r on re.role_id = r.id 
where r.role_name ilike  '%middle%';

--Вывести имена и зарплаты Senior специалистов
select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id =  re.employee_id
join roles r on re.role_id = r.id 
where r.role_name ilike  '%senior%';

--Вывести зарплаты Java разработчиков
select  s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id =  re.employee_id
join roles r on re.role_id = r.id 
where r.role_name ilike  '%java%' and r.role_name ilike  '%developer%';

--Вывести зарплаты Python разработчиков
select s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id =  re.employee_id
join roles r on re.role_id = r.id 
where r.role_name ilike  '%python%' and r.role_name ilike  '%developer%';

--Вывести имена и зарплаты Junior Python разработчиков
select  employee_name, monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike 'Junior Python developer';

--Вывести имена и зарплаты Middle JS разработчиков
select  employee_name, monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike 'Middle JavaScript developer';

--Вывести имена и зарплаты Senior Java разработчиков
select  employee_name, monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike 'Senior Java developer';
					
--Вывести зарплаты Junior QA инженеров
select  employee_name, monthly_salary from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%QA engineer' and r.role_name ilike 'Junior%';
					
--Вывести среднюю зарплату всех Junior специалистов
select  avg(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where  r.role_name ilike 'Junior%';

--Вывести сумму зарплат JS разработчиков
select  sum(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%Java developer';

--Вывести минимальную ЗП QA инженеров
select  min(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%QA engineer';

--Вывести максимальную ЗП QA инженеров
select  max(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%QA engineer';

--Вывести количество QA инженеров
select  count(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%QA engineer';

--Вывести количество Middle специалистов.
select  count(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%middle%';

-- Вывести количество разработчиков
select  count(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%developer%';

--Вывести фонд (сумму) зарплаты разработчиков.
select  sum(monthly_salary) from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%developer';

--Вывести имена, должности и ЗП всех специалистов по возрастанию
select e.employee_name, r.role_name, s.monthly_salary  from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
order by e.employee_name ;

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select e.employee_name, r.role_name, s.monthly_salary  from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where s.monthly_salary between 1700 and 2300;

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select e.employee_name, r.role_name, s.monthly_salary  from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where s.monthly_salary < 2300;

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary  from employees e
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where s.monthly_salary in (1100,1500,2000);
