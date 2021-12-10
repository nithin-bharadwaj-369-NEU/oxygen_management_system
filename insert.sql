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
    PROCEDURE insert_patient_details(covid_report_id IN patient_details.covid_report_id%TYPE,
                            name IN patient_details.name%TYPE, address IN patient_details.address%TYPE,
                            covid_status IN patient_details.covid_status%TYPE, county IN patient_details.county%TYPE);
    PROCEDURE insert_rental_price(created_on IN rental_price.created_on%TYPE,
                                                price IN rental_price.price%TYPE);
    PROCEDURE insert_account_status(status_description IN account_status.status_description%TYPE);
    PROCEDURE insert_password(acc_password IN password.password_hash%TYPE, 
                                                password_salted IN password.password_salted%TYPE,
                                                password_question IN password.password_question%TYPE
                                                );
    PROCEDURE insert_payment_method(description IN payment_method.description %TYPE);
    PROCEDURE insert_permissions_method(role_id IN permissions.role_id%TYPE,
                                            type IN permissions.type%TYPE, description  IN permissions.description%TYPE);
    PROCEDURE insert_account_table(display_name IN Account.display_name%TYPE, 
                                            email_id  IN Account.email_id%TYPE,
                                            phone_number IN Account.phone_number%TYPE,
                                            address  IN Account.address%TYPE,
                                            county IN Account.county%TYPE,
                                            role_id IN Account.role_id%TYPE,
                                            modified_by_id IN ACCOUNT.modified_by_id%TYPE,
                                            account_status_id  IN ACCOUNT.account_status_id%TYPE,
                                            password_id IN ACCOUNT.password_id%TYPE );
    PROCEDURE insert_account_role_mapping_table(account_id  IN account_role_mapping_history.account_id%TYPE,
                                            role_id  IN account_role_mapping_history.role_id%TYPE,
                                            created_by_id  IN account_role_mapping_history.created_by_id%TYPE);
   
    PROCEDURE insert_authentication_config(ip_address_value IN authentication_config.ip_address%TYPE,
                                                timezone_value IN authentication_config.time_zone_data%TYPE,
                                                logout IN authentication_config.is_logout%TYPE,
                                                logout_time IN authentication_config.logout_time%TYPE,
                                                account_id IN authentication_config.account_id%TYPE);
    
    PROCEDURE insert_renter_payment_checkout(payment_id IN renter_payment_checkout.payment_method_id%TYPE,
                                                acc_id IN renter_payment_checkout.account_id%TYPE,
                                                details_data IN  renter_payment_checkout.details%TYPE,
                                                payment_made_data IN  renter_payment_checkout.payment_made%TYPE,
                                                payment_due  IN renter_payment_checkout.payment_due%TYPE);
END INSERTION;
/

-- https://docs.oracle.com/cd/B19306_01/appdev.102/b14258/d_crypto.htm#:~:text=The%20following%20listing%20shows%20PL/SQL%20block%20encrypting%20and%20decrypting%20pre%2Ddefined%20%27input_string%27%20using%20256%2Dbit%20AES%20algorithm%20with%20Cipher%20Block%20Chaining%20and%20PKCS%235%20compliant%20padding.


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

        PROCEDURE insert_patient_details(covid_report_id IN patient_details.covid_report_id%TYPE,
                            name IN patient_details.name%TYPE, address IN patient_details.address%TYPE,
                            covid_status IN patient_details.covid_status%TYPE, county IN patient_details.county%TYPE)
            IS
            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                insert into patient_details(covid_report_id, name, address, covid_status, county)
                        VALUES (covid_report_id, name, address, covid_status, county) ;
                dbms_output.put_line('Row inserted into Patient Details table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Patient Details Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_patient_details;

        PROCEDURE insert_rental_price(created_on IN rental_price.created_on%TYPE,
                                                price IN rental_price.price%TYPE)
                IS
                BEGIN
                    dbms_output.put_line('---------------------------------------------------');
                    insert into rental_price(price_id, created_on, price)
                            VALUES (DEFAULT, created_on, price) ;
                    dbms_output.put_line('Row inserted into Rental price table');
                    dbms_output.put_line('---------------------------------------------------');
                commit;
                exception
                    when dup_val_on_index then
                       dbms_output.put_line('duplicate value found || insert different value');
                    when others then
                       dbms_output.put_line('Error while inserting data into Rental price Table');
                        rollback;
                       dbms_output.put_line('The error encountered is: ');
                       dbms_output.put_line(dbms_utility.format_error_stack);
                       dbms_output.put_line('---------------------------------------------------');
                end insert_rental_price;


         PROCEDURE insert_account_status(status_description IN account_status.status_description%TYPE)
            IS
            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                insert into account_status(STATUS_ID, status_description, created_on, updated_on)
                        VALUES (DEFAULT, status_description , DEFAULT, DEFAULT) ;
                dbms_output.put_line('Row inserted into Account status table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Account Status Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_account_status;
           
            PROCEDURE insert_password(acc_password IN password.password_hash%TYPE, 
                                                password_salted IN password.password_salted%TYPE,
                                                password_question IN password.password_question%TYPE
                                                )
            IS 
--                encrypted_password_hash_raw      RAW (2000);
--                encrypted_password_answer_hash_raw      RAW (2000);
--                num_key_bytes      NUMBER := 256/8;        -- key length 256 bits (32 bytes)
--                key_bytes_raw      RAW (32);               -- stores 256-bit encryption key
--                encryption_type    PLS_INTEGER :=          -- total encryption type
--                            DBMS_CRYPTO.ENCRYPT_AES256
--                          + DBMS_CRYPTO.CHAIN_CBC
--                          + DBMS_CRYPTO.PAD_PKCS5;

            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                   DBMS_OUTPUT.PUT_LINE ( 'Original string: ' || acc_password);

--                   encrypted_password_hash_raw := DBMS_CRYPTO.ENCRYPT
--                          (
--                             src => UTL_I18N.STRING_TO_RAW (acc_password,  'AL32UTF8'),
--                             typ => encryption_type,
--                             key => key_bytes_raw
--                          );
--                 encrypted_password_answer_hash_raw := DBMS_CRYPTO.ENCRYPT
--                          (
--                             src => UTL_I18N.STRING_TO_RAW (password_answer_hash,  'AL32UTF8'),
--                             typ => encryption_type,
--                             key => key_bytes_raw
--                          );
                insert into password(PASSWORD_ID, PASSWORD_HASH, PASSWORD_SALTED, PASSWORD_QUESTION, 
                                        created_date, updated_date) 
                        VALUES (DEFAULT, acc_password,  password_salted, PASSWORD_QUESTION, DEFAULT , DEFAULT) ;
                dbms_output.put_line('Row inserted into Password table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into PassowrdTable');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_password;
            
            
           PROCEDURE insert_payment_method(description IN payment_method.description%TYPE)
            IS 
            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                insert into payment_method(PAYMENT_METHOD_ID, description, created_on, updated_on) 
                        VALUES (DEFAULT, description , DEFAULT, DEFAULT) ;
                dbms_output.put_line('Row inserted into Payment Method table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Payment Method Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_payment_method;
            
            PROCEDURE insert_permissions_method(role_id IN permissions.role_id%TYPE,
                                            type IN permissions.type%TYPE, description  IN permissions.description%TYPE)
            IS 
            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                insert into permissions(PERMISSION_ID, ROLE_ID, TYPE, DESCRIPTION, created_on) 
                        VALUES (DEFAULT, role_id , type, description , DEFAULT) ;
                dbms_output.put_line('Row inserted into Permissions table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Permissions Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_permissions_method;
            
            PROCEDURE insert_account_table(display_name IN Account.display_name%TYPE, 
                                            email_id  IN Account.email_id%TYPE,
                                            phone_number IN Account.phone_number%TYPE,
                                            address  IN Account.address%TYPE,
                                            county IN Account.county%TYPE,
                                            role_id IN Account.role_id%TYPE,
                                            modified_by_id IN ACCOUNT.modified_by_id%TYPE,
                                            account_status_id  IN ACCOUNT.account_status_id%TYPE,
                                            password_id IN ACCOUNT.password_id%TYPE )
            IS 
            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                insert into account(ACCOUNT_ID, DISPLAY_NAME, EMAIL_ID,  ROLE_ID, PHONE_NUMBER, ADDRESS, COUNTY, created_on ,
                 MODIFIED_BY_ID, MODIFIED_ON , ACCOUNT_STATUS_ID, PASSWORD_ID) 
                    VALUES (DEFAULT, display_name, email_id, role_id, phone_number, address, county, DEFAULT, null, DEFAULT, account_status_id ,DEFAULT) ;
                dbms_output.put_line('Row inserted into Account table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Account Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_account_table;
            
            PROCEDURE insert_account_role_mapping_table(account_id  IN account_role_mapping_history.account_id%TYPE,
                                            role_id  IN account_role_mapping_history.role_id%TYPE,
                                            created_by_id  IN account_role_mapping_history.created_by_id%TYPE)
            IS 
            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                insert into account_role_mapping_history (MAPPING_ID, ACCOUNT_ID, ROLE_ID, CREATED_ON, created_by_id) 
                        VALUES (DEFAULT, account_id , role_id, DEFAULT , null) ;
                dbms_output.put_line('Row inserted into Account role mapping history table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Account role mapping history Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_account_role_mapping_table;
            
           PROCEDURE insert_authentication_config(ip_address_value IN authentication_config.ip_address%TYPE,
                                                timezone_value IN authentication_config.time_zone_data%TYPE,
                                                logout IN authentication_config.is_logout%TYPE,
                                                logout_time IN authentication_config.logout_time%TYPE,
                                                account_id IN authentication_config.account_id%TYPE)
            IS 
            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                insert into authentication_config(SESSION_ID, LOGIN_TIME, IP_ADDRESS, TIME_ZONE_DATA, IS_LOGOUT, LOGOUT_TIME , ACCOUNT_ID) 
                        VALUES (DEFAULT, DEFAULT, ip_address_value, timezone_value, logout,  null, account_id) ;
                dbms_output.put_line('Row inserted into authentication_config table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into authentication_config Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_authentication_config;
           
           PROCEDURE insert_renter_payment_checkout(payment_id IN renter_payment_checkout.payment_method_id%TYPE,
                                                acc_id IN renter_payment_checkout.account_id%TYPE,
                                                details_data IN  renter_payment_checkout.details%TYPE,
                                                payment_made_data IN  renter_payment_checkout.payment_made%TYPE,
                                                payment_due  IN renter_payment_checkout.payment_due%TYPE)
            IS 
            BEGIN
                dbms_output.put_line('---------------------------------------------------');
                insert into renter_payment_checkout(transaction_id, payment_method_id, account_id, details, payment_made, payment_due) 
                        VALUES (DEFAULT, payment_id, acc_id, details_data, payment_made_data,  payment_due) ;
                dbms_output.put_line('Row inserted into Renter Payment Checkout table');
                dbms_output.put_line('---------------------------------------------------');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Renter Payment Checkout Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('---------------------------------------------------');
            end insert_renter_payment_checkout;
           
            
    end INSERTION;
/

