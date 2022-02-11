DROP DATABASE IF EXISTS customerOrder;
CREATE DATABASE customerOrder;
USE customerOrder;

CREATE TABLE Customers (
customerID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
customerFirstName VARCHAR(50),
customerLastName VARCHAR(50),
customerStreet VARCHAR(50),
customerCity VARCHAR(30),
customerState VARCHAR(30),
customerZipcode INTEGER,
customerPhone VARCHAR(20),
customerEmail VARCHAR(30)
);

CREATE TABLE PaymentMethods (
paymentID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
paymentDescription VARCHAR(11)
);

CREATE TABLE Invoices (
invoiceID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
invoiceDate DATE,
paymentID INTEGER,
	FOREIGN KEY(paymentID)
		REFERENCES PaymentMethods(paymentID),
customerID INTEGER,
	FOREIGN KEY(customerID)
		REFERENCES Customers(customerID)
);

CREATE TABLE ProcessingEmployees (
employeeID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
employeeFirstName VARCHAR(50),
employeeLastName VARCHAR(50),
employeeStreet VARCHAR(50),
employeeCity VARCHAR(30),
employeeState VARCHAR(30),
employeeZipcode INTEGER,
employeePhone VARCHAR(20),
employeeEmail VARCHAR(30)
);

CREATE TABLE Orders (
orderID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL, 
orderDate DATE, 
cancelled BOOLEAN,
orderSum DECIMAL(6,2),
invoiceID INTEGER,
	FOREIGN KEY(invoiceID)
		REFERENCES Invoices(invoiceID),
processingEmployeeID INTEGER,
	FOREIGN KEY(processingEmployeeID)
		REFERENCES ProcessingEmployees(employeeID),
customerID INTEGER,
	FOREIGN KEY (customerID) 
		REFERENCES Customers(customerID)
);

CREATE TABLE ShippingEmployees (
employeeID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
employeeFirstName VARCHAR(50),
employeeLastName VARCHAR(50),
employeeStreet VARCHAR(50),
employeeCity VARCHAR(30),
employeeState VARCHAR(30),
employeeZipcode INTEGER,
employeePhone VARCHAR(20),
employeeEmail VARCHAR(30)
);

CREATE TABLE Shipments (
shipmentID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
shipmentDate DATE,
shippingEmployeeID INTEGER,
	FOREIGN KEY(shippingEmployeeID) 
		REFERENCES ShippingEmployees(employeeID),
orderID INTEGER,
	FOREIGN KEY(orderID)
		REFERENCES Orders(orderID),
customerID INTEGER,
	FOREIGN KEY (customerID) 
		REFERENCES Customers(customerID)
);

CREATE TABLE Categories (
categoryID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
categoryTitle VARCHAR(30) 
);

CREATE TABLE Suppliers (
supplierID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
supplierName VARCHAR(50),
supplierStreet VARCHAR(50),
supplierCity VARCHAR(30),
supplierState VARCHAR(30),
supplierZipcode INTEGER,
supplierPhone VARCHAR(20),
supplierEmail VARCHAR(30),
supplierWebpage VARCHAR(200)
);

CREATE TABLE Products (
productID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL, 
productTitle VARCHAR(200), 
productDescription TEXT, 
productPrice DECIMAL(4,2), 
quantityLeft INTEGER,
categoryID INTEGER, 
	FOREIGN KEY(categoryID) 
		REFERENCES Categories(categoryID),
supplierID INTEGER, 
	FOREIGN KEY(supplierID) 
		REFERENCES Suppliers(supplierID)
);

CREATE TABLE OrderDetails (
orderID INTEGER,
	FOREIGN KEY(orderID)
		REFERENCES Orders(orderID),
productID INTEGER,
	FOREIGN KEY(productID)
		REFERENCES Products(productID),
PRIMARY KEY (orderID, productID),
orderedQuantity INTEGER,
productSum DECIMAL(6,2)
);

INSERT INTO Customers 
	VALUES 
    (1, 'Chris', 'Woodard', '4101 Reeves Street', 'Abrams', 'Wisconsin(WI)', 54101, '920-604-2335', 'derrick1989@yahoo.com'),
	(2, 'Charles', 'Griffith', '35 Charla Lane', 'Dallas', 'Texas(TX)', 75247, '214-719-0146', 'eddie_hagen@gmail.com'),
	(3, 'Joeann', 'Tinney', '4946 Deer Ridge Drive', 'Rochelle Park', 'New Jersey(NJ)', 07662, '862-252-4329', 'kyleigh_mil@gmail.com'),
	(4, 'Evelyn', 'Flores', '4246 Preston Street', 'Ulysses', 'Kansas(KS)', 67880, '620-952-7110', 'jacklyn_fa5@yahoo.com'),
	(5, 'Amy', 'Nakamura', '3927 Del Dew Drive', 'Annapolis Junction', 'Maryland(MD)', 20701, '301-922-6082', 'ramiro2011@yahoo.com'),
	(6, 'David', 'Choudhury', '4815 Martha Ellen Drive', 'Owyhee', 'Nevada(NV)', 89832, '775-338-2661', 'shawn.wucke@gmail.com');

INSERT INTO PaymentMethods (paymentDescription) 
	VALUES 
    ('cash'), 
    ('credit card'), 
    ('check');
    
INSERT INTO Invoices 
	VALUES 
    (1, '2021-01-05', 2, 5),
	(2, '2021-01-23', 2, 3),
	(3, '2021-01-26', 2, 4),
	(4, '2021-03-13', 1, 3),
	(5, '2021-03-27', 3, 1),
	(6, '2021-04-16', 1, 3),
	(7, '2021-04-26', 2, 5),
	(8, '2021-05-02', 2, 3),
	(9, '2021-05-26', 2, 1),
	(10, '2021-06-14', 2, 1),
	(11, '2021-06-27', null, 5), 
	(12, '2021-07-10', 2, 2),
	(13, '2021-08-19', 1, 2),
	(14, '2021-11-08', 2, 4),
	(15, '2021-11-19', 2, 3),
	(16, '2021-12-17', null, 5), 
	(17, '2021-12-19', 1, 1),
	(18, '2021-12-27', 2, 1),
	(19, '2022-01-17', 2, 5),
	(20, '2022-01-30', 3, 2);

INSERT INTO ProcessingEmployees 
	VALUES 
    (1, 'Margaret', 'Cardona', '4121 Sunrise Road', 'Henderson', 'Nevada(NV)', 89014, '702-932-9816', 'megane_man2@hotmail.com'),
	(2, 'Sarah', 'Navarro', '1994 Shobe Lane', 'Centennial', 'Colorado(CO)', 80112, '970-470-5785', 'kayla2002@yahoo.com'),
	(3, 'Albert', 'Lindsay', '48 Pointe Lane', 'Pompano Beach', 'Florida(FL)', 33060, '954-968-0457', 'sherwood2003@yahoo.com');

INSERT INTO Orders 
	VALUES 
    (1, '2021-01-04', false, 789.32, 1, 3, 5),
	(2, '2021-01-23', false, 1252.04, 2, 1, 3),
	(3, '2021-01-26', false, 244.32, 3, 1, 4),
	(4, '2021-03-13', false, 449.82, 4, 2, 3),
	(5, '2021-03-27', false, 1085.70, 5, 1, 1),
	(6, '2021-04-16', false, 406.71, 6, 1, 3),
	(7, '2021-04-26', false, 197.50, 7, 3, 5),
	(8, '2021-05-02', false, 592.40, 8, 3, 3),
	(9, '2021-05-26', false, 152.11, 9, 2, 1),
	(10, '2021-06-14', false, 229.00, 10, 2, 1),
	(11, '2021-06-27', true, 663.64, 11, 1, 5),
	(12, '2021-07-09', false, 631.92, 12, 3, 2),
	(13, '2021-08-19', false, 393.77, 13, 3, 2),
	(14, '2021-11-08', false, 74.97, 14, 3, 4),
	(15, '2021-11-19', false, 317.79, 15, 2, 3),
	(16, '2021-12-17', true, 977.10, 16, 1, 5),
	(17, '2021-12-19', false, 410.80, 17, 1, 1),
	(18, '2021-12-27', false, 65.34, 18, 1, 1),
	(19, '2022-01-17', false, 54.96, 19, 2, 5),
	(20, '2022-01-30', false, 28.44, 20, 3, 2);

INSERT INTO ShippingEmployees 
	VALUES 
	(1, 'Gabriel', 'Garvin', '3833 Melody Lane', 'Richmond', 'Virginia(VA)', 23220, '804-358-9193', 'lazaro_waelc@hotmail.com'),
	(2, 'Juan', 'Hernandez', '281 Owen Lane', 'Traverse City', 'Michigan(MI)', 49684, '231-933-9827', 'iac2007@yahoo.com'),
	(3, 'Diana', 'Clark', '3973 Platinum Drive', 'Greensburg', 'Pennsylvania(PA)', 15601, '724-837-8734', 'enoch.legro10@yahoo.com');

INSERT INTO Shipments 
	VALUES 
    (1, '2021-01-06', 3, 1, 5),
	(2, '2021-01-24', 1, 2, 3),
	(3, '2021-01-25', 1, 2, 3),
	(4, '2021-01-27', 1, 3, 4),
	(5, '2021-03-14', 2, 4, 3),
	(6, '2021-03-28', 2, 5, 1),
	(7, '2021-03-30', 2, 5, 1),
	(8, '2021-04-17', 3, 6, 3),
	(9, '2021-04-18', 3, 6, 3),
	(10, '2021-04-20', 3, 6, 3),
	(11, '2021-04-27', 1, 7, 5),
	(12, '2021-05-03', 3, 8, 3),
	(13, '2021-05-04', 3, 8, 3),
	(14, '2021-05-27', 1, 9, 1),
	(15, '2021-06-15', 2, 10, 1),
	(16, '2021-07-11', 2, 12, 2),
	(17, '2021-08-20', 2, 13, 2),
	(18, '2021-08-20', 2, 13, 2), 
	(19, '2021-11-09', 3, 14, 4),
	(20, '2021-11-20', 1, 15, 3),
	(21, '2021-12-20', 3, 17, 1),
	(22, '2021-12-21', 3, 17, 1), 
	(23, '2021-12-28', 3, 18, 1),
	(24, '2022-01-18', 1, 19, 5),
	(25, '2022-01-31', 2, 20, 2);

INSERT INTO Categories 
	VALUES 
    (1, 'Writing Supplies'),
	(2, 'Folders'),
	(3, 'Notebooks & Planners'),
	(4, 'Office Basics'),
	(5, 'Paper');

INSERT INTO Suppliers 
	VALUES
    (1, 'Platts R & F', '4546 Pritchard Court', 'Owatonna', 'Minnesota(MN)', 55060, '507-414-0611', 'waino19701976@gmail.com', 'plattsrf.com'),
    (2, 'Carphone Plus', '2543 Clement Street', 'Atlanta', 'Georgia(GA)', 30329, '404-445-9284', 'myles.luettg@gmail.com', 'carphoneplus.com'),
    (3, 'Claylote', '4312 Pleasant Hill Road', 'Los Angeles', 'California(CA)', 90017, '562-242-6356', 'chance1988@gmail.com', 'claylote.com'),
    (4, 'Omni-Werx Supplies', '4175 Berkshire Circle', 'Knoxville', 'Tennessee(TN)', 37921, '865-621-4235', 'leopoldo1985@yahoo.com', 'omniwerxsupplies.com');

INSERT INTO Products 
	VALUES 
    (1, 'Ballpoint Pen', 'Pilot Dr. Grip Center of Gravity Retractable Ballpoint Pen, Medium Point, Black Ink', 11.79, 233, 1, 4),
	(2, 'Gel-Ink Pen Refill', 'Pentel EnerGel Gel-Ink Pen Refill, Medium Needle Tip, Blue Ink, Each', 2.29, 319, 1, 2),
	(3, 'Rollerball Pen', 'uni-ball Vision Elite Rollerball Pen, Micro Point, Blue Ink', 4.29, 120, 1, 4),
	(4, 'Mechanical Pencil', 'Pentel Sharp Mechanical Pencil, No. 2 Medium Lead', 5.99, 131, 1, 2),
	(5, 'Automatic Pencil', 'Pentel Automatic Pencil, 0.5mm, Each', 3.29, 293, 1, 4),
	(6, 'Letter Size Two-Tone File Folder', 'Pendaflex Two-Tone File Folder, 3 Tab, Letter Size, Gray, 100/Box (PFX 152 1/3 GRA)', 24.99, 424, 2, 4),
	(7, 'Bright Assorted File Folders', 'Pendaflex Interior File Folders, 1/3 Cut Top Tab, Legal, Bright Assorted, 100/Box', 53.36, 270, 2, 4),
	(8, '1-Subject Notebook', '1-Subject Notebook, 8" x 10.5", Graph Ruled, 70 Sheets, Green', 2.99, 279, 3, 3),
	(9, 'Premium 3-Subject Notebook', 'Premium 3-Subject Notebook, 8.5" x 11", College Ruled, 150 Sheets, Black', 8.99, 180, 3, 1),
	(10, 'Weekly & Monthly Planner', 'Blue Sky 8.5" x 11" Weekly & Monthly Planner, Day Designer, Peyton White', 19.09, 472, 3, 3),
	(11, 'Weekly/Monthly Appointment Book', 'AT-A-GLANCE 8.5" x 11" Weekly/Monthly Appointment Book, QuickNotes, Black', 37.69, 159, 3, 2),
	(12, 'Stapler', 'Paper Modern Desktop Stapler, 10 Sheet Capacity, Lime Green', 16.99, 308, 4, 4),
	(13, 'Catalog Envelopes', 'Staples Clasp & Moistenable Glue Catalog Envelopes, 9"L x 12"H, Brown, 100/Box', 19.75, 73, 4, 4),
	(14, 'Elite Steel Scissors', 'Elite 8" Stainless Steel Scissors, Pointed Tip, Orange/Gray', 10.79, 165, 4, 1),
	(15, 'Cardstock Paper', 'Astrobrights Spectrum Cardstock Paper, 8.5" x 11", 65 lbs, Assorted Colors, 100/Pack', 13.79, 252, 5, 2),
	(16, 'Copy Plus Paper', 'Hammermill Copy Plus Paper, 8.5" x 11", 20 lbs., White, 500 Sheets/Ream, 10 Reams/Carton', 39.99, 406, 5, 4),
	(17, 'Premium Multipurpose Paper', 'Staples Premium Multipurpose Paper, 8.5" x 11", 24 lbs., Bright White, 500 Sheets/Ream, 5 Reams/Carton', 68.99, 82, 5, 1);

INSERT INTO OrderDetails 
	VALUES 
    (1, 3, 40, 171.60),
    (1, 5, 20, 65.80),
    (1, 17, 8, 551.92),
    (2, 1, 3, 35.37),
    (2, 4, 1, 5.99),
    (2, 11, 30, 1130.70),
    (2, 16, 2, 79.98),
	(3, 2, 40, 91.60),
    (3, 10, 8, 152.72),
	(4, 6, 18, 449.82),
	(5, 1, 50, 589.50),
    (5, 6, 7, 174.93),
    (5, 11, 8, 301.52),
	(5, 13, 1, 19.75),
    (6, 12, 3, 50.97),
	(6, 14, 1, 10.79),
    (6, 17, 5, 344.95),
    (7, 13, 10, 197.50),
	(8, 1, 22, 259.38),
    (8, 4, 30, 179.70),
    (8, 6, 4, 99.96),
    (8, 7, 1, 53.36),
    (9, 7, 1, 53.36),
	(9, 13, 5,98.75),
	(10, 2, 100, 229.00),
	(11, 8, 6, 17.94),
    (11, 14, 10, 107.90),
    (11, 15, 10, 137.90),
    (11, 16, 10, 399.90),
    (12, 4, 80, 479.20),
	(12, 10, 8, 152.72),
	(13, 4, 10, 59.90),
    (13, 5, 10, 32.90),
    (13, 10, 1, 19.09),
    (13, 13, 1, 19.75),
    (13, 15, 4, 55.16),
    (13, 17, 3, 206.97),
	(14, 6, 3, 74.97),
	(15, 8, 7, 20.93),
    (15, 9, 7, 62.93),
    (15, 12, 2, 33.98),
    (15, 16, 5, 199.95),
	(16, 1, 60, 707.40),
    (16, 9, 30, 269.70),
    (17, 1, 4, 47.16),
    (17, 5, 3, 9.87),
    (17, 10, 1, 19.09),
    (17, 12, 1, 16.99),
	(17, 13, 1, 19.75),
    (17, 16, 4, 159.96),
    (17, 17, 2, 137.98),
    (18, 7, 1, 53.36),
	(18, 8, 1, 2.99),
    (18, 9, 1, 8.99),
	(19, 2, 24, 54.96),
	(20, 2, 5, 11.45),
    (20, 12, 1, 16.99);

-- Calculate costs on each product and total sum of order using window function
SELECT OrderDetails.orderID AS orderID, 
Products.productID AS productID,
Products.productTitle AS product,
Products.productPrice AS price,
OrderDetails.orderedQuantity AS quantity,
OrderDetails.productSum AS product_sum,
SUM(Products.productPrice * OrderDetails.orderedQuantity) 
OVER(PARTITION BY orderID ORDER BY productID) 
AS total_sum
FROM Products JOIN OrderDetails 
ON Products.productID = OrderDetails.productID;

-- Select the name of processing employees who processed the order 
-- with payment method 'check', ordered by date of invoice
SELECT ProcessingEmployees.employeeFirstName AS first_name, 
ProcessingEmployees.employeeLastName AS last_name,
Invoices.invoiceID AS invoiceID,
Invoices.invoiceDate AS invoice_date,
PaymentMethods.paymentDescription AS payment_method
FROM ProcessingEmployees JOIN Orders
ON ProcessingEmployees.employeeID = Orders.processingEmployeeID
JOIN Invoices ON Orders.invoiceID = Invoices.invoiceID
JOIN PaymentMethods ON Invoices.paymentID = PaymentMethods.paymentID
WHERE PaymentMethods.paymentDescription = 'check'
ORDER BY invoice_date;

-- Calculate how many times shipping employee Juan Hernandez 
-- sent parcels to each customer, ordered by customerID
SELECT Customers.customerID AS customerID,
Customers.customerLastName AS customer,
COUNT(*) AS shipments,
ShippingEmployees.employeeID AS employeeID,
ShippingEmployees.employeeLastName AS employee
FROM Customers JOIN Shipments 
ON Customers.customerID = Shipments.customerID
JOIN ShippingEmployees 
ON Shipments.shippingEmployeeID = ShippingEmployees.employeeID
WHERE ShippingEmployees.employeeFirstName = 'Juan'  
AND  ShippingEmployees.employeeLastName = 'Hernandez'
GROUP BY customerID;

-- Select the categories of products which order was cancelled
SELECT DISTINCT Categories.categoryTitle AS category
FROM Orders JOIN OrderDetails 
ON Orders.orderID = OrderDetails.orderID
JOIN Products ON OrderDetails.productID = Products.productID
JOIN Categories ON Products.categoryID = Categories.categoryID
WHERE Orders.cancelled IS TRUE;

-- Select all the invoices and payment methods that customers 
-- Nakamura and Choudhury had
SELECT customerID, 
Customers.customerLastName AS customer,
Invoices.invoiceID AS invoice,
PaymentMethods.paymentDescription AS payment_method
FROM Customers LEFT JOIN Invoices 
USING (customerID)
LEFT JOIN PaymentMethods 
USING (paymentID)
WHERE Customers.customerLastName IN ('Nakamura', 'Choudhury');

-- Select supplier who supplies Notebooks from product category 
-- Notebooks & Planners if they are less than 200 using CTE
WITH notebookAndPlannerProducts AS (
    SELECT productID, productTitle, productPrice, quantityLeft, supplierID
    FROM Products
    WHERE categoryID = 3
) 

SELECT productID, productTitle, productPrice, quantityLeft, 
supplierName, supplierPhone, supplierEmail
FROM notebookAndPlannerProducts JOIN Suppliers
ON notebookAndPlannerProducts.supplierID = Suppliers.supplierID
WHERE productTitle LIKE '%Notebook%' 
AND quantityLeft < 200
ORDER BY productID;
