CREATE TABLE "oxygen_cylinder_details" (
  "cylinder_id" NUMERIC(25,0),
  "plant_id" NUMERIC(20,0),
  "quantity" NUMBERIC,
  "available_status" NUMERIC(1,0),
  "created_on" CURRENT_TIMESTAMP,
  "updated_on" CURRENT_TIMESTAMP,
  PRIMARY KEY ("cylinder_id")
);

CREATE TABLE "role" (
  "role_id" NUMBER(16,0),
  "role_description" VARCHAR2(500),
  "display_name" VARCHAR2(50),
  "created_on" CURRENT_TIMESTAMP,
  "created_by_id" NUMBER(16,0),
  PRIMARY KEY ("role_id")
);

CREATE TABLE "oxygen_cylinder_plant" (
  "plant_id" NUMERIC(20,0),
  "name" VARCHAR2,
  "address" VARCHAR2,
  "phone_number" NUMBERIC(10,0),
  "county" VARCHAR2,
  "email_id" VARCHAR2,
  "created_on" CURRENT_TIMESTAMP,
  "updated_on" CURRENT_TIMESTAMP,
  PRIMARY KEY ("plant_id")
);

CREATE TABLE "payment_status" (
  "payment_status_code" NUMERIC(1,0),
  "status_description" VARCHAR2,
  "created_on" CURRENT_TIMESTAMP,
  PRIMARY KEY ("payment_status_code")
);

CREATE TABLE "patient_details" (
  "covid_report_id" NUMERIC(8,0),
  "name" VARCHAR2,
  "address" VARCHAR2,
  "covid_status" NUMERIC(1,0),
  "county" VARCHAR2,
  PRIMARY KEY ("covid_report_id")
);

CREATE TABLE "rental_price" (
  "price_id" NUMERIC(16,0),
  "created_on" CURRENT_TIMESTAMP,
  "price" NUMERIC,
  PRIMARY KEY ("price_id")
);

CREATE TABLE "orders" (
  "order_id" NUMERIC(30,0),
  "account_id" NUMERIC(20,0),
  "rental_price_id" NUMERIC(16,0),
  "transaction_id" NUMERIC(30,0),
  "payment_status_Code" NUMERIC(1,0),
  "cylinder_id" NUMERIC(25,0),
  "plant_id" NUMERIC(20,0),
  "covid_report_id" NUMERIC(8,0),
  "booked_date" TIMESTAMP,
  "booking_end_date" TIMESTAMP,
  PRIMARY KEY ("order_id", "account_id"),
  CONSTRAINT "FK_orders.plant_id"
    FOREIGN KEY ("plant_id")
      REFERENCES "oxygen_cylinder_plant"("plant_id"),
  CONSTRAINT "FK_orders.payment_status_Code"
    FOREIGN KEY ("payment_status_Code")
      REFERENCES "payment_status"("payment_status_code"),
  CONSTRAINT "FK_orders.covid_report_id"
    FOREIGN KEY ("covid_report_id")
      REFERENCES "patient_details"("covid_report_id"),
  CONSTRAINT "FK_orders.rental_price_id"
    FOREIGN KEY ("rental_price_id")
      REFERENCES "rental_price"("price_id")
);

CREATE INDEX "FK 1" ON  "orders" ("account_id");

CREATE INDEX "FK2" ON  "orders" ("rental_price_id");

CREATE INDEX "FK3" ON  "orders" ("transaction_id");

CREATE INDEX "FK4" ON  "orders" ("payment_status_Code");

CREATE INDEX "FK5" ON  "orders" ("cylinder_id");

CREATE INDEX "FK6" ON  "orders" ("plant_id");

CREATE INDEX "FK7" ON  "orders" ("covid_report_id");

CREATE TABLE "account_status" (
  "status_id" NUMBER(2,0),
  "status_description" VARCHAR2,
  "created_on" CURRENT_TIMESTAMP,
  "updated_on" CURRENT_TIMESTAMP,
  PRIMARY KEY ("status_id")
);

CREATE TABLE "Account" (
  "account_id" NUMBER(20,0),
  "display_name" VARCHAR2(50),
  "email_id" VARCHAR2(500),
  "phone_number" NUMBER(10,0),
  "address" VARCHAR2(500),
  "county" VARCHAR2,
  "created _on" CURRENT_TIMESTAMP,
  "role_id" NUMBER(2,0),
  "modified_by_id" NUMBER(16,0),
  "modified_on" CURRENT_TIMESTAMP,
  "account_status_id" NUMBER(2,0),
  "password_id" NUMBER(20,0),
  PRIMARY KEY ("account_id"),
  CONSTRAINT "FK_Account.account_status_id"
    FOREIGN KEY ("account_status_id")
      REFERENCES "account_status"("status_id")
);

CREATE TABLE "password" (
  "password_id" NUMBER(20,0),
  "password_hash" VARCHAR2,
  "password_salted" VARCHAR2,
  "password_question" VARCHAR2,
  "passsword_answer_hash" VARCHAR2,
  "created_date" CURRENT_TIMESTAMP,
  "updated_date" CURRENT_TIMESTAMP,
  PRIMARY KEY ("password_id")
);

CREATE TABLE "payment_method" (
  "payment_method_id" NUMERIC(2,0),
  "description" VARCHAR2,
  "created_on" CURRENT_TIMESTAMP,
  "updated_on" CURRENT_TIMESTAMP,
  PRIMARY KEY ("payment_method_id")
);

CREATE TABLE "renter_payment_checkout" (
  "transaction_id" NUMBERIC(30,0),
  "payment_method_id" NUMERIC(2,0),
  "account_id" NUMBER(20,0),
  "details" VARCHAR2,
  "payment_made" NUMERIC(4,2),
  "payment_due" NUMERIC(4,2),
  PRIMARY KEY ("transaction_id"),
  CONSTRAINT "FK_renter_payment_checkout.payment_method_id"
    FOREIGN KEY ("payment_method_id")
      REFERENCES "payment_method"("payment_method_id")
);

CREATE TABLE "account_role_mapping_history" (
  "account_id" NUMBER(20, 0),
  "role_id" NUMBER(2,0),
  "created_on" CURRENT_TIMESTAMP,
  "created_by_id" NUMBER(16,0),
  PRIMARY KEY ("account_id", "role_id"),
  CONSTRAINT "FK_account_role_mapping_history.role_id"
    FOREIGN KEY ("role_id")
      REFERENCES "Account"("account_id"),
  CONSTRAINT "FK_account_role_mapping_history.role_id"
    FOREIGN KEY ("role_id")
      REFERENCES "role"("role_description")
);

CREATE INDEX "FK1" ON  "account_role_mapping_history" ("account_id");

CREATE INDEX "FK2" ON  "account_role_mapping_history" ("role_id");

CREATE TABLE "permissions" (
  "permission_id" NUMBER(8,0),
  "role_id" NUMBER(16,0),
  "type" VARCHAR2(10),
  "description" VARCHAR2,
  "created_on" CURRENT_TIMESTAMP,
  PRIMARY KEY ("permission_id")
);

CREATE TABLE "authentication_config" (
  "session_id" NUMERIC(20,0),
  "login_time" TIMESTAMP,
  "IP" VARCHAR2,
  "timezone" VARCHAR2,
  "is_logout" NUMERIC(1,0),
  "logout_time" TIMESTAMP,
  "account_id" NUMERIC(20,0),
  PRIMARY KEY ("session_id"),
  CONSTRAINT "FK_authentication_config.account_id"
    FOREIGN KEY ("account_id")
      REFERENCES "Account"("account_id")
);


