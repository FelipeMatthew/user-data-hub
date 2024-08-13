CREATE TABLE admin (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    phone VARCHAR(20)
);


INSERT INTO clients (first_name, last_name, email, age, phone)
VALUES
    ('Alice', 'Johnson', 'alice@example.com', 30, '123-456-7890'),
    ('Bob', 'Smith', 'bob@example.com', 25, '234-567-8901'),
    ('Charlie', 'Brown', 'charlie@example.com', 35, '345-678-9012');
