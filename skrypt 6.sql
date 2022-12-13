--do ��czenia tabel wed�ug klucza b�dziemy potrzebowa� polece� join
--je�eli dane kt�rych potrzebujemy przechowywane s� w wielu tabelach to joiny b�d� niezb�dne
--do join�w wykorzystujemy 2 klauzule: zgodne z ANSI i Oraclowe.

--0. Where
select * from employees, departments 
where employees.department_id = departments.department_id;

--1. Natural join - ��czy tabele po takich samych nazwach kolumn
SELECT first_name, last_name, department_name
FROM employees NATURAL JOIN departments;
--nie podajemy nazwy kolumn do ��czenia

--2. Cross join - ��czy ka�dy wiersz z ka�dym czyli np. 1 tabela: 20 wierszy, 2 tabela: 20 wierszy, crosss join: 20x20
SELECT last_name, department_name
FROM employees CROSS JOIN departments;
Select * from employees,departments;

--3. Using - wybieramy kolumne po kt�rej b�dzie robiony join (ale tylko jedn�)
SELECT first_name, last_name, department_id, department_name
FROM employees JOIN departments USING (department_id);
SELECT first_name, last_name, department_id, department_name
FROM employees JOIN departments USING (department_id)
WHERE last_name = 'Higgins';

--4. Join on - pozwala na rozbudowe zapytania
SELECT last_name, department_name
FROM employees e JOIN departments d --aliasy tabel
ON (e.department_id = d.department_id);

SELECT last_name, job_title
FROM employees e JOIN jobs j
ON (e.job_id = j.job_id)
WHERE last_name LIKE 'H%';

--operatory nier�wno�ci - np. ON ... BETWEEN
SELECT last_name, salary, grade_level, lowest_sal, highest_sal
FROM employees JOIN job_grades
ON(salary BETWEEN lowest_sal AND highest_sal);

--��czenie wi�cej ni� 2 tabel
SELECT last_name, salary, grade_level, lowest_sal, highest_sal, department_name
FROM employees JOIN job_grades
ON(salary BETWEEN lowest_sal AND highest_sal)
JOIN departments ON (employees.department_id = departments.department_id);

--INNER JOIN vs OUTER JOIN
--INNER JOIN - to co jest w A i B, czyli ��czy tylko niepuste klucze A i B. To co dotychczas poznali�my to INNER JOIN (opr�cz iloczynu kartezja�skiego)
--LEFT OUTER JOIN - wszystko to co jest w A i niepuste klucze z B
--RIGHT OUTER JOIN - wszystko to co jest w B i niepuste klucze z A
--FULL OUTER JOIN - wszystko z A i B (puste i niepuste klucze)

--por�wnajmy
SELECT e.last_name, d.department_id, d.department_name
FROM employees e 
INNER JOIN departments d ON (e.department_id = d.department_id);

SELECT e.last_name, d.department_id, d.department_name
FROM employees e 
LEFT OUTER JOIN departments d ON (e.department_id = d.department_id);

SELECT e.last_name, d.department_id, d.department_name
FROM employees e 
RIGHT OUTER JOIN departments d ON (e.department_id = d.department_id);

SELECT e.last_name, d.department_id, d.department_name
FROM employees e 
FULL OUTER JOIN departments d ON (e.department_id = d.department_id);

--SELF JOIN - ��czenie tabeli samej ze sob�.
--Tabela employees jest po��czona ze sob� poniewa� wyst�puje relacja samej ze sob� tzn. kolumn employee_id i manager_id
SELECT worker.last_name || ' works for ' || manager.last_name
AS "Works for"
FROM employees worker JOIN employees manager
ON (worker.manager_id = manager.employee_id);

SELECT worker.last_name, worker.manager_id, manager.last_name
AS "Manager name"
FROM employees worker JOIN employees manager
ON (worker.manager_id = manager.employee_id);

--Joiny oraclowe
SELECT employees.last_name, employees.job_id, departments.department_name
FROM employees, departments 
WHERE employees.department_id = departments.department_id; --z��czenie w where

--oraclowy iloczyn kartezja�ski
SELECT employees.last_name, departments.department_name
FROM employees, departments;

--join w where z warunkiem
SELECT employees.last_name, employees.job_id, departments.department_name
FROM employees, departments 
WHERE employees.department_id = departments.department_id
AND employees.department_id = 80;

--alisowanie tabel - otrzymamy b��d bo SQL nie b�dzie wiedzia� z kt�rej tabeli wzi�� department_id
SELECT last_name, e.job_id, department_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND department_id = 80;

--oraclowe z��czenia nier�wne
SELECT last_name, salary, grade_level, lowest_sal, highest_sal
FROM employees, job_grades
WHERE (salary BETWEEN lowest_sal AND highest_sal);

--oraclowy outer join - (+) przy tabeli, przy kt�rej mog� by� brakuj�ce dane czyli bierzemy wszystko z jednej tabeli i do��czamy do niej dane z tabeli z (+)
SELECT e.last_name, d.department_id, 
d.department_name
FROM employees e, departments d
WHERE e.department_id = 
d.department_id(+);  --jak left outer join

SELECT e.last_name, d.department_id, 
d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = --odpowiednik right outer join 
d.department_id;

--nie ma odpowiednika FULL OUTER JOIN