ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE
;

CREATE USER boarduser1 IDENTIFIED BY 1234
;

ALTER USER boarduser1 account unlock
;

GRANT resource, dba, CONNECT TO boarduser1
;


GRANT CREATE ANY TABLE TO boarduser1
;