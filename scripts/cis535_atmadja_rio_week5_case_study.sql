
/*
    Name: Rio Atmadja
    Date: 06/28/2023
    Course: CIS535-T301
    Description: Case Study Case, implement table creations (Week 5)
        - All tables are populated with data. All appropriate primary and foreign keys are added to the tables and match the E-R diagram
*/
USE cis535

CREATE TABLE Customers(
    customer_id INT PRIMARY KEY NOT NULL,
    customer_first_name VARCHAR(255) NOT NULL,
    customer_last_name VARCHAR(255) NOT NULL,
    customer_phone_number VARCHAR(50),
    customer_address VARCHAR(255)
)

CREATE TABLE Bid(
    bid INT PRIMARY KEY NOT NULL,
    bid_date DATETIME,
    bid_amount INT DEFAULT 0,
    bid_start_date DATETIME,
    bid_end_date DATETIME,
    bid_time_required INT DEFAULT 0,
    bid_approved TINYINT DEFAULT 0 ,
    bid_total_hours INT DEFAULT 0,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)

CREATE TABLE Repair(
    repair_id INT PRIMARY KEY NOT NULL,
    repair_date DATETIME,
    repair_description TEXT,
    repair_start_date DATETIME,
    repair_end_date DATETIME,
    repair_status TINYINT DEFAULT 0,
    bid INT NOT NULL,
    FOREIGN KEY (bid) REFERENCES Bid(bid)
)

CREATE TABLE CustomerBilling(
    customer_billing_id INT PRIMARY KEY NOT NULL,
    customer_billing_first_name VARCHAR(255) NOT NULL,
    customer_billing_last_name VARCHAR(255) NOT NULL,
    customer_billing_date DATETIME,
    customer_billing_address VARCHAR(255) NOT NULL,
    customer_billing_zipcode VARCHAR(50) NOT NULL,
    customer_billing_total_hours INT DEFAULT 0,
    customer_billing_quantity INT DEFAULT 0,
    customer_billing_amount INT DEFAULT 0,
    customer_billing_description TEXT,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)

CREATE TABLE CustomerInvoice(
    customer_invoice_id INT PRIMARY KEY NOT NULL,
    customer_billing_id INT NOT NULL,
    customer_invoice_date DATE,
    customer_invoice_due_date DATE,
    customer_invoice_balance_paid_state TINYINT DEFAULT 0,
    customer_invoice_balance FLOAT DEFAULT 0.0,
    customer_remaining_balance FLOAT DEFAULT 0.0,
    customer_payment_status TINYINT DEFAULT 0,
    FOREIGN KEY (customer_billing_id) REFERENCES CustomerBilling(customer_billing_id)
)

CREATE TABLE CustomerPayment(
    payment_id INT PRIMARY KEY NOT NULL,
    customer_invoice_id INT NOT NULL,
    customer_payment_amount FLOAT DEFAULT 0.0,
    customer_payment_due_date DATETIME,
    FOREIGN KEY (customer_invoice_id) REFERENCES CustomerInvoice(customer_invoice_id)

)

CREATE TABLE SupplierBilling(
    supplier_id INT PRIMARY KEY NOT NULL,
    supplier_name VARCHAR(255) NOT NULL,
    supplier_address VARCHAR(255) NOT NULL,
    supplier_zipcode VARCHAR(50) NOT NULL,
    supplier_phone_number VARCHAR(50) NOT NULL,
    supplier_billing_date DATETIME,
    supplier_billing_amount FLOAT DEFAULT 0.0,
    supplier_billing_quantity INT DEFAULT 0,
    supplier_biling_total_hours INT DEFAULT 0,
    supplier_billing_description TEXT

)

CREATE TABLE SupplierInvoice(
    invoice_id INT PRIMARY KEY NOT NULL,
    supplier_id INT NOT NULL,
    supplier_invoice_date DATETIME,
    supplier_invoice_due_date DATETIME,
    supplier_invoice_balance DATETIME,
    supplier_invoice_remaining_balance FLOAT DEFAULT 0.0,
    supplier_invoice_balance_paid_date DATETIME,
    supplier_invoice_payment_status TINYINT DEFAULT 0,
    FOREIGN KEY (supplier_id) REFERENCES SupplierBilling(supplier_id)

)

CREATE TABLE SupplierPayment(
    payment_id INT PRIMARY KEY NOT NULL,
    invoice_id INT NOT NULL,
    supllier_amount FLOAT DEFAULT 0.0,
    supplier_due_date DATETIME,
    FOREIGN KEY (invoice_id) REFERENCES SupplierInvoice(invoice_id)

)

CREATE TABLE Materials(
    mid INT PRIMARY KEY NOT NULL,
    repair_id INT NOT NULL,
    supplier_id INT NOT NULL,
    material_name VARCHAR(255),
    material_issued_date DATE,
    material_price FLOAT,
    material_description TEXT,
    material_part_number INT,
    FOREIGN KEY (repair_id) REFERENCES Repair(repair_id),
    FOREIGN KEY (supplier_id) REFERENCES SupplierBilling(supplier_id)
)

