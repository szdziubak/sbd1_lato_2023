/*
SQL*PLUS
cmd: u�ytkownik/has�o@nazwa_hosta
*/

--poni�szych komend u�yjemy w SQL*PLUS

--SET LINESIZE - jaka b�dzie maksymalna d�ugo�� wy�wietlanej linii - po tej d�ugo�ci tekst b�dzie zawijany
SET LINESIZE 20
select * from employees;

--SET PAGESIZE --definiuje liczbe wierszy na stronie - jedna strona to nag��wki i ustalona liczba wierszy, kolejna to nag��wki i kolejne wiersze itd
SET PAGESIZE 30
select * from employees;


--SET ECHO ON/OFF - w��cza/wy��cza wy�wietlanie instrukcji SQL i polece� skryptu
SET ECHO ON
select * from employees;

SET ECHO OFF
select * from employees;

--Om�wmy tabele, z kt�rych b�dziemy korzysta� podczas zaj��
select * from employees;
describe employees;

select * from departments;
describe departments;

