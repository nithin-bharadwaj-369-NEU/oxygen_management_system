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
                     account_setup('KiranSuppk', 'kiransuplierasd@gmail.com', 8900900980, 'St Peters, Heath Street', 'Sufflok', role_id, &plant_id, 'maari', 'favourite bird', 'parrot');

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
   -- Customer View the pick up a oxygen plant
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
            FOR v_rec IN (select plant_id, cylinder_id, quantity, available_status from oxygen_cylinder_details where plant_id = 2 order by plant_id) LOOP       
--                    dbms_output.put_line(v_rec.available_status);
                    dbms_output.put_line('Plant-Id=' || v_rec.plant_id || ' , Cylinder-Id=' || v_rec.cylinder_id || ' , Quantity=' || v_rec.quantity || ' , Available Status : ' || v_rec.available_status );
                END LOOP; 
        dbms_output.put_line('>>> Above is the available inventory ');  
END;


CREATE OR REPLACE PROCEDURE insert_new_cylinder_data(plant_id IN oxygen_cylinder_details.plant_id%TYPE,
                        quantity IN oxygen_cylinder_details.quantity%TYPE, 
                        available_status IN oxygen_cylinder_details.available_status%TYPE)
IS 
    BEGIN
        dbms_output.put_line('Inside insert new data procedure');
        insertion.insert_oxygen_cylinder_details(plant_id, quantity, available_status);
    END;
/

BEGIN
        insert_new_cylinder_data(2, &quantity, &status);
END;
/


BEGIN
        insertion.update_oxygen_cylinder_details(&plant_id, &cylinder_id, &status);
END;
/


-- Get the price of the cylinder for customer


DECLARE
        price_id_data int;
        current_price number;
    BEGIN
        dbms_output.put_line('>>> Customer checks out the order');
        select price_id into price_id_data from rental_price where trunc(created_on) = to_date('2021-12-14', 'YYYY-MM-DD');
            dbms_output.put_line('Price-id : ' || price_id_data);
        select  price into current_price from rental_price where price_id = price_id_data;  
        dbms_output.put_line('Current Price is at : ' || current_price || '$ Per 100 ml');
    END;
/



CREATE OR REPLACE FUNCTION calcualte_final_price(quantity in NUMBER, price IN NUMBER) 
            RETURN NUMBER IS 
               total_price NUMBER; 
            BEGIN 
                    total_price:= (quantity/100)*price ;
               RETURN total_price; 
     END; 
/

CREATE OR REPLACE PROCEDURE order_cylinder_new(county_input VARCHAR2 ,account_id_input IN account.account_id%TYPE,
                    quantity_input IN oxygen_cylinder_details.quantity%TYPE, plant_id_input IN oxygen_cylinder_details.plant_id%TYPE,
                    cylinder_id_input IN oxygen_cylinder_details.cylinder_id%TYPE,
                    covid_report_id_input IN patient_details.covid_report_id%TYPE,
                    patient_name IN patient_details.name%TYPE, patient_address IN patient_details.address%TYPE, 
                    covid_status IN patient_details.covid_status%TYPE )
IS 
        price_id_data int;
        current_price number;
        final_price number;
        final_paid_amt NUMBER;
        final_due_amt NUMBER;
        payment_method_id INT;
        transaction_id_to_use INT;
        payment_status_code INT;
    BEGIN
            dbms_output.put_line('Inside order cylinder procedure');
                select price_id into price_id_data from rental_price where trunc(created_on) = to_date('2021-12-14', 'YYYY-MM-DD');
            dbms_output.put_line('Price-id : ' || price_id_data);
                select  price into current_price from rental_price where price_id = price_id_data;  
                dbms_output.put_line('Total bill to pay : ' || current_price);
                insertion.insert_patient_details(covid_report_id_input, patient_name, patient_address, covid_status, county_input);
            dbms_output.put_line('Choose method to pay ' );

            dbms_output.put_line('>>> Possible Payment methods ');
                dbms_output.put_line('>>> Choose 1 for Credit Card ');
                dbms_output.put_line('>>> Choose 2 for Debit Card ');
                dbms_output.put_line('>>> Choose 3 for E-check ');
                dbms_output.put_line('>>> Choose 4 for Paypal ');
                payment_method_id:=1;
                final_price:=calcualte_final_price(quantity_input, current_price);
                final_paid_amt:= final_price;
                final_due_amt:=0;
            insertion.insert_renter_payment_checkout(payment_method_id, 1, 'Need the oxygen ASAP', final_paid_amt, final_due_amt);
            select max(transaction_id) into transaction_id_to_use  from renter_payment_checkout ;
              IF final_due_amt >0 THEN
                    payment_status_code:=6;
              ELSIF final_due_amt = 0 THEN    
                    payment_status_code:=1;
                END IF;
            dbms_output.put_line('>>> Payment Status Code : ' || payment_status_code);
        insertion.insert_order(account_id_input, price_id_data, transaction_id_to_use, payment_status_code, cylinder_id_input, plant_id_input, covid_report_id_input, SYSDATE, SYSDATE +15 );
        IF final_due_amt =0 THEN
            insertion.update_oxygen_cylinder_details(plant_id_input, cylinder_id_input, 0);
        END IF;
    END;
/


BEGIN
        order_cylinder_new('Sufflok', 36, 500, 1, 1, 32190110, 'Vamratha', 'pasdataksda andkj',  1);
END;
/

