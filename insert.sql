--Defined steps before creating Packages 

--1) Create Package Specs
--2) Create Package Body.

CREATE OR REPLACE PACKAGE INSERTION
AS
   PROCEDURE INSERT_ROLE(role_description in role.role_description%TYPE, 
        display_name in role.display_name%TYPE, 
        CREATED_BY_ID in role.created_by_id%TYPE,
        created_on in role.created_on%TYPE);
END INSERTION;
/


CREATE OR REPLACE PACKAGE BODY INSERTION
    AS
        PROCEDURE INSERT_ROLE(role_description in role.role_description%TYPE, 
        display_name in role.display_name%TYPE, 
        CREATED_BY_ID in role.created_by_id%TYPE,
        created_on in role.created_on%TYPE)
        AS 
        BEGIN
            dbms_output.put_line('---------------------------------------------------');
            insert into ROLE(ROLE_ID, ROLE_DESCRIPTION, DISPLAY_NAME,
                                    CREATED_BY_ID,CREATED_ON) VALUES (DEFAULT, role_description, display_name, created_by_id, DEFAULT) ;
            dbms_output.put_line('Row inserted into role table');
            dbms_output.put_line('---------------------------------------------------');
        commit;
        exception
        when dup_val_on_index then
           dbms_output.put_line('duplicate value found || insert different value');
        when others then
           dbms_output.put_line('Error while inserting data into ROLE Table');
            rollback;
           dbms_output.put_line('The error encountered is: ');
           dbms_output.put_line(dbms_utility.format_error_stack);
           dbms_output.put_line('---------------------------------------------------');
        end INSERT_ROLE;
    
    end INSERTION;
/


--select * from role
--
--
--
--DECLARE
--  ROLE_DESCRIPTION VARCHAR2(500);
--  DISPLAY_NAME VARCHAR2(50);
--  CREATED_BY_ID NUMBER;
--  CREATED_ON TIMESTAMP;
--BEGIN
--  ROLE_DESCRIPTION := 'Manager';
--  DISPLAY_NAME := 'Nithin';
--  CREATED_BY_ID := NULL;
--  CREATED_ON := SYSTIMESTAMP - INTERVAL '1' minute;
--
--  INSERT_ROLE(
--    ROLE_DESCRIPTION => ROLE_DESCRIPTION,
--    DISPLAY_NAME => DISPLAY_NAME,
--    CREATED_BY_ID => CREATED_BY_ID,
--    CREATED_ON => CREATED_ON
--  );
----rollback; 
--END;
--
execute insertion.insert_role('Manager4', 'Nithin5', null, systimestamp);
--




