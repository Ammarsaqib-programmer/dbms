-- MySQL Database Project - Arain Foods 2025
CREATE DATABASE IF NOT EXISTS Arain_Foods;
SHOW DATABASES;
USE Arain_Foods;

-- Customers table with Pakistani names and partial phone numbers
CREATE TABLE Customers(
    CustomerID INT NOT NULL PRIMARY KEY, 
    FullName VARCHAR(100) NOT NULL, 
    PhoneNumber VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO Customers(CustomerID, FullName, PhoneNumber) VALUES 
(1, "Chaudhry Arain", "03001234513"), 
(2, "Mian Abdullah", "03331234513"), 
(3, "Bilal Arain", "03121234513"), 
(4, "Ayesha Arain", "03451234513"), 
(5, "Usman Arain", "03211234513"),     
(6, "Fatima Arain", "03001234613"),      
(7, "Zubair Arain", "03331234713"),      
(8, "Hina Arain", "03121234813"),      
(9, "Kamran Arain", "03451234913"),     
(10, "Sadia Arain", "03211234013");

SELECT * FROM Customers;

-- Bookings table for 2025
CREATE TABLE Bookings(
    BookingID INT, 
    BookingDate DATE,
    TableNumber INT, 
    NumberOfGuests INT,
    CustomerID INT
); 

INSERT INTO Bookings 
(BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) 
VALUES
(13, '2025-01-13', 7, 5, 1),  
(14, '2025-01-13', 5, 2, 2),  
(15, '2025-01-13', 3, 2, 4), 
(16, '2025-01-14', 2, 5, 5),  
(17, '2025-01-14', 5, 2, 6),  
(18, '2025-01-14', 3, 2, 7), 
(19, '2025-01-15', 3, 5, 1),  
(20, '2025-01-15', 5, 2, 2),  
(21, '2025-01-15', 3, 2, 4), 
(22, '2025-01-16', 7, 5, 6),  
(23, '2025-01-16', 5, 2, 3),  
(24, '2025-01-16', 3, 2, 4);

SELECT * FROM Bookings;

-- Courses table with Arain specialty dishes
CREATE TABLE Courses(
    CourseName VARCHAR(255) PRIMARY KEY, 
    Cost Decimal(6,2),
    SpiceLevel VARCHAR(20)
);

INSERT INTO Courses (CourseName, Cost, SpiceLevel) VALUES 
("Arain Special Karahi", 1350.50, 'Hot'), 
("Mian Daal Mash", 450.25, 'Medium'), 
("Chaudhry Biryani", 850.00, 'Hot'), 
("Arain Nihari", 600.50, 'Medium'), 
("Arain Seekh Kabab", 500.00, 'Hot'), 
("Arain Special Paya", 750.30, 'Medium'),
("Arain Haleem", 400.75, 'Mild'),
("Arain Kheer", 300.00, 'None');

SELECT * FROM Courses;

SHOW TABLES;

-- Filter data using WHERE clause for January 2025
SELECT * 
FROM Bookings 
WHERE BookingDate BETWEEN '2025-01-13' AND '2025-01-15';

-- JOIN Query for January 13, 2025
SELECT Customers.FullName, Bookings.BookingID 
FROM Customers RIGHT JOIN Bookings 
ON Customers.CustomerID = Bookings.CustomerID 
WHERE BookingDate = '2025-01-13';

-- GROUP BY Query for 2025 bookings
SELECT BookingDate, COUNT(BookingDate) AS TotalBookings
FROM Bookings 
GROUP BY BookingDate;

-- REPLACE Statement for updating Arain Special Karahi price
REPLACE INTO Courses (CourseName, Cost, SpiceLevel) VALUES ("Arain Special Karahi", 1500.00, 'Hot');
SELECT * FROM Courses;

-- DeliveryAddress table with Arain family areas
CREATE TABLE DeliveryAddress(     
    ID INT PRIMARY KEY,     
    Address VARCHAR(255) NOT NULL,     
    Type VARCHAR(100) NOT NULL DEFAULT "Home",     
    City VARCHAR(100) NOT NULL DEFAULT "Lahore",
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO DeliveryAddress VALUES
(13, "House 13, Arain Street, Model Town", "Home", "Lahore", 1),
(14, "Shop 13, Arain Market, Gulberg", "Commercial", "Lahore", 2),
(15, "Arain Farm House, Raiwind Road", "Farm", "Lahore", 3);

SHOW COLUMNS FROM DeliveryAddress;

-- Subquery for January 14, 2025 bookings
SELECT FullName 
FROM Customers 
WHERE (SELECT CustomerID FROM Bookings WHERE Customers.CustomerID = Bookings.CustomerID AND BookingDate = "2025-01-14");

-- Virtual Table for large bookings in January 2025
CREATE VIEW LargeBookings2025 AS 
SELECT BookingID, BookingDate, NumberOfGuests 
FROM Bookings 
WHERE NumberOfGuests > 3 AND BookingDate BETWEEN '2025-01-13' AND '2025-01-31';
SELECT * FROM LargeBookings2025;

-- Stored Procedure for 2025 bookings
CREATE PROCEDURE Get2025Bookings(InputDate DATE) 
SELECT * 
FROM Bookings 
WHERE BookingDate = InputDate;
CALL Get2025Bookings("2025-01-15");

-- String Function with Urdu text for Arain Foods
SELECT CONCAT("Booking ID: ", BookingID, ', Taareekh: ', BookingDate, ', Mehmaan: ', NumberOfGuests) 
AS "Arain Foods Booking Details" 
FROM Bookings;

-- Add Arain family special discount column
ALTER TABLE Customers ADD COLUMN FamilyDiscount DECIMAL(3,2) DEFAULT 0.10;
UPDATE Customers SET FamilyDiscount = 0.15 WHERE CustomerID IN (1, 2, 3); -- Chaudhry, Mian, Bilal get higher discount

-- View for Arain family members with discounts
CREATE VIEW ArainFamilyMembers AS
SELECT FullName, PhoneNumber, FamilyDiscount 
FROM Customers 
WHERE FullName LIKE '%Arain%';
SELECT * FROM ArainFamilyMembers;
