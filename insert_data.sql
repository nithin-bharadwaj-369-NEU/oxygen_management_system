

--------------------------------------------------------- ROLE  TABLE DATA INSERTION ---------------------------------------------------------

execute insertion.insert_role('Admin', 'Nithin', null);
execute insertion.insert_role('Oxygen Supplier', 'Rajesh', 1);
execute insertion.insert_role('Customer', 'Namratha', 1);
execute insertion.insert_role('Customer', 'Sai', 1);
execute insertion.insert_role('Oxygen Supplier', 'Liam', 1);
execute insertion.insert_role('Customer', 'Akanksha', 1);

--------------------------------------------------------- OXYGEN CYLINDER PLANT INSERTION ---------------------------------------------------------


execute insertion.insert_oxygen_plant_details('St Joseph', '134, Heath Street', 6176859693, 'Suffolk', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('HIMSS', '290, St Alphansous Street', 6176859691, 'MiddleSex', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Sam Needs', '234, Gandhi Street', 6176859692, 'Norfolk', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('John Clinic', '934, Peters Street', 6176859694, 'Suffolk', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Tim International Plant', '214, Roxbury Street', 6176859695, 'Suffolk', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Scott Oxygen Plant', '224, Boylston Street', 6176859696, 'Franklin', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Boston Medicity', '197, Heath Street', 6176854567, 'Worcester', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('HITAM Multispeciality Life support', '111, Mission Hill', 6177459696, 'Norfolk', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Apollo', '881, Boylston Street', 6176859696, 'Franklin', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Kamineni Plant', '179, Rose Street', 6145336790, 'Nantucket', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Miracle Clinic', '120, Longwood', 6111159696, 'Norfolk', 'josephplant@gmail.com');
execute insertion.insert_oxygen_plant_details('Hope Life Support', '179, Copley', 6145201790, 'Nantucket', 'josephplant@gmail.com');



--------------------------------------------------------- OXYGEN CYLINDER DETAILS INSERTION ---------------------------------------------------------

execute insertion.insert_oxygen_cylinder_details(1, 500, 1);
execute insertion.insert_oxygen_cylinder_details(1, 275, 0);
execute insertion.insert_oxygen_cylinder_details(1, 750, 0);
execute insertion.insert_oxygen_cylinder_details(1, 1000,1);
execute insertion.insert_oxygen_cylinder_details(2, 500, 1);
execute insertion.insert_oxygen_cylinder_details(2, 310, 1);
execute insertion.insert_oxygen_cylinder_details(2, 145, 0);
execute insertion.insert_oxygen_cylinder_details(2, 340, 1);
execute insertion.insert_oxygen_cylinder_details(3, 10, 1);
execute insertion.insert_oxygen_cylinder_details(3, 80, 0);
execute insertion.insert_oxygen_cylinder_details(4, 145, 0);
execute insertion.insert_oxygen_cylinder_details(3, 390, 1);
execute insertion.insert_oxygen_cylinder_details(3, 500, 1);
execute insertion.insert_oxygen_cylinder_details(4, 230, 1);
execute insertion.insert_oxygen_cylinder_details(4, 100, 0);
execute insertion.insert_oxygen_cylinder_details(4, 75, 1);
execute insertion.insert_oxygen_cylinder_details(5, 65, 1);
execute insertion.insert_oxygen_cylinder_details(5, 100, 1);
execute insertion.insert_oxygen_cylinder_details(5, 115, 0);
execute insertion.insert_oxygen_cylinder_details(5, 300, 1);
execute insertion.insert_oxygen_cylinder_details(6, 500, 1);
execute insertion.insert_oxygen_cylinder_details(6, 210, 1);
execute insertion.insert_oxygen_cylinder_details(6, 30, 0);
execute insertion.insert_oxygen_cylinder_details(6, 320, 0);
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
execute insertion.insert_payment_status('Incomplete');

--------------------------------------------------------- Patient Details Table INSERTION ---------------------------------------------------------

execute insertion.insert_patient_details(34567890, 'Rafi', '567, Park street', 1, 'Suffolk');
execute insertion.insert_patient_details(12367890, 'Ravi', '27, North Station street', 1, 'Suffolk');
execute insertion.insert_patient_details(34512690, 'Robert', '766, Heath street', 1, 'Worcester');
execute insertion.insert_patient_details(12365466, 'James', '47, Copley ', 1, 'Nantucket');
execute insertion.insert_patient_details(34567233, 'Jimmy', '12, Park street', 1, 'Suffolk');
execute insertion.insert_patient_details(12367530, 'Sarah', '35, Darling street', 1, 'Suffolk');
execute insertion.insert_patient_details(87993890, 'Emily', '98, Roxbury street', 1, 'Suffolk');
execute insertion.insert_patient_details(34522718, 'Dev', '11, Roxbury street', 1, 'Suffolk');


--------------------------------------------------------- Rental Price Table INSERTION ---------------------------------------------------------
-- TIMESTAMP format - 'DD-MM-YY HH:MM:SS.FF'

execute insertion.insert_rental_price(TIMESTAMP '10-12-21 09:26:50.12', 150);
execute insertion.insert_rental_price(TIMESTAMP '9-12-21 09:26:50.12', 130);
execute insertion.insert_rental_price(TIMESTAMP '8-12-21 09:26:50.12', 100);
execute insertion.insert_rental_price(TIMESTAMP '7-12-21 09:26:50.12', 140);
execute insertion.insert_rental_price(TIMESTAMP '6-12-21 09:26:50.12', 115);
execute insertion.insert_rental_price(TIMESTAMP '5-12-21 09:26:50.12', 115);
execute insertion.insert_rental_price(TIMESTAMP '4-12-21 09:26:50.12', 80);
execute insertion.insert_rental_price(TIMESTAMP '3-12-21 09:26:50.12', 90);
execute insertion.insert_rental_price(TIMESTAMP '2-12-21 09:26:50.12', 50);
execute insertion.insert_rental_price(TIMESTAMP '1-12-21 09:26:50.12', 35);
execute insertion.insert_rental_price(TIMESTAMP '30-11-21 09:26:50.12', 90);
execute insertion.insert_rental_price(TIMESTAMP '28-11-21 09:26:50.12', 115);
execute insertion.insert_rental_price(TIMESTAMP '27-11-21 09:26:50.12', 130);
execute insertion.insert_rental_price(TIMESTAMP '26-11-21 09:26:50.12', 45);
execute insertion.insert_rental_price(TIMESTAMP '25-11-21 09:26:50.12', 30);
execute insertion.insert_rental_price(TIMESTAMP '24-11-21 09:26:50.12', 50);
execute insertion.insert_rental_price(TIMESTAMP '23-11-21 09:26:50.12', 25);
execute insertion.insert_rental_price(TIMESTAMP '22-11-21 09:26:50.12', 50);
execute insertion.insert_rental_price(TIMESTAMP '21-11-21 09:26:50.12', 60);
execute insertion.insert_rental_price(TIMESTAMP '20-11-21 09:26:50.12', 20);

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
execute insertion.insert_password('dmddabc', 'dmdddmdd2131', 'favourite pet');
execute insertion.insert_password('dmdddefg', 'dmdddmdd2132', 'best friend name');
execute insertion.insert_password('dmdddhij', 'dmdddmdd2134', 'when is birthday');
execute insertion.insert_password('dmdddklmn', 'dmdddmdd2187', 'when is birthday');
execute insertion.insert_password('dmdddmdop', 'dmdddmdd2198', 'favourite pet');
execute insertion.insert_password('dmdddmqr', 'dmdddmdd2133', 'when is birthday');
execute insertion.insert_password('dmddabcdde', 'dmdddmdd21', 'favourite pet');
execute insertion.insert_password('dmdddefgh', 'dmdddmdd2137', 'best friend name');
execute insertion.insert_password('dmdddhijk', 'dmdddmdd2197', 'when is birthday');
execute insertion.insert_password('dmdddkhy', 'dmdddmd123', 'best friend name');
execute insertion.insert_password('dmdddshy', 'dmdddmdd21', 'favourite pet');
execute insertion.insert_password('dmdddeee', 'dmdddmd673', 'when is birthday');
execute insertion.insert_password('dmddorg', 'dmdddmdd2678', 'when is birthday');
execute insertion.insert_password('dmdduri', 'dmdddmdd1009', 'when is birthday');
execute insertion.insert_password('dmddopt', 'dmdddmdd176', 'when is birthday');
execute insertion.insert_password('dmddllike', 'dmdddmdd888', 'when is birthday');


------------------------------------------------------------ Permissions Table insertion----------------------------------------------------------


execute insertion.insert_permissions_method(1, 'ADM', 'Access to all pages');
execute insertion.insert_permissions_method(2, 'SUP', 'Access to Inventory Page');
execute insertion.insert_permissions_method(3, 'CUST', 'Access to Order Page');



------------------------------------------------------------ Account Table insertion----------------------------------------------------------

execute insertion.insert_account_table('Kiran', 'kiran.asd@gmail.com', 8908900980, 'St Mkasd, Heath Street', 'Sufflok', 2, null, 1, 1);
execute insertion.insert_account_table('George', 'george.reddy@gmail.com', 8764536783, '35 darling St', 'Worcester', 2, null, 1, 2);
execute insertion.insert_account_table('Naveen', 'naaveen.asd@gmail.com', 6755344267, 'J Vue Longwood', 'Franklin', 2, null, 1, 3);
execute insertion.insert_account_table('Sanjit', 'sanjit.asd@gmail.com', 9887567453, 'Park street', 'Sufflok', 2, null, 1, 4);
execute insertion.insert_account_table('Aishwarya', 'aish.asd@gmail.com', 8977612341, '15 Rd Copley', 'Norflok', 2, null, 1, 5);
execute insertion.insert_account_table('Mahesh', 'mahesh.babu@gmail.com', 9877864536, '45th Downtown', 'Sufflok', 2, null, 1, 6);
execute insertion.insert_account_table('Ram', 'ram.asd@gmail.com', 7888673452, 'St Rome, Heath Street', 'Sufflok', 2, null, 1, 7);
execute insertion.insert_account_table('Samantha', 'samantha.reddy@gmail.com', 8788829223, '509 Park Street', 'Norflok', 2, null, 1, 8);
execute insertion.insert_account_table('Nishanth', 'nish.asd@gmail.com', 9845897564, 'Brigham Circle', 'Worcester', 2, null, 1, 9);
execute insertion.insert_account_table('Sowmya', 'sowm.asd@gmail.com', 9118987345, '75 Huntington', 'Franklin', 2, null, 1, 10);
execute insertion.insert_account_table('Gaurav', 'Gaurav.reddy@gmail.com', 9866724351, '145 Avenue', 'Sufflok', 2, null, 1, 11);
execute insertion.insert_account_table('Nitya', 'nitya.reddy@gmail.com', 8755647893, '107 Park Street', 'Norflok', 3, null, 1, 12);
execute insertion.insert_account_table('Daniel', 'Dan.hose@gmail.com', 9008787645, '89 J Vue', 'Sufklok', 3, null, 1, 13);
execute insertion.insert_account_table('Keval', 'keval.shah@gmail.com', 9833425678, ' Mission Main', 'Worcester', 3, null, 1, 14);
execute insertion.insert_account_table('Ramesh', 'Ramesh.asd@gmail.com', 9898123456, '109 Copley', 'Franklin', 3, null, 1, 15);
execute insertion.insert_account_table('Suresh', 'Suresh.reddy@gmail.com', 7564890034, 'Prudential St', 'Sufflok', 3, null, 1, 16);
execute insertion.insert_account_table('Lucy', 'Lucy.rajesh@gmail.com', 8763553678, '13 J Vue', 'Frankin', 2, null, 1, 17);


-------------------------------------------------------------- Account role mapping history Insertion --------------------------------------------------------

execute insertion.insert_account_role_mapping_table(1, 2, null);
execute insertion.insert_account_role_mapping_table(2, 2, null);
execute insertion.insert_account_role_mapping_table(3, 2, null);
execute insertion.insert_account_role_mapping_table(4, 2, null);
execute insertion.insert_account_role_mapping_table(5, 2, null);
execute insertion.insert_account_role_mapping_table(6, 2, null);
execute insertion.insert_account_role_mapping_table(7, 2, null);
execute insertion.insert_account_role_mapping_table(8, 2, null);
execute insertion.insert_account_role_mapping_table(9, 2, null);
execute insertion.insert_account_role_mapping_table(10, 2, null);
execute insertion.insert_account_role_mapping_table(11, 2, null);
execute insertion.insert_account_role_mapping_table(12, 3, null);
execute insertion.insert_account_role_mapping_table(13, 3, null);
execute insertion.insert_account_role_mapping_table(14, 3, null);
execute insertion.insert_account_role_mapping_table(15, 3, null);
execute insertion.insert_account_role_mapping_table(16, 3, null);
execute insertion.insert_account_role_mapping_table(17, 2, null);



-------------------------------------------------------------- Authentication Config Insertion --------------------------------------------------------


execute insertion.insert_authentication_config('192.168.43.210', 'America/New_York', 0, null, 1);



-------------------------------------------------------------- Renter Payment Checkout Insertion --------------------------------------------------------

execute insertion.insert_renter_payment_checkout(4, 15, 'Oxygen cylinder URGENT', 35, 80);
execute insertion.insert_renter_payment_checkout(3, 12, 'Oxygen cylinder Request', 75, 15);
execute insertion.insert_renter_payment_checkout(1, 13, 'Oxygen cylinder Request', 90, 50);
execute insertion.insert_renter_payment_checkout(2, 16, 'Oxygen cylinder URGENT', 95, 45);
execute insertion.insert_renter_payment_checkout(2, 14, 'Oxygen cylinder for Patient ', 80, 0);


-------------------------------------------------------------- Orders Table Insertion --------------------------------------------------------

execute insertion.insert_order(15, 5, 1, 6, 2, 1, 34567890, '06-12-21 09:26:50.12', '09-12-21 09:26:50.12');
execute insertion.insert_order(16, 4, 4, 6, 3, 1, 34567233, '07-12-21 09:26:50.12', '08-12-21 09:26:50.12');
execute insertion.insert_order(12, 8, 2, 6, 12, 3, 87993890, '03-12-21 09:26:50.12', '10-12-21 09:26:50.12');
execute insertion.insert_order(13, 4, 3, 6, 19, 4, 34522718, '07-12-21 09:26:50.12', '10-12-21 09:26:50.12');
execute insertion.insert_order(14, 2, 5, 1, 6, 2, 12367890, '09-12-21 09:26:50.12', '10-12-21 09:26:50.12');


