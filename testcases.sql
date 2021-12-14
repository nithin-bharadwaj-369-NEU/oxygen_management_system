--------------------------------------------------------- ROLE  TABLE DATA INSERTION ---------------------------------------------------------

execute insertion.insert_role('Admin123', 'Nithin', null);
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

