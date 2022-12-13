--Transakcje
/*
Wsp�bie�no�� - jednocze�nie mog� by� dokonywane wiele odczyt�w i zapis�w.
ACID:
A - Atomowo�� - transakcje s� niepodzielne, albo wykonywane s� wszystkie operacje w ramach transakcji albo �adna.
C - Sp�jno�� - stan bazy przed i po operacji powinien by� sp�jny - poprawny, wszystkie warunki na�o�one na baz� danych musz� by� spe�nione.
I - Izolacja - transakcje nie powinny wzajemnie przeszkadza� sobie w dzia�aniu. 
D - Trwa�o�� - niepodatno�� na awarie.
Transakcja to ci�g operacji do wsp�lnego niepodzielnego wykonania.
*/
--wszystkie operacje DML (Insert, Update, Delete) maj� niejawny COMMIT, poniewa� ka�da operacja musi zosta� zatwierdzona - transakcje domy�lne

--Przyk�ad transakcji - wykonywanie przelewu
COMMIT; --zatwierd� transakcj�
ROLLBACK; --wycofaj transakcj�
SAVEPOINT savepoint1; --punkty zachowania
ROLLBACK TO SAVEPOINT savepoint1; --wycofujemy transakcje do okre�lonego momentu

CREATE TABLE copy_employees
AS (SELECT * FROM employees); 


--przyk�ad transakcji:
select * from copy_employees;
UPDATE copy_employees set salary = salary*1.2;
select * from copy_employees;
SAVEPOINT save1;
UPDATE copy_employees set salary = salary*1.1;
select * from copy_employees;
ROLLBACK TO SAVEPOINT save1;
select * from copy_employees;
ROLLBACK; --wycofuje ca�� transakcje
select * from copy_employees;

drop table copy_employees;

--wi�cej np. tutaj: https://mst.mimuw.edu.pl/lecture.php?lecture=bad&part=Ch7