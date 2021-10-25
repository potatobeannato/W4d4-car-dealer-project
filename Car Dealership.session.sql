CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(100),
    address VARCHAR(250),
    city VARCHAR(250),
    states VARCHAR (250),
    country VARCHAR (250),
    zipcode VARCHAR(100)
);
CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    vin_number VARCHAR(100),
    make VARCHAR(100),
    model VARCHAR(100),
    color VARCHAR(100),
    years VARCHAR(100)
);
CREATE TABLE salemen(
    salemen_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);
CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);
CREATE TABLE services(
    service_id SERIAL PRIMARY KEY,
    services_name VARCHAR(100),
    hour_charge NUMERIC(12, 2)
);
CREATE TABLE carparts(
    carparts_id SERIAL PRIMARY KEY,
    part_number VARCHAR(100),
    part_name VARCHAR(100),
    part_price VARCHAR(100)
);
CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    invoice_number VARCHAR(100),
    invoice_date DATE,
    customer_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    salemen_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY(car_id) REFERENCES car(car_id) ON DELETE CASCADE,
    FOREIGN KEY(salemen_id) REFERENCES salemen(salemen_id) ON DELETE CASCADE
);
CREATE TABLE service_ticket(
    service_ticket_id SERIAL PRIMARY KEY,
    service_ticket_number VARCHAR(100),
    date_received DATE,
    concerns VARCHAR(250),
    date_returned DATE,
    customer_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY(car_id) REFERENCES car(car_id) ON DELETE CASCADE
);
CREATE TABLE service_job(
    service_job_id SERIAL PRIMARY KEY,
    hour NUMERIC(10, 2),
    concern VARCHAR(200),
    charge_total NUMERIC(12, 2),
    mechanic_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    service_ticket_id INTEGER NOT NULL,
    FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id) ON DELETE CASCADE,
    FOREIGN KEY(service_id) REFERENCES services(service_id) ON DELETE CASCADE,
    FOREIGN KEY(service_ticket_id) REFERENCES service_ticket(service_ticket_id) ON DELETE CASCADE
);
CREATE TABLE parts_used(
    parts_used_id SERIAL PRIMARY KEY,
    amount_used NUMERIC(8, 2),
    price NUMERIC(10, 2),
    carparts_id INTEGER NOT NULL,
    service_ticket_id INTEGER NOT NULL,
    FOREIGN KEY(carparts_id) REFERENCES carparts(carparts_id) ON DELETE CASCADE,
    FOREIGN KEY(service_ticket_id) REFERENCES service_ticket(service_ticket_id) ON DELETE CASCADE
);