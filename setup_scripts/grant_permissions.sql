create user TEST_USER_1 identified by Oxygenmanagementsystem123;
grant connect to TEST_USER_1;
grant create session to TEST_USER_1;
grant create procedure to TEST_USER_1;
grant create view to TEST_USER_1;
grant resource to TEST_USER_1;
grant select any table to TEST_USER_1;

grant create any directory, drop any directory to resource;

GRANT INSERT ON "ADMIN"."ACCOUNT" TO "TEST_USER_1" WITH GRANT OPTION;
GRANT SELECT ON "ADMIN"."ACCOUNT" TO "TEST_USER_1" WITH GRANT OPTION;
grant references on "ADMIN"."ACCOUNT" TO "TEST_USER_1" WITH GRANT OPTION; -- To alter table
GRANT UPDATE ON "ADMIN"."ACCOUNT" TO "TEST_USER_1" WITH GRANT OPTION;


