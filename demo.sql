SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE account_setup(
            display_name IN Account.display_name%TYPE,
            email_id  IN Account.email_id%TYPE,
            phone_number IN Account.phone_number%TYPE,
            address  IN Account.address%TYPE,
            county IN Account.county%TYPE,
            role_id IN Account.role_id%TYPE,
            plant_id IN ACCOUNT.plant_id%TYPE,
            password_input IN VARCHAR2,
            password_question IN VARCHAR2,
            password_answer IN VARCHAR2)
IS 
        password_id_generated INT;
        active_status_id INT;
        account_id_generated INT;
    BEGIN
            DBMS_OUTPUT.PUT_LINE('>>> Setting up the user account with display name ' || display_name || '  and role-id : ' || role_id);
            insertion.insert_password(password_input , password_question, password_answer);      
--            select "ISEQ$$_96986".currval into password_id_generated from dual; 
            SELECT max(password_id)  into password_id_generated from password;
            DBMS_OUTPUT.PUT_LINE('>>> Password id generated : ' || password_id_generated);
--            select "ISEQ$$_96989".NEXTVAL -1 into active_status_id from dual;
            select min(status_id) into active_status_id from account_status where status_description = 'Active';
            insertion.insert_account_table(display_name, email_id, phone_number, address, county, role_id, null, active_status_id, password_id_generated, plant_id);
            SELECT max(account_id) into account_id_generated from account;
--            select "ISEQ$$_97004".NEXTVAL -1 into account_id_generated from dual;
            insertion.insert_account_role_mapping_table(account_id_generated, role_id, null);
            DBMS_OUTPUT.PUT_LINE('>>> Your account-id is : ' || account_id_generated);
    END account_setup;
/

DECLARE
    role_id INT;
BEGIN
         DBMS_OUTPUT.PUT_LINE('>>> Welcome to the Oxygen management system');
         DBMS_OUTPUT.PUT_LINE('>>> Please choose role 2 for being an customer');
         DBMS_OUTPUT.PUT_LINE('>>> Please choose role 3 for being an Oxygen supplier');
         BEGIN
                IF(&role = 2) THEN
                    role_id:=2;
                    DBMS_OUTPUT.PUT_LINE('>>> Inside if block');
                    account_setup('Kiran', 'kiran.asd@gmail.com', 8908900980, 'St Mkasd, Heath Street', 'Sufflok', role_id, null, 'maari', 'favourite bird', 'parrot');
                ELSE
                     account_setup('Kiran', 'kiran.asd@gmail.com', 8908900980, 'St Mkasd, Heath Street', 'Sufflok', role_id, &plant_id, 'maari', 'favourite bird', 'parrot');

                END IF;
         END;         
END;
/

create or replace procedure login(account_id IN account.account_id%TYPE)
IS
   ip_address VARCHAR2(200):=trunc(dbms_random.value(12,256) ) || '.' || trunc(dbms_random.value(123,256) ) || '.'
    || trunc(dbms_random.value(60,256) )|| '.' || trunc(dbms_random.value(165,256) ) ;    
    BEGIN
        DBMS_OUTPUT.PUT_LINE('>>> Creating a entry in authentication config table with login time');
         insertion.insert_authentication_config(ip_address, 'America/New_York', 0, null, account_id);
    END login;
/

BEGIN
        login(&account_id);
END;
/


BEGIN
   -- Open the cursor and loop through the records
   
        DBMS_OUTPUT.PUT_LINE('>>> Below are the available plants to order. Please select from the below');
            FOR v_rec IN (select plant_id, quantity from oxygen_cylinder_details where available_status =1 group by plant_id, quantity order by plant_id) LOOP       
                dbms_output.put_line('Plant-Id=' || v_rec.plant_id || ', Quantity=' || v_rec.quantity );
            END LOOP;   
END;
/


DECLARE
    plant_id_input INT;
BEGIN
    -- If plant admin has logged in to the system
    select plant_id into plant_id_input from account where account_id = &account_id;
            dbms_output.put_line('>>> Your plant-id is :  ' || plant_id_input);  
END;
/

BEGIN
    -- If plant admin has logged in to the system
            FOR v_rec IN (select plant_id, quantity from oxygen_cylinder_details where available_status =1 and plant_id = 11 group by plant_id, quantity order by plant_id) LOOP       
                    dbms_output.put_line('Plant-Id=' || v_rec.plant_id || ', Quantity=' || v_rec.quantity );
                END LOOP; 
        dbms_output.put_line('>>> Above is the inventory ');  
END;


CREATE PROCEDURE checkout_order(account_id IN account.account_id%TYPE,
                    quantity IN NUMBER, plant_id IN NUMBER)
IS 
                
    BEGIN
        dbms_output.put_line('Inside procedure');
    END;
/

--https://stackoverflow.com/questions/46417173/generate-ip-address-in-oracle

-- select trunc(dbms_random.value(12,256) ) || '.' || trunc(dbms_random.value(123,256) ) || '.' || trunc(dbms_random.value(60,256) )|| '.' || trunc(dbms_random.value(165,256) )
--          as ip_address
--   from dual
