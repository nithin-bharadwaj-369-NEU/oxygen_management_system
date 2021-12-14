--------------------------------------------------------- ROLE  TABLE DATA INSERTION ---------------------------------------------------------

execute insertion.insert_role('Ad@min123', 'Nithin', null);
execute insertion.insert_role('Oxygen Supplier', 'Rajesh123', 1);
execute insertion.insert_role('ITAdmin', 'Namratha', 1);

--------------------------------------------------------- Oxygen plant INSERTION ---------------------------------------------------------
execute insertion.insert_oxygen_plant_details('St Joseph', '134, Heath Street', 6176859693, 'Suffolk', 'gmailcom');
execute insertion.insert_oxygen_plant_details('HIMS123123S', '290, St Alphansous Street', 6176859691, 'MiddleSex123', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Sam Needs', '234, Gandhi Street', 6176859692, 'Norfolk1', 'josephplant@gmail.com');

--------------------------------------------------------- OXYGEN CYLINDER DETAILS INSERTION ---------------------------------------------------------

execute insertion.insert_oxygen_cylinder_details(1, 10000, 1);
execute insertion.insert_oxygen_cylinder_details(1, 275, 2);


--------------------------------------------------------- Payment Status Table INSERTION ---------------------------------------------------------

execute insertion.insert_payment_status('Cansdjk123');
execute insertion.insert_payment_status('Pen2adsg');

--------------------------------------------------------- Patient Details Table INSERTION ---------------------------------------------------------

execute insertion.insert_patient_details(34567890, 'Rafi', '567, Park street', 1, 'Suffolk1');
execute insertion.insert_patient_details(12367890, 'Rasd123avi', '27, North Station street', 12, 'Suffolk');
execute insertion.insert_patient_details(12367890, 'Rasd123avi', '27, North Station street', 0, 'Suffolk');

--------------------------------------------------------- Rental Price Table INSERTION ---------------------------------------------------------
-- TIMESTAMP format - 'DD-MM-YY HH:MM:SS.FF'

execute insertion.insert_rental_price(TIMESTAMP '10-12-21 09:26:50.12', 100000);
execute insertion.insert_rental_price(TIMESTAMP '9-12-21 09:26:50.12', 3);


--------------------------------------------------------- Account status Table INSERTION ---------------------------------------------------------

execute insertion.insert_account_status('Active123');