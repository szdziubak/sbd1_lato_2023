/*uprawnienia systemowe
CREATE SESSION
CREATE SEQUENCE
CREATE SYNONIM
CREATE TABLE - w schemacie u�ytkownika
CREATE ANY TABLE - w dowolnym schemacie
DROP TABLE DROP ANY TABLE
CREATE PROCEDURE
EXECUTE ANY PROCEDURE
CREATE USER
DROP USER
CREATE VIEW*/

--aby nada� wiele uprawnie� z mo�liwo�ci� ich dalszego rozpowszechniania (WITH ADMIN OPTION)
GRANT CREATE SEQUENCE, CREATE TABLE, CREATE VIEW to sql100 with ADMIN OPTION; 

CREATE USER nazwa_uzytkownika identified by has�o;
--DROP USER sql100;
REVOKE CREATE TABLE FROM sql100;

/*uprawnienia obiektowe
SELECT
INSERT
UPDATE
DELETE
EXECUTE
ALTER 
ALL
*/
GRANT SELECT, UPDATE on employees TO sql100;
GRANT ALL on employees TO sql100;
GRANT SELECT, UPDATE on employees TO sql100 WITH GRANT OPTION; --with grant option - mo�na dalej przekazywa� uprawnienia
REVOKE UPDATE ON employees FROM sql100;



/*Data Dictionary
to zbi�r tabel o obiektach bazy danych czyli tabelach, kolumnach, u�ytkownikach itd. Innymi s�owy to metadane bazy. Zawiera ponad 500 tabel.
Jak wyszukiwa� po��dane tabele?
Musimy znale�� tabele, kt�ra przypomina t�, kt�ra zawiera szukane przez nas informacje.
Na przyk�ad szumay uprawnie� systemowych:
1. select *  from dict where table_name like '%PRIV%'; 
2. Wybieramy user_sys_privs;
3. desc user_sys_privs; --wybieramy tabele
4. select privilege from user_sys_privs;
user_objects - obiekty u�ytkownika - indeksy, tabele, sekwencje itd
all_objects - wszystkie obiekty, nie tylko u�ytkownika
user_tables - tabele u�ytkownika 
user_views - perspektywy u�ytkownika
user_synonyms - synonimy u�ytkownika
*/
select *  from dict;
select * from all_objects;

select * from dict where lower(table_name) like '%table%';
select * from user_tables;

