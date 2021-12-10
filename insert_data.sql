

--------------------------------------------------------- ROLE  TABLE DATA INSERTION ---------------------------------------------------------

execute insertion.insert_role('Manager', 'Nithin', null);
execute insertion.insert_role('Employee', 'Rajesh', 1);


--------------------------------------------------------- OXYGEN CYLINDER PLANT INSERTION ---------------------------------------------------------

execute insertion.insert_oxygen_plant_details('St Joseph', '134, Heath Street', 6176859693, 'Suffolk', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('HIMSS', '290, St Alphansous Street', 6176859691, 'MiddleSex', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Sam Needs', '234, Gandhi Street', 6176859692, 'Norfolk', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('John Clinic', '934, Peters Street', 6176859694, 'Suffolk', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Tim International Hospital', '214, Roxbury Street', 6176859695, 'Suffolk', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Scott Multispeciality', '224, Boylston Street', 6176859696, 'Franklin', 'josephplant@gmail.com');

--------------------------------------------------------- OXYGEN CYLINDER DETAILS INSERTION ---------------------------------------------------------

execute insertion.insert_oxygen_cylinder_details(1, 500, 1);
execute insertion.insert_oxygen_cylinder_details(2, 500, 1);
execute insertion.insert_oxygen_cylinder_details(3, 500, 1);
execute insertion.insert_oxygen_cylinder_details(4, 500, 1);
execute insertion.insert_oxygen_cylinder_details(5, 500, 1);
execute insertion.insert_oxygen_cylinder_details(6, 500, 1);
execute insertion.insert_oxygen_cylinder_details(4, 400, 1);
execute insertion.insert_oxygen_cylinder_details(5, 100, 1);
execute insertion.insert_oxygen_cylinder_details(6, 200, 1);
execute insertion.insert_oxygen_cylinder_details(2, 300, 1);
execute insertion.insert_oxygen_cylinder_details(3, 500, 1);


--------------------------------------------------------- Payment Status Table INSERTION ---------------------------------------------------------

execute insertion.insert_payment_status('Complete');
execute insertion.insert_payment_status('Pending');
execute insertion.insert_payment_status('Failed');
execute insertion.insert_payment_status('Refunded');
execute insertion.insert_payment_status('Cancelled');


--------------------------------------------------------- Patient Details Table INSERTION ---------------------------------------------------------

execute insertion.insert_patient_details(34567890, 'Rafi', '567, Park street', 1, 'Suffolk');
execute insertion.insert_patient_details(12367890, 'Ravi', '27, North Station street', 1, 'Suffolk');


--------------------------------------------------------- Rental Price Table INSERTION ---------------------------------------------------------
-- TIMESTAMP format - 'DD-MM-YY HH:MM:SS.FF'
execute insertion.insert_rental_price(TIMESTAMP '10-12-21 09:26:50.12', 200);
execute insertion.insert_rental_price(TIMESTAMP '10-11-21 09:26:50.12', 70);
execute insertion.insert_rental_price(TIMESTAMP '10-10-21 09:26:50.12', 100);
execute insertion.insert_rental_price(TIMESTAMP '10-09-21 09:26:50.12', 20);
execute insertion.insert_rental_price(TIMESTAMP '10-08-21 09:26:50.12', 20);
execute insertion.insert_rental_price(TIMESTAMP '10-07-21 09:26:50.12', 30);
execute insertion.insert_rental_price(TIMESTAMP '10-06-21 09:26:50.12', 20);
execute insertion.insert_rental_price(TIMESTAMP '10-05-21 09:26:50.12', 20);

--insert into rental_price VALUES(DEFAULT, TIMESTAMP '2021-01-31 09:26:50.12', 200.0);


--------------------------------------------------------- Account status Table INSERTION ---------------------------------------------------------

execute insertion.insert_account_status('Active');
execute insertion.insert_account_status('Suspended');
execute insertion.insert_account_status('Deleted');

--------------------------------------------------------- Payment  MethodTable INSERTION ---------------------------------------------------------

execute insertion.insert_payment_method('Credit Card');
execute insertion.insert_payment_method('Debit Card');
execute insertion.insert_payment_method('eCheck');
execute insertion.insert_payment_method('Paypal');

------------------------------------------------------------ Password Method Table insertion----------------------------------------------------------

execute insertion.insert_password('dmdddmdd', 'dmdddmdd2133', 'when is birthday');
