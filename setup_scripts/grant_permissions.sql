DECLARE 
    user_name_to_create VARCHAR2(100);
BEGIN
        dbms_output.put_line('>>> Creating user using Procedure');
        user_name_to_create:='TEST_USER_1';
        EXECUTE IMMEDIATE 'create user ' || user_name_to_create || ' identified by Oxygenmanagementsystem123';
        dbms_output.put_line('>>> Allowing user to login');
        EXECUTE IMMEDIATE 'grant connect to ' || user_name_to_create ;
        dbms_output.put_line('>>> Allowing user to create a session and do ad-hoc');
        EXECUTE IMMEDIATE 'grant create session to ' || user_name_to_create;
        dbms_output.put_line('>>> Allowing user to create procedures');
        EXECUTE IMMEDIATE 'grant create procedure to ' || user_name_to_create;
        dbms_output.put_line('>>> Allowing user to create views');
        EXECUTE IMMEDIATE 'grant create view to ' || user_name_to_create ;
        dbms_output.put_line('>>> Allowing user to access resources');
        EXECUTE IMMEDIATE 'grant resource to ' || user_name_to_create;
        dbms_output.put_line('>>> Allowing user to do select');
        EXECUTE IMMEDIATE 'grant select any table to ' || user_name_to_create;
        dbms_output.put_line('>>> Allowing user to create directory');
        EXECUTE IMMEDIATE 'grant create any directory, drop any directory to ' || user_name_to_create;

--        EXECUTE IMMEDIATE 'GRANT INSERT ON ' || user_name_to_create;

--
--GRANT INSERT ON "ADMIN"."ACCOUNT" TO "TEST_USER_1" WITH GRANT OPTION;
--GRANT SELECT ON "ADMIN"."ACCOUNT" TO "TEST_USER_1" WITH GRANT OPTION;
--grant references on "ADMIN"."ACCOUNT" TO "TEST_USER_1" WITH GRANT OPTION; -- To alter table
--GRANT UPDATE ON "ADMIN"."ACCOUNT" TO "TEST_USER_1" WITH GRANT OPTION;

        
EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1920 THEN --"table not found" exception
                dbms_output.put_line('*** User already exists. Please create a new user');
            END IF;
    dbms_output.put_line('>>> Executuion of procedure is Done to create a new user');
END;
/



