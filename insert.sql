--Defined steps before creating Packages 

--1) Create Package Specs
--2) Create Package Body.

DROP PACKAGE INSERTION;

CREATE OR REPLACE PACKAGE INSERTION
AS
   PROCEDURE INSERT_ROLE(role_description in role.role_description%TYPE, 
        display_name in role.display_name%TYPE, 
        CREATED_BY_ID in role.created_by_id%TYPE);
    PROCEDURE insert_oxygen_plant_details(name in oxygen_cylinder_plant.name%TYPE,
        address in oxygen_cylinder_plant.address%TYPE, phone_number in oxygen_cylinder_plant.phone_number%TYPE,
        county in oxygen_cylinder_plant.county%TYPE, email_id in oxygen_cylinder_plant.EMAIL_ID%TYPE);
    PROCEDURE insert_oxygen_cylinder_details(plant_id IN oxygen_cylinder_details.plant_id%TYPE,
                            quantity in oxygen_cylinder_details.quantity%TYPE, available_status IN oxygen_cylinder_details.available_status%TYPE);
    PROCEDURE insert_payment_status(status_description  IN payment_status.status_description%TYPE);
END INSERTION;
/


CREATE OR REPLACE PACKAGE BODY INSERTION
    AS
        PROCEDURE INSERT_ROLE(role_description in role.role_description%TYPE, 
        display_name in role.display_name%TYPE, 
        CREATED_BY_ID in role.created_by_id%TYPE)
        IS 
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
        
        PROCEDURE insert_oxygen_plant_details(name in oxygen_cylinder_plant.name%TYPE,
        address in oxygen_cylinder_plant.address%TYPE, phone_number in oxygen_cylinder_plant.phone_number%TYPE,
        county in oxygen_cylinder_plant.county%TYPE, email_id in oxygen_cylinder_plant.EMAIL_ID%TYPE)
        IS 
        BEGIN
            dbms_output.put_line('---------------------------------------------------');
            insert into oxygen_cylinder_plant(PLANT_ID, NAME, ADDRESS, PHONE_NUMBER, COUNTY, EMAIL_ID, 
                                    CREATED_ON, UPDATED_ON) VALUES (DEFAULT, name, address, phone_number, county, email_id, DEFAULT, DEFAULT) ;
            dbms_output.put_line('Row inserted into oxygen cylinder plant table');
            dbms_output.put_line('---------------------------------------------------');
        commit;
        exception
            when dup_val_on_index then
               dbms_output.put_line('duplicate value found || insert different value');
            when others then
               dbms_output.put_line('Error while inserting data into OXygen Cylidner Plant Table');
                rollback;
               dbms_output.put_line('The error encountered is: ');
               dbms_output.put_line(dbms_utility.format_error_stack);
               dbms_output.put_line('---------------------------------------------------');
        end insert_oxygen_plant_details;

        PROCEDURE insert_oxygen_cylinder_details(plant_id IN oxygen_cylinder_details.plant_id%TYPE,
                            quantity in oxygen_cylinder_details.quantity%TYPE, available_status IN oxygen_cylinder_details.available_status%TYPE)
            IS 
            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                insert into oxygen_cylinder_details(CYLINDER_ID, PLANT_ID, quantity, available_status,  
                                        CREATED_ON, UPDATED_ON) VALUES (DEFAULT, plant_id, quantity, available_status, DEFAULT, DEFAULT) ;
                dbms_output.put_line('Row inserted into oxygen cylinder details table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into OXygen Cylidner details Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_oxygen_cylinder_details;
    
        PROCEDURE insert_payment_status(status_description IN payment_status.status_description%TYPE)
            IS 
            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                insert into payment_status(PAYMENT_STATUS_CODE, status_description, created_on) 
                        VALUES (DEFAULT, status_description , DEFAULT) ;
                dbms_output.put_line('Row inserted into Payment status table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Payment Status Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_payment_status;
    
    
    end INSERTION;
/

