CREATE TABLE worker (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_rate DECIMAL(5,2),
    phone_number VARCHAR(20)
);

INSERT INTO worker (id, first_name, last_name, hourly_rate, phone_number)
VALUES 
    (2, 'Yasir', 'Dahrejo', 15.00, '0300-123'),
    (3, 'Muzammil', 'Arain', 20, '0310-234');
