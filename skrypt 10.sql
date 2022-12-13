/*Tworzenie tabeli
CREATE TABLE nazwa_tabeli (
    nazwa_kolumny_1 typ [CONSTRAINT definicja_wi�z�w DEFAULT wyra�enie domy�lne],
    nazwa_kolumny_2 typ [CONSTRAINT definicja_wi�z�w DEFAULT wyra�enie domy�lne],
)*/

CREATE TABLE employees_sa_rep (
    employee_id integer,
    first_name varchar2(30),
    last_name varchar2(32)
)

/*typy danych:
    varchar2(n)
    integer 
    number
    char
    date*/


/*wi�zy (warunki integralno�ci):
    CHECK - warto�� w kolumnie musi spe�nia� okre�lony warunek,
    NOT NULL - warto�� w kolumnie musi by� niepusta (not NULL),
    PRIMARY KEY - klucz g��wny tabeli, sk�adaj�cy si� z jednej lub wi�cej kolumn,
    FOREIGN KEY - klucz obcy tabeli,
    UNIQUE - w kolumnie musz� by� sk�adowane tylko unikatowe warto�ci
*/

CREATE TABLE employees_sa_rep (
    employee_id integer PRIMARY KEY,
    first_name varchar2(30),
    last_name varchar2(32),
    salary integer CONSTRAINT check_salary CHECK (salary > 0),
    department_id number(5) CONSTRAINT fk_department_id REFERENCES departments(department_id));

--modyfikacja tabeli
ALTER TABLE nazwa tabeli ADD/MODIFY/DROP/ADD CONSTRAINT

ALTER TABLE employees_sa_rep ADD staz INTEGER DEFAULT 0; --nowa kolumna
ALTER TABLE employees_sa_rep MODIFY salary number(10); --zmiana typu
ALTER TABLE employees_sa_rep ADD CONSTRAINT last_name_check CHECK (length(last_name)>=2) --dodawanie wi�z��w
ALTER TABLE employees_sa_rep DROP CONSTRAINT last_name_check --usuwanie wi�z��w
ALTER TABLE employees_sa_rep DISABLE CONSTRAINT last_name_check; --wy��czanie wi�z��w
ALTER TABLE employees_sa_rep ENABLE CONSTRAINT last_name_check; --w��czanie wi�z��w

--usuwanie tabeli
DROP TABLE employees_sa_rep
