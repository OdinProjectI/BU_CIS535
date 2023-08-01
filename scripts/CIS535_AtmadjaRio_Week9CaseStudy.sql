/*
    Name: Rio Atmadja
    Date: 07/31/2023
    Course: CIS535-T301
    Description: Week 9 Case Study Project

-- 1. Query to list the names of the customers who provided bids last month.
/*
============================================================================================
Description: T-SQL Function to list the names of the customers who provided bids last month.
             Also, this function simplifies the bid search query.

Return:
    - A table with the following attributes:
        - customer_id
        - customer_first_name
        - customer_last_name
        - customer_phone_number
        - customer_address
        - bid_date
        - bid_start_date
        - bid_end_date
        - bid_total_hours
        - bid_time_required
============================================================================================

*/
CREATE FUNCTION SearchBidLastMonth()
RETURNS TABLE

RETURN

(
    SELECT
        c.customer_id,
        c.customer_first_name,
        c.customer_last_name,
        c.customer_phone_number,
        c.customer_address,
        b.bid_date,
        b.bid_start_date,
        b.bid_end_date,
        b.bid_total_hours,
        b.bid_time_required

    FROM Customers c
    JOIN Bid b ON b.customer_id = c.customer_id
    WHERE FORMAT(b.bid_date, 'yyyy-MM') = FORMAT(GETDATE(), 'yyyy-MM')
)

SELECT * FROM SearchBidLastMonth()

-- 2. Query to list all the customers with an outstanding balance (amount due to Bob) greater than five hundred dollars.
/* 
=================================================================================================================
Description: T-SQL function to list all the customers with an outstanding balance greater than $500 or any given
            balance amount.
Return:
    - customer_id
    - customer_billing_id,
    - customer_billing_first_name
    - customer_billing_last_name
    - customer_billing_address
    - customer_billing_date
    - customer_billing_description
    - customer_billing_amount
=================================================================================================================
*/
CREATE FUNCTION SearchCustomersOutstandingBalance (@balance INT)
RETURNS TABLE
AS
RETURN
 (
    SELECT
        c.customer_id,
        cb.customer_billing_id,
        cb.customer_billing_first_name,
        cb.customer_billing_last_name,
        cb.customer_billing_address,
        cb.customer_billing_date,
        cb.customer_billing_description,
        cb.customer_billing_amount

    FROM Customers c
    JOIN CustomerBilling cb ON cb.customer_id = c.customer_id
    WHERE cb.customer_billing_amount > @balance
)

SELECT * FROM SearchCustomersOutstandingBalance(500)

-- 3. Query to list all the suppliers where Bob has an outstanding balance of over a thousand dollars.
-- View table to list all outstanding balance that is greater than $1,000
CREATE VIEW SupplierBillings AS
(SELECT
    sb.supplier_id,
    sb.supplier_name,
    sb.supplier_address,
    sb.supplier_zipcode,
    sb.supplier_phone_number,
    sb.supplier_billing_date,
    sb.supplier_billing_description

FROM SupplierBilling sb
WHERE sb.supplier_billing_amount > 1000)

SELECT * FROM SupplierBillings

-- 4. Query to list all the material that was used for bids where the estimated hours for the bid were greater than forty hours.
SELECT
    m.material_name,
    m.material_price,
    m.material_description,
    m.material_part_number

FROM Bid b
JOIN Repair r ON r.bid = b.bid
JOIN Materials m ON m.repair_id = r.repair_id
WHERE b.bid_time_required > 40
    
-- 5. Query to list all the materials that Bob purchased from a specific supplier. 
CREATE FUNCTION GetMaterials(@supplier_name VARCHAR(255) )
RETURNS TABLE

AS

RETURN (
    SELECT
        m.material_name,
        m.material_price,
        m.material_part_number

    FROM SupplierBilling sb
    JOIN Materials m ON m.supplier_id = sb.supplier_id
    WHERE sb.supplier_name = @supplier_name

)

SELECT g.material_name, g.material_price, g.material_part_number FROM GetMaterials('Home Hardware & Supply') g

-- Miscellaneous Quries
/*
===========================================================================================================
Description: Bill remainder function that searches DB for current due dates based on a given month and year
Params @month: given a valid month
       @year: given a valid year
===========================================================================================================

*/
CREATE FUNCTION GenerateCustomerInvoice(@month INT, @year INT)
RETURNS TABLE
AS

RETURN (

    SELECT
        CONCAT(c.customer_first_name, ' ', c.customer_last_name) AS "Customer Name",
        CONCAT( cb.customer_billing_address, ' ', cb.customer_billing_zipcode) AS "Billing Address",
        c.customer_phone_number AS "Phone Number",
        ci.customer_invoice_balance AS "Amount Due Now",
        ci.customer_remaining_balance AS "Remaining Balance",
        ci.customer_invoice_due_date AS "Due Date",
        m.material_description  AS "Material Description",
        r.repair_description AS "Job Description"

    FROM Customers c
    JOIN CustomerBilling cb ON cb.customer_id = c.customer_id
    JOIN CustomerInvoice ci ON ci.customer_billing_id = cb.customer_billing_id
    JOIN Bid b ON b.customer_id = c.customer_id
    JOIN Repair r ON r.bid = b.bid
    JOIN Materials m ON m.repair_id = r.repair_id
    WHERE YEAR(ci.customer_invoice_due_date) = @year AND MONTH(ci.customer_invoice_due_date) = @month


)

SELECT * FROM GenerateCustomerInvoice(7,2023) ORDER BY "Due Date" DESC
