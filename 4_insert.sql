--Defined steps before creating Packages



--1) Create Package Specs
--2) Create Package Body.


--DROP PACKAGE INSERTION;

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
    PROCEDURE update_oxygen_cylinder_details(plant_id_input IN oxygen_cylinder_details.plant_id%TYPE,
                            cylinder_id_input in oxygen_cylinder_details.cylinder_id%TYPE, 
                            available_status_data IN oxygen_cylinder_details.available_status%TYPE);
    PROCEDURE insert_payment_status(status_description  IN payment_status.status_description%TYPE);
    PROCEDURE insert_patient_details(covid_report_id IN patient_details.covid_report_id%TYPE,
                            name IN patient_details.name%TYPE, address IN patient_details.address%TYPE,
                            covid_status IN patient_details.covid_status%TYPE, county IN patient_details.county%TYPE);
    PROCEDURE insert_rental_price(created_on IN rental_price.created_on%TYPE,
                                                price IN rental_price.price%TYPE);
    PROCEDURE insert_account_status(status_description IN account_status.status_description%TYPE);
    PROCEDURE insert_password(acc_password IN VARCHAR2,
                                                password_question IN password.password_question%TYPE,
                                                password_answer_hash IN VARCHAR2
                                                );
    FUNCTION encrypt_password(cp_string in varchar2) RETURN RAW;
    FUNCTION string_salted(cp_string in varchar2) RETURN varchar2;
    FUNCTION validate_email(cp_string in varchar2) RETURN NUMBER;

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
                                            password_id IN ACCOUNT.password_id%TYPE,
                                            plant_id IN ACCOUNT.plant_id%TYPE);
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
    PROCEDURE insert_order(acc_id IN orders.account_id%TYPE,
                                            rental_price_id IN orders.rental_price_id%TYPE,
                                            transaction_process_id IN orders.transaction_id%TYPE,
                                            pay_status_code IN orders.payment_status_code%TYPE,
                                            cylinder_id  IN  orders.cylinder_id%TYPE,
                                            plant_id  IN orders.plant_id%TYPE,
                                            covid_report_id IN orders.covid_report_id%TYPE,
                                            booked_date_d  IN orders.booked_date%TYPE,
                                            booking_end_date_d IN orders.booking_end_date%TYPE);

END INSERTION;
/

-- https://docs.oracle.com/cd/B19306_01/appdev.102/b14258/d_crypto.htm#:~:text=The%20following%20listing%20shows%20PL/SQL%20block%20encrypting%20and%20decrypting%20pre%2Ddefined%20%27input_string%27%20using%20256%2Dbit%20AES%20algorithm%20with%20Cipher%20Block%20Chaining%20and%20PKCS%235%20compliant%20padding.


CREATE OR REPLACE PACKAGE BODY INSERTION
    AS
         PROCEDURE INSERT_ROLE(role_description in role.role_description%TYPE,
        display_name in role.display_name%TYPE,
        CREATED_BY_ID in role.created_by_id%TYPE)
        IS
            check_if_number_role_desc NUMBER;
            check_if_number_display_name NUMBER;
            description_invalid EXCEPTION;
            PRAGMA exception_init( description_invalid, -20004 ); --User defined exception  ORA-20000 through ORA-20999
            display_name_invalid EXCEPTION;
            PRAGMA exception_init( display_name_invalid, -20005 );
            role_invalid EXCEPTION;
            PRAGMA exception_init( role_invalid, -20006 );

        BEGIN
            dbms_output.put_line('--/\***/\--');
            -- Checking if number is present in role description and display name
            select REGEXP_INSTR(role_description, '[[:digit:]/@&#$%*(]') into check_if_number_role_desc from dual;
            select REGEXP_INSTR(display_name, '[[:digit:]/@&#$%*(]') into check_if_number_display_name from dual;
            IF (check_if_number_role_desc > 0 ) THEN
                    dbms_output.put_line('Role description has numbers. Please remove them');
                    raise_application_error(-20004,'Invalid Description Entered');
                ELSE
                    dbms_output.put_line('Entered valid Role description');
                END IF;

            IF (check_if_number_display_name > 0 ) THEN
                    dbms_output.put_line('Display name has numbers. Please remove them');
                    raise_application_error(-20005,'Invalid DIsplay name Entered');
                ELSE
                    dbms_output.put_line('Entered valid Display name');
                END IF;

             --Checking if role entered is in Customer, Admin and OxygenPlant
                IF (role_description ='Customer' or  role_description ='Oxygen Supplier' or role_description ='Admin') THEN
                    dbms_output.put_line('Entered valid Role');
                ELSE
                    raise_application_error(-20006,'Invalid Role Entered');
                END IF;

            insert into ROLE(ROLE_ID, ROLE_DESCRIPTION, DISPLAY_NAME,
                                    CREATED_BY_ID,CREATED_ON) VALUES (DEFAULT, role_description, display_name, created_by_id, DEFAULT) ;
            dbms_output.put_line('Row inserted into role table');
            dbms_output.put_line('--/\***/\--');
        commit;
        exception
            when dup_val_on_index then
               dbms_output.put_line('duplicate value found || insert different value');
            when others then
               dbms_output.put_line('Error while inserting data into ROLE Table');
                rollback;
               dbms_output.put_line('The error encountered is: ');
               dbms_output.put_line(dbms_utility.format_error_stack);
               dbms_output.put_line('--/\***/\--');
        end INSERT_ROLE;

        FUNCTION validate_email(cp_string in varchar2)
            RETURN NUMBER IS
               b_isvalid   BOOLEAN;
            BEGIN
                  b_isvalid :=REGEXP_LIKE (cp_string,'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');
                    dbms_output.put_line(sys.diutil.bool_to_int(b_isvalid));
               RETURN sys.diutil.bool_to_int(b_isvalid);
            END;


        PROCEDURE insert_oxygen_plant_details(name in oxygen_cylinder_plant.name%TYPE,
        address in oxygen_cylinder_plant.address%TYPE, phone_number in oxygen_cylinder_plant.phone_number%TYPE,
        county in oxygen_cylinder_plant.county%TYPE, email_id in oxygen_cylinder_plant.EMAIL_ID%TYPE)
        IS
             invalid_input_data EXCEPTION;
            PRAGMA exception_init( invalid_input_data, -20007 );
            invalid_mail_entered EXCEPTION;
            PRAGMA exception_init( invalid_mail_entered, -20008);
            validate_email_data NUMBER;
            validate_plant_name NUMBER;
            validate_county NUMBER;
        BEGIN
            dbms_output.put_line('--/\***/\--');
            select validate_email(email_id) into validate_email_data from dual;
            select REGEXP_INSTR(name, '[[:digit:]/@&#$%*(]') into validate_plant_name from dual;
            select REGEXP_INSTR(county, '[[:digit:]/@&#$%*(]') into validate_county from dual;

            IF (validate_plant_name > 0 ) THEN
                    dbms_output.put_line('Plant  name has numbers. Please remove them');
                    raise_application_error(-20007,'Invalid Plant Name has been entered');
                ELSE
                    dbms_output.put_line('Entered valid Plant name');
                END IF;

            IF (validate_county > 0 ) THEN
                    dbms_output.put_line('Entered county has numbers. Please remove them');
                    raise_application_error(-20007,'Invalid county has been entered');
                ELSE
                    dbms_output.put_line('Entered valid County name');
                END IF;

            IF (validate_email_data = 1 ) THEN
                    dbms_output.put_line('Valid email-id is entered.');
                ELSE
                    raise_application_error(-20008, 'Invalid mail-id is entered');
                END IF;

            insert into oxygen_cylinder_plant(PLANT_ID, NAME, ADDRESS, PHONE_NUMBER, COUNTY, EMAIL_ID,
                                    CREATED_ON, UPDATED_ON) VALUES (DEFAULT, name, address, phone_number, county, email_id, DEFAULT, DEFAULT) ;
            dbms_output.put_line('Row inserted into oxygen cylinder plant table');
            dbms_output.put_line('--/\***/\--');
        commit;
        exception
            when dup_val_on_index then
               dbms_output.put_line('duplicate value found || insert different value');
            when others then
               dbms_output.put_line('Error while inserting data into OXygen Cylidner Plant Table');
                rollback;
               dbms_output.put_line('The error encountered is: ');
               dbms_output.put_line(dbms_utility.format_error_stack);
               dbms_output.put_line('--/\***/\--');
        end insert_oxygen_plant_details;

         FUNCTION encrypt_password(cp_string in varchar2)
            RETURN RAW IS
               enc_string RAW (2000);
            BEGIN
               select
             DBMS_CRYPTO.encrypt(utl_raw.cast_to_raw(cp_string), 4353 /* = dbms_crypto.DES_CBC_PKCS5 */, 'A1A2A3A4A5A6CAFE')
             into enc_string from dual;
                DBMS_OUTPUT.PUT_LINE ('Encrypted string: ' || enc_string);
               RETURN enc_string;
            END;


            FUNCTION string_salted(cp_string in varchar2)
            RETURN varchar2 IS
               salt_string varchar2(2000);

            BEGIN
               select  concat(cp_string, 'asd213')  into salt_string from dual;
                DBMS_OUTPUT.PUT_LINE ('Salted string: ' || salt_string);
               RETURN salt_string;
            END;



        PROCEDURE insert_oxygen_cylinder_details(plant_id IN oxygen_cylinder_details.plant_id%TYPE,
                            quantity in oxygen_cylinder_details.quantity%TYPE, available_status IN oxygen_cylinder_details.available_status%TYPE)
            IS
                invalid_data_entered EXCEPTION;
                PRAGMA exception_init( invalid_data_entered, -20009);

            BEGIN
                IF (available_status = 0 or available_status = 1 ) THEN
                    dbms_output.put_line('Entered valid available status');
                ELSE
                        raise_application_error(-20009, 'Invalid Available status is entered');
                END IF;

                IF (quantity < 100 or quantity > 2000 ) THEN
                    dbms_output.put_line('Entered Invalid oxygen cylinder quantity');
                    raise_application_error(-20009, 'Invalid Quantity status is entered');
                ELSE
                    dbms_output.put_line('Entered Valid oxygen cylinder quantity');
                END IF;

                dbms_output.put_line('--/\***/\--');
                insert into oxygen_cylinder_details(CYLINDER_ID, PLANT_ID, quantity, available_status,
                                        CREATED_ON, UPDATED_ON) VALUES (DEFAULT, plant_id, quantity, available_status, DEFAULT, DEFAULT) ;
                dbms_output.put_line('Row inserted into oxygen cylinder details table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into OXygen Cylidner details Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_oxygen_cylinder_details;


        PROCEDURE update_oxygen_cylinder_details(plant_id_input IN oxygen_cylinder_details.plant_id%TYPE,
                            cylinder_id_input in oxygen_cylinder_details.cylinder_id%TYPE, 
                            available_status_data IN oxygen_cylinder_details.available_status%TYPE)
            IS
                invalid_data_entered EXCEPTION;
                PRAGMA exception_init( invalid_data_entered, -20009);
                check_plant_input INT;
                check_cylinder_input INT;
            BEGIN
                IF (available_status_data = 0 or available_status_data = 1 ) THEN
                    dbms_output.put_line('Entered valid available status');
                ELSE
                        raise_application_error(-20009, 'Invalid Available status is entered');
                END IF;
                select REGEXP_INSTR(plant_id_input, '[[:digit:]]') into check_plant_input from dual;
                select REGEXP_INSTR(cylinder_id_input, '[[:digit:]]') into check_cylinder_input from dual;
    
                IF (check_plant_input =0 ) THEN
                    dbms_output.put_line('Entered Invalid Plant id is entered');
                    raise_application_error(-20009, 'Invalid Plant id is entered');
                ELSE
                    dbms_output.put_line('Entered Valid Plant id is entered');
                END IF;
                
                IF (check_cylinder_input =0 ) THEN
                    dbms_output.put_line('Entered Invalid Cylinder id is entered');
                    raise_application_error(-20009, 'Invalid Cylinder id is entered');
                ELSE
                    dbms_output.put_line('Entered Valid Cylinder id is entered');
                END IF;
                
                dbms_output.put_line('--/\***/\--');
                update oxygen_cylinder_details
                set available_status = available_status_data
                where plant_id = plant_id_input and cylinder_id = cylinder_id_input;

                dbms_output.put_line('Updated Cylinder status in oxygen cylinder details table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while updating data into OXygen Cylidner details Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end update_oxygen_cylinder_details;



        PROCEDURE insert_payment_status(status_description IN payment_status.status_description%TYPE)
            IS
                check_status_description NUMBER;
                description_invalid EXCEPTION;
                PRAGMA exception_init( description_invalid, -20010 ); --User defined exception  ORA-20000 through ORA-20999
            BEGIN
                    select REGEXP_INSTR(status_description, '[[:digit:]/@&#$%*(]') into check_status_description from dual;
                    IF (check_status_description > 0 ) THEN
                        dbms_output.put_line('Payment description has numbers. Please remove them');
                        raise_application_error(-20010,'Invalid Description Entered');
                    ELSE
                        dbms_output.put_line('Entered valid Payment description');
                    END IF;

                dbms_output.put_line('--/\***/\--');
                insert into payment_status(PAYMENT_STATUS_CODE, status_description, created_on)
                        VALUES (DEFAULT, status_description , DEFAULT) ;
                dbms_output.put_line('Row inserted into Payment status table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Payment Status Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_payment_status;

            PROCEDURE insert_patient_details(covid_report_id IN patient_details.covid_report_id%TYPE,
                            name IN patient_details.name%TYPE, address IN patient_details.address%TYPE,
                            covid_status IN patient_details.covid_status%TYPE, county IN patient_details.county%TYPE)
            IS
                description_invalid EXCEPTION;
                PRAGMA exception_init( description_invalid, -20011 ); --User defined exception  ORA-20000 through ORA-20999
                invalid_covid_status_entered EXCEPTION;
                PRAGMA exception_init( invalid_covid_status_entered, -20012);

                check_name_validation NUMBER;
                check_county_validation NUMBER;

            BEGIN
                dbms_output.put_line('--/\***/\--');
                -- Checking if number is present in role description and display name
                select REGEXP_INSTR(name, '[[:digit:]/@&#$%*(]') into check_name_validation from dual;
                select REGEXP_INSTR(county, '[[:digit:]]') into check_county_validation from dual;

                IF (check_name_validation > 0 ) THEN
                    dbms_output.put_line('Patient Name has numbers. Please remove them');
                    raise_application_error(-20011,'Invalid Patient Name Entered');
                ELSE
                    dbms_output.put_line('Entered valid Patient Name');
                END IF;

                IF (check_county_validation > 0 ) THEN
                        dbms_output.put_line('County has numbers. Please remove them');
                    raise_application_error(-20011,'Invalid County name Entered');
                ELSE
                    dbms_output.put_line('Entered valid County name');
                END IF;

                IF (covid_status = 0 or covid_status = 1 ) THEN
                    dbms_output.put_line('Entered valid covid status');
                ELSE
                        raise_application_error(-20012, 'Invalid Covid status is entered');
                END IF;

                insert into patient_details(covid_report_id, name, address, covid_status, county)
                        VALUES (covid_report_id, name, address, covid_status, county) ;
                dbms_output.put_line('Row inserted into Patient Details table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Patient Details Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_patient_details;

        PROCEDURE insert_rental_price(created_on IN rental_price.created_on%TYPE,
                                                price IN rental_price.price%TYPE)
                IS
                    invalid_data_entered EXCEPTION;
                    PRAGMA exception_init( invalid_data_entered, -20013);

                BEGIN
                    dbms_output.put_line('--/\***/\--');
                            IF (price < 10 or price > 10000 ) THEN
                                dbms_output.put_line('Entered Invalid oxygen cylinder price');
                                raise_application_error(-20013, 'Invalid Quantity price is entered');
                            ELSE
                                dbms_output.put_line('Entered Valid oxygen cylinder price');
                            END IF;

                    insert into rental_price(price_id, created_on, price)
                            VALUES (DEFAULT, created_on, price) ;
                    dbms_output.put_line('Row inserted into Rental price table');
                    dbms_output.put_line('--/\***/\--');
                commit;
                exception
                    when dup_val_on_index then
                       dbms_output.put_line('duplicate value found || insert different value');
                    when others then
                       dbms_output.put_line('Error while inserting data into Rental price Table');
                        rollback;
                       dbms_output.put_line('The error encountered is: ');
                       dbms_output.put_line(dbms_utility.format_error_stack);
                       dbms_output.put_line('--/\***/\--');
                end insert_rental_price;


         PROCEDURE insert_account_status(status_description IN account_status.status_description%TYPE)
            IS
                check_desc NUMBER;
                description_invalid EXCEPTION;
                PRAGMA exception_init( description_invalid, -20014 ); --User defined exception  ORA-20000 through ORA-20999

            BEGIN
                dbms_output.put_line('--/\***/\--');
                select REGEXP_INSTR(status_description, '[[:digit:]/@&#$%*(]') into check_desc from dual;
                    IF (check_desc > 0 ) THEN
                        dbms_output.put_line('Account status description has numbers. Please remove them');
                        raise_application_error(-20014,'Invalid Description Entered');
                    ELSE
                        dbms_output.put_line('Entered valid description');
                    END IF;

                insert into account_status(STATUS_ID, status_description, created_on, updated_on)
                        VALUES (DEFAULT, status_description , DEFAULT, DEFAULT) ;
                dbms_output.put_line('Row inserted into Account status table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Account Status Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_account_status;

            PROCEDURE insert_password(acc_password IN VARCHAR2,
                                                password_question IN password.password_question%TYPE,
                                                password_answer_hash IN VARCHAR2
                                                )
            IS
                enc_string_password RAW (2000);
                 enc_string_answer RAW (2000);
                 salted_password varchar2(1000);
            BEGIN
                dbms_output.put_line('--/\***/\--');
                   DBMS_OUTPUT.PUT_LINE ( 'Original string: ' || acc_password);
                   select encrypt_password(acc_password) into enc_string_password from dual;
                   select encrypt_password(password_answer_hash) into enc_string_answer from dual;
                   select string_salted(acc_password) into salted_password from dual;

                insert into password(PASSWORD_ID, PASSWORD_HASH, PASSWORD_SALTED, PASSWORD_QUESTION, passsword_answer_hash,
                                        created_date, updated_date)
                        VALUES (DEFAULT, enc_string_password,  salted_password, PASSWORD_QUESTION, enc_string_answer, DEFAULT , DEFAULT) ;
                dbms_output.put_line('Row inserted into Password table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into PassowrdTable');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_password;


           PROCEDURE insert_payment_method(description IN payment_method.description%TYPE)
            IS
                check_desc NUMBER;
                description_invalid EXCEPTION;
                PRAGMA exception_init( description_invalid, -20015 ); --User defined exception  ORA-20000 through ORA-20999

            BEGIN
                dbms_output.put_line('--/\***/\--');
                select REGEXP_INSTR(description, '[[:digit:]/@&#$%*(]') into check_desc from dual;
                IF (check_desc > 0 ) THEN
                    dbms_output.put_line('Payment description has numbers. Please remove them');
                    raise_application_error(-20015,'Invalid Payment Description Entered');
                ELSE
                    dbms_output.put_line('Entered valid Payment description');
                END IF;

                insert into payment_method(PAYMENT_METHOD_ID, description, created_on, updated_on)
                        VALUES (DEFAULT, description , DEFAULT, DEFAULT) ;
                dbms_output.put_line('Row inserted into Payment Method table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Payment Method Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_payment_method;

            PROCEDURE insert_permissions_method(role_id IN permissions.role_id%TYPE,
                    type IN permissions.type%TYPE, description IN permissions.description%TYPE)
                IS
                    invalid_input_data EXCEPTION;
                    PRAGMA exception_init( invalid_input_data, -20021 );
                    invalid_pdescription_entered EXCEPTION;
                    PRAGMA exception_init( invalid_pdescription_entered, -20022);
                    validate_permission_description NUMBER;
                BEGIN
                    dbms_output.put_line('--/\***/\--');
                    select REGEXP_INSTR(description, '[[:digit:]/@&#$%*(]') into validate_permission_description from dual;

                    IF (type <> 'ADM' or type <> 'CUST' or type <> 'SUP') THEN
                        dbms_output.put_line(' Type is invalid. Please enter correct permission type.');
                        raise_application_error(-20021,'Invalid permission type has been entered');
                    ELSE
                        dbms_output.put_line('Entered valid Permission type name');
                    END IF;

                    IF (validate_permission_description > 0 ) THEN
                        dbms_output.put_line('Entered description has numbers. Please remove them');
                        raise_application_error(-20022,'Invalid description has been entered');
                    ELSE
                       dbms_output.put_line('Entered valid County name');
                    END IF;

                        insert into permissions(PERMISSION_ID, ROLE_ID, TYPE, DESCRIPTION, created_on)
                        VALUES (DEFAULT, role_id , type, description , DEFAULT) ;
                        dbms_output.put_line('Row inserted into Permissions table');
                        dbms_output.put_line('--/\***/\--');
                        commit;
                    exception
                        when dup_val_on_index then
                            dbms_output.put_line('duplicate value found || insert different value');
                        when others then
                            dbms_output.put_line('Error while inserting data into Permissions Table');
                        rollback;
                        dbms_output.put_line('The error encountered is: ');
                        dbms_output.put_line(dbms_utility.format_error_stack);
                        dbms_output.put_line('--/\***/\--');
            end insert_permissions_method;

            PROCEDURE insert_account_table(display_name IN Account.display_name%TYPE,
                                            email_id  IN Account.email_id%TYPE,
                                            phone_number IN Account.phone_number%TYPE,
                                            address  IN Account.address%TYPE,
                                            county IN Account.county%TYPE,
                                            role_id IN Account.role_id%TYPE,
                                            modified_by_id IN ACCOUNT.modified_by_id%TYPE,
                                            account_status_id  IN ACCOUNT.account_status_id%TYPE,
                                            password_id IN ACCOUNT.password_id%TYPE,
                                            plant_id IN ACCOUNT.plant_id%TYPE)
            IS
                check_if_number_name NUMBER;
                check_role_id NUMBER;
                check_password_id NUMBER;
                validate_email_data NUMBER;
                role_invalid EXCEPTION;
                PRAGMA exception_init( role_invalid, -20017 ); --User defined exception  ORA-20000 through ORA-20999
                invalid_data_input EXCEPTION;
                PRAGMA exception_init( invalid_data_input, -20018 ); --User defined exception  ORA-20000 through ORA-20999

            BEGIN
                dbms_output.put_line('--/\***/\--');
                select REGEXP_INSTR(display_name, '[[:digit:]/@&#$%*(]') into check_if_number_name from dual;
                select validate_email(email_id) into validate_email_data from dual;
                -- Checking if the role-id exists
                select case when cnt > 0 then 1
                            else 0 end into check_role_id
                            from(
                        select count(role_id) as cnt from role where role_id = role_id
                        );
                dbms_output.put_line('check_role_id : ' || check_role_id);

                IF (check_role_id > 0 ) THEN
                    dbms_output.put_line('Valid Role-id has been entered');
                ELSE
                    raise_application_error(-20017,'Invalid Role Entered');
                END IF;

                IF (check_if_number_name > 0 ) THEN
                    raise_application_error(-20018,'Invalid Display name Entered');
                ELSE
                    dbms_output.put_line( 'Valid display name entered');
                END IF;

                IF (validate_email_data = 1 ) THEN
                    dbms_output.put_line('Valid email-id is entered.');
                ELSE
                    raise_application_error(-20018, 'Invalid Email is entered');
                END IF;

                insert into account(ACCOUNT_ID, DISPLAY_NAME, EMAIL_ID,  ROLE_ID, PHONE_NUMBER, ADDRESS, COUNTY, created_on ,
                 MODIFIED_BY_ID, MODIFIED_ON , ACCOUNT_STATUS_ID, PASSWORD_ID, PLANT_ID)
                    VALUES (DEFAULT, display_name, email_id, role_id, phone_number, address, county, DEFAULT, null, DEFAULT, account_status_id , password_id, plant_id) ;
                dbms_output.put_line('Row inserted into Account table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Account Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_account_table;

            PROCEDURE insert_account_role_mapping_table(account_id  IN account_role_mapping_history.account_id%TYPE,
                                            role_id  IN account_role_mapping_history.role_id%TYPE,
                                            created_by_id  IN account_role_mapping_history.created_by_id%TYPE)
            IS
                check_role_id NUMBER;
                check_account_id NUMBER;
                role_invalid EXCEPTION;
                PRAGMA exception_init( role_invalid, -20019 ); --User defined exception  ORA-20000 through ORA-20999
                account_invalid EXCEPTION;
                PRAGMA exception_init( role_invalid, -20020 ); --User defined exception  ORA-20000 through ORA-20999
            BEGIN
                dbms_output.put_line('--/\***/\--');
                -- Checking if the role-id exists
                    select case when cnt > 0 then 1
                            else 0 end into check_role_id
                            from(
                        select count(role_id) as cnt from role where role_id = role_id
                        );

                IF (check_role_id > 0 ) THEN
                    dbms_output.put_line('Valid Role-id has been entered');
                ELSE
                    raise_application_error(-20019,'Invalid Role Entered');
                END IF;

                -- Checking if the account-id exists
                    select case when cnt > 0 then 1
                            else 0 end into check_account_id
                            from(
                        select count(account_id) as cnt from account where account_id = account_id
                        );

                IF (check_account_id > 0 ) THEN
                    dbms_output.put_line('Valid Account-id has been entered');
                ELSE
                    raise_application_error(-20020,'Invalid Account Entered');
                END IF;


                insert into account_role_mapping_history (MAPPING_ID, ACCOUNT_ID, ROLE_ID, CREATED_ON, created_by_id)
                        VALUES (DEFAULT, account_id , role_id, DEFAULT , null) ;
                dbms_output.put_line('Row inserted into Account role mapping history table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Account role mapping history Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_account_role_mapping_table;

           PROCEDURE insert_authentication_config(ip_address_value IN authentication_config.ip_address%TYPE,
                                                timezone_value IN authentication_config.time_zone_data%TYPE,
                                                logout IN authentication_config.is_logout%TYPE,
                                                logout_time IN authentication_config.logout_time%TYPE,
                                                account_id IN authentication_config.account_id%TYPE)
            IS
                check_account_id NUMBER;
                id_invalid EXCEPTION;
                PRAGMA exception_init( id_invalid, -20017 ); --User defined exception  ORA-20000 through ORA-20999

            BEGIN
                dbms_output.put_line('--/\***/\--');
                    select case when cnt > 0 then 1
                            else 0 end into check_account_id
                            from(
                        select count(account_id) as cnt from account where account_id = account_id
                        );
                dbms_output.put_line('Check account Id : ' || check_account_id);

                IF (check_account_id > 0 ) THEN
                    dbms_output.put_line('Valid Account-id has been entered');
                ELSE
                    raise_application_error(-20017,'Invalid Account Entered');
                END IF;

                insert into authentication_config(SESSION_ID, LOGIN_TIME, IP_ADDRESS, TIME_ZONE_DATA, IS_LOGOUT, LOGOUT_TIME , ACCOUNT_ID)
                        VALUES (DEFAULT, DEFAULT, ip_address_value, timezone_value, logout,  null, account_id) ;
                dbms_output.put_line('Row inserted into authentication_config table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into authentication_config Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_authentication_config;

           PROCEDURE insert_renter_payment_checkout(payment_id IN renter_payment_checkout.payment_method_id%TYPE,
                                                acc_id IN renter_payment_checkout.account_id%TYPE,
                                                details_data IN  renter_payment_checkout.details%TYPE,
                                                payment_made_data IN  renter_payment_checkout.payment_made%TYPE,
                                                payment_due  IN renter_payment_checkout.payment_due%TYPE)
            IS
                check_account_id NUMBER;
                id_invalid EXCEPTION;
                PRAGMA exception_init( id_invalid, -20017 ); --User defined exception  ORA-20000 through ORA-20999
            BEGIN
                dbms_output.put_line('--/\***/\--');
                        select case when cnt > 0 then 1
                            else 0 end into check_account_id
                            from(
                        select count(account_id) as cnt from account where account_id = acc_id
                        );
                dbms_output.put_line('Check account Id : ' || check_account_id);

                IF (check_account_id > 0 ) THEN
                    dbms_output.put_line('Valid Account-id has been entered');
                ELSE
                    raise_application_error(-20017,'Invalid Account Entered');
                END IF;

                insert into renter_payment_checkout(transaction_id, payment_method_id, account_id, details, payment_made, payment_due)
                        VALUES (DEFAULT, payment_id, acc_id, details_data, payment_made_data,  payment_due) ;
                dbms_output.put_line('Row inserted into Renter Payment Checkout table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Renter Payment Checkout Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_renter_payment_checkout;

            PROCEDURE insert_order(acc_id IN orders.account_id%TYPE,
                                            rental_price_id IN orders.rental_price_id%TYPE,
                                            transaction_process_id IN orders.transaction_id%TYPE,
                                            pay_status_code IN orders.payment_status_code%TYPE,
                                            cylinder_id  IN  orders.cylinder_id%TYPE,
                                            plant_id  IN orders.plant_id%TYPE,
                                            covid_report_id IN orders.covid_report_id%TYPE,
                                            booked_date_d  IN orders.booked_date%TYPE,
                                            booking_end_date_d IN orders.booking_end_date%TYPE)
            IS
                check_account_id NUMBER;
                id_invalid EXCEPTION;
                PRAGMA exception_init( id_invalid, -20017 ); --User defined exception  ORA-20000 through ORA-20999

            BEGIN
                dbms_output.put_line('--/\***/\--');
                     select case when cnt > 0 then 1
                            else 0 end into check_account_id
                            from(
                        select count(account_id) as cnt from account where account_id = acc_id
                        );
                dbms_output.put_line('Check account Id : ' || check_account_id);

                IF (check_account_id > 0 ) THEN
                    dbms_output.put_line('Valid Account-id has been entered');
                ELSE
                    raise_application_error(-20017,'Invalid Account Entered');
                END IF;

                insert into orders(order_id, account_id, rental_price_id, transaction_id, payment_status_code, cylinder_id, plant_id , covid_report_id,
                                    booked_date, booking_end_date )
                        VALUES (DEFAULT, acc_id, rental_price_id, transaction_process_id, pay_status_code, cylinder_id, plant_id, covid_report_id,
                                    booked_date_d, booking_end_date_d ) ;
                dbms_output.put_line('Row inserted into Orders table');
                dbms_output.put_line('--/\***/\--');
            commit;
            exception
                when dup_val_on_index then
                   dbms_output.put_line('duplicate value found || insert different value');
                when others then
                   dbms_output.put_line('Error while inserting data into Orders Table');
                    rollback;
                   dbms_output.put_line('The error encountered is: ');
                   dbms_output.put_line(dbms_utility.format_error_stack);
                   dbms_output.put_line('--/\***/\--');
            end insert_order;

    end INSERTION;
/
