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

