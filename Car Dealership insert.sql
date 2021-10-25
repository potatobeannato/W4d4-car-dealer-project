INSERT INTO customer(
        first_name,
        last_name,
        phone_number,
        address,
        city,
        states,
        country,
        zipcode
    )
VALUES(
        'Michael',
        'Meyer',
        '419-555-6789',
        '419 Meyer St',
        'Meyer Town',
        'CT',
        'U.S',
        '02169'
    ),
    (
        'Annabelle',
        'Doll',
        '333-636-6363',
        '333 Belle St',
        'Doll Town',
        'MA',
        'U.S',
        '02124'
    ),
    (
        'Jason',
        'Voorhees',
        '777-868-7686',
        '777 Voorhees St',
        'Voorhees Town',
        'CA',
        'U.S',
        '01986'
    ),
    (
        'Freddy',
        'Krueger',
        '685-153-4239',
        '685 Kreuger St',
        'Krueger Town',
        'MN',
        'U.S',
        '08546'
    ),
    (
        'Samara',
        'Morgan',
        '671-287-1549',
        '671 Morgan St',
        'Morgan Town',
        'WA',
        'U.S',
        '09518'
    )
INSERT INTO car(vin_number, make, model, color, years)
VALUES(
        'JN8DR07X41W504225',
        'Subaru',
        'WRX',
        'NightShadow',
        '2021'
    ),
    (
        '5NPDH4AE6FH528830',
        'Nissan',
        'GTR',
        'AbsoluteWhite',
        '2021'
    ),
    (
        'JTLKE50E881022647',
        'Toyota',
        'Supra',
        'IgnitionRed',
        '2021'
    ),
    (
        '1HGCP3F70BA087783',
        'Genesis',
        'G90',
        'CosmicBlue',
        '2021'
    ),
    (
        '1FMEU15N5KLA47347',
        'Mitsubishi',
        'Lancer Evolution',
        'DiamondChameleon',
        '2021'
    )
INSERT INTO salemen(first_name, last_name)
VALUES('John', 'Deckham'),
    ('Melon', 'Water'),
    ('Bana', 'Na'),
    ('Apple', 'Fiji'),
    ('Grape', 'Fruit')
INSERT INTO mechanic(first_name, last_name)
VALUES('Hard', 'Hammer'),
    ('Strong', 'Wrench'),
    ('Fast', 'Screwdriver'),
    ('Sharp', 'Drill'),
    ('Strudy', 'Lift')
INSERT INTO services(services_name, hour_charge)
VALUES('Oil Change', '40.00'),
    ('Tire Change', '60.00'),
    ('Fluid Change', '80.00'),
    ('Electrical Management', '90.00'),
    ('Engine Maintenance', '100.00')
INSERT INTO carparts(part_number, part_name, part_price)
VALUES('134875962', 'Oil Filter', '12.00'),
    ('587964312', 'Air Filter', '15.00'),
    ('123456789', 'Battery', '80.00'),
    ('785942136', 'Weather Matts', '100.00'),
    ('784521369', 'Break Rotors', '120.00')
ALTER TABLE carparts
ALTER COLUMN part_price TYPE NUMERIC(10, 2);
INSERT INTO invoice(invoice_number, car_id, customer_id, salemen_id)
VALUES('0001', 1, 1, 1),
    ('0002', 2, 2, 2),
    ('0003', 3, 3, 3),
    ('0004', 4, 4, 4),
    ('0005', 5, 5, 5)
INSERT INTO service_ticket(
        service_ticket_number,
        date_received,
        concerns,
        date_returned,
        customer_id,
        car_id
    )
VALUES(
        '1',
        '10/24/2021',
        'Change oil filter',
        '10/24/2021',
        1,
        1
    ),
    (
        '2',
        '10/24/2021',
        'Change air filter',
        '10/24/2021',
        2,
        2
    ),
    (
        '3',
        '10/24/2021',
        'Change battery',
        '10/24/2021',
        3,
        3
    ),
    (
        '4',
        '10/24/2021',
        'Put in new weather matts',
        '10/24/2021',
        4,
        4
    ),
    (
        '5',
        '10/24/2021',
        'Change break rotors',
        '10/24/2021',
        5,
        5
    )
INSERT INTO parts_used(
        amount_used,
        price,
        carparts_id,
        service_ticket_id
    )
VALUES('1', '10.00', 1, 1),
    ('2', '10.00', 2, 2),
    ('3', '10.00', 3, 3),
    ('4', '10.00', 4, 4),
    ('5', '10.00', 5, 5)
CREATE OR REPLACE PROCEDURE price(parts_used_id INTEGER, totalPrice DECIMAL) AS $$ BEGIN -- Add late fee to customer payment amount
UPDATE parts_used
SET price = part_price + totalPrice
WHERE service_ticket_id = parts_used_id;
-- Commit the above statement inside of a transaction
COMMIT;
END;
$$ LANGUAGE plpgsql;
CALL price(10.00);
INSERT INTO service_job(
        hour,
        concern,
        charge_total,
        service_ticket_id,
        service_id,
        mechanic_id
    )
VALUES('0.5', 'Complete', '42.00', 1, 1, 1),
    ('0.5', 'Complete', '35.00', 2, 2, 2),
    ('0.5', 'Complete', '135.00', 3, 3, 3),
    ('0.25', 'Complete', '115.00', 4, 4, 4),
    ('60.00', 'Compete', '190.00', 5, 5, 5)