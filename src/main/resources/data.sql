-- Création de la table Gateways
CREATE TABLE Gateways (
    id_gateway VARCHAR(50) PRIMARY KEY NOT NULL,
    commissioning_date DATE NOT NULL,
    status BOOLEAN NOT NULL,
    batiment_name VARCHAR(100) NOT NULL,
    etage INTEGER NOT NULL,
    emplacement VARCHAR(50) NULL
);

-- Insertion des valeurs dans la table Gateways
INSERT INTO Gateways (id_gateway, commissioning_date, status, batiment_name, etage, emplacement) VALUES
('gateway_001', '2023-01-01', TRUE, 'Batiment A', 1, 'Bureau 101'),
('gateway_002', '2023-02-01', TRUE, 'Batiment B', 2, 'Bureau 202'),
('gateway_003', '2023-03-01', FALSE, 'Batiment A', 3, 'Bureau 303'),
('gateway_004', '2023-04-01', TRUE, 'Batiment C', 1, 'Bureau 104'),
('gateway_005', '2023-05-01', TRUE, 'Batiment D', 2, 'Bureau 205'),
('gateway_006', '2023-06-01', FALSE, 'Batiment A', 1, 'Bureau 103'),
('gateway_007', '2023-07-01', TRUE, 'Batiment B', 2, 'Bureau 206'),
('gateway_008', '2023-08-01', FALSE, 'Batiment A', 3, 'Bureau 306'),
('gateway_009', '2023-09-01', TRUE, 'Batiment C', 1, 'Bureau 104'),
('gateway_010', '2023-10-01', FALSE, 'Batiment A', 2, 'Bureau 215');

-- Création de la table Sensors
CREATE TABLE Sensors (
    id_sensor VARCHAR(50) PRIMARY KEY NOT NULL,
    device_type VARCHAR(50) NOT NULL,
    commissioning_date DATE NOT NULL,
    status BOOLEAN NOT NULL,
    batiment_name VARCHAR(100) NOT NULL,
    etage INTEGER NOT NULL,
    emplacement VARCHAR(50) NULL,
    id_gateway VARCHAR(50) NULL,
    FOREIGN KEY (id_gateway) REFERENCES Gateways(id_gateway) ON DELETE SET NULL
);

-- Insertion des valeurs dans la table Sensors
INSERT INTO Sensors (id_sensor, device_type, commissioning_date, status, batiment_name, etage, emplacement, id_gateway) VALUES
('dev_eui_001', 'device_001', '2023-01-01', TRUE, 'Batiment A', 1, 'Bureau 101', 'gateway_001'),
('dev_eui_002', 'device_002', '2023-02-01', TRUE, 'Batiment B', 2, 'Bureau 202', 'gateway_002'),
('dev_eui_003', 'device_003', '2023-03-01', FALSE, 'Batiment A', 3, 'Bureau 303', 'gateway_001'),
('dev_eui_004', 'device_004', '2023-04-01', TRUE, 'Batiment C', 1, 'Bureau 104', 'gateway_003'),
('dev_eui_005', 'device_005', '2023-05-01', TRUE, 'Batiment D', 2, 'Bureau 205', 'gateway_004'),
('dev_eui_006', 'device_001', '2023-06-01', FALSE, 'Batiment E', 3, 'Bureau 306', 'gateway_005'),
('dev_eui_007', 'device_002', '2023-07-01', TRUE, 'Batiment A', 1, 'Bureau 107', 'gateway_001'),
('dev_eui_008', 'device_003', '2023-08-01', TRUE, 'Batiment B', 2, 'Bureau 208', 'gateway_002'),
('dev_eui_009', 'device_004', '2023-09-01', FALSE, 'Batiment C', 3, 'Bureau 309', 'gateway_003'),
('dev_eui_010', 'device_005', '2023-10-01', TRUE, 'Batiment D', 1, 'Bureau 110', 'gateway_004');

-- Création de la table Data_emsdesk
CREATE TABLE Data_emsdesk (
    id_sensor VARCHAR(50),
    timestamp DATE,
    humidity INTEGER,
    occupancy INTEGER,
    temperature REAL,
    PRIMARY KEY (id_sensor, timestamp),
    FOREIGN KEY (id_sensor) REFERENCES Sensors(id_sensor) ON DELETE CASCADE
);

-- Insertion des valeurs dans la table Data_emsdesk
INSERT INTO Data_emsdesk (id_sensor, timestamp, humidity, occupancy, temperature) VALUES
('dev_eui_001', '2023-01-01', 45, 1, 22.5),
('dev_eui_002', '2023-02-01', 50, 0, 21.0),
('dev_eui_003', '2023-03-01', 60, 1, 23.0),
('dev_eui_004', '2023-04-01', 55, 1, 24.0),
('dev_eui_005', '2023-05-01', 52, 0, 20.5),
('dev_eui_006', '2023-06-01', 48, 1, 22.0),
('dev_eui_007', '2023-07-01', 49, 1, 21.8),
('dev_eui_008', '2023-08-01', 51, 0, 23.3),
('dev_eui_009', '2023-09-01', 57, 1, 22.2),
('dev_eui_010', '2023-10-01', 55, 0, 20.0);

-- Création de la table Data_pirlight
CREATE TABLE Data_pirlight (
    id_sensor VARCHAR(50),
    timestamp DATE,
    light_statut INTEGER,
    pir_statut INTEGER,
    PRIMARY KEY (id_sensor, timestamp),
    FOREIGN KEY (id_sensor) REFERENCES Sensors(id_sensor) ON DELETE CASCADE
);

-- Insertion des valeurs dans la table Data_pirlight
INSERT INTO Data_pirlight (id_sensor, timestamp, light_statut, pir_statut) VALUES
('dev_eui_001', '2023-01-01', 1, 1),
('dev_eui_002', '2023-02-01', 0, 0),
('dev_eui_003', '2023-03-01', 1, 1),
('dev_eui_004', '2023-04-01', 1, 0),
('dev_eui_005', '2023-05-01', 0, 1),
('dev_eui_006', '2023-06-01', 1, 1),
('dev_eui_007', '2023-07-01', 0, 0),
('dev_eui_008', '2023-08-01', 1, 1),
('dev_eui_009', '2023-09-01', 0, 0),
('dev_eui_010', '2023-10-01', 1, 0);

-- Création de la table Signal
CREATE TABLE Signal (
    id_sensor VARCHAR(50),
    timestamp DATE,
    value_battery REAL,
    rssi INTEGER,
    fport INTEGER,
    fcntup INTEGER,
    snr REAL,
    fcntdown INTEGER,
    sf INTEGER,
    frequency_offset REAL,
    PRIMARY KEY (id_sensor, timestamp),
    FOREIGN KEY (id_sensor) REFERENCES Sensors(id_sensor) ON DELETE CASCADE
);

-- Insertion des valeurs dans la table Signal
INSERT INTO Signal (id_sensor, timestamp, value_battery, rssi, fport, fcntup, snr, fcntdown, sf, frequency_offset) VALUES
('dev_eui_001', '2023-01-01', 3.7, -90, 1, 10, 12.5, 5, 7, 0.5),
('dev_eui_002', '2023-02-01', 3.8, -85, 1, 11, 13.0, 4, 7, 0.6),
('dev_eui_003', '2023-03-01', 3.6, -80, 1, 12, 14.0, 6, 7, 0.4),
('dev_eui_004', '2023-04-01', 3.5, -95, 1, 13, 12.2, 7, 7, 0.3),
('dev_eui_005', '2023-05-01', 3.9, -87, 1, 14, 13.5, 5, 7, 0.7),
('dev_eui_006', '2023-06-01', 3.7, -82, 1, 15, 11.8, 8, 7, 0.5),
('dev_eui_007', '2023-07-01', 3.6, -84, 1, 16, 13.2, 9, 7, 0.6),
('dev_eui_008', '2023-08-01', 3.8, -88, 1, 17, 12.0, 10, 7, 0.4),
('dev_eui_009', '2023-09-01', 3.5, -86, 1, 18, 14.5, 11, 7, 0.5),
('dev_eui_010', '2023-10-01', 3.7, -83, 1, 19, 11.0, 12, 7, 0.6);

-- Création de la table Users
CREATE TABLE Users (
    id_user INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    username VARCHAR(50) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Insertion des valeurs dans la table Users
INSERT INTO Users (username, firstname, lastname, password, role, email) VALUES
('user1', 'John', 'Doe', 'password123', 'admin', 'john.doe@example.com'),
('user2', 'Jane', 'Smith', 'password123', 'user', 'jane.smith@example.com'),
('user3', 'Alice', 'Johnson', 'password123', 'office manager', 'alice.johnson@example.com'),
('user4', 'Bob', 'Brown', 'password123', 'user', 'bob.brown@example.com'),
('user5', 'Charlie', 'Davis', 'password123', 'admin', 'charlie.davis@example.com'),
('user6', 'David', 'Wilson', 'password123', 'user', 'david.wilson@example.com'),
('user7', 'Eva', 'Martinez', 'password123', 'user', 'eva.martinez@example.com'),
('user8', 'Frank', 'Taylor', 'password123', 'office manager', 'frank.taylor@example.com'),
('user9', 'Grace', 'Anderson', 'password123', 'user', 'grace.anderson@example.com'),
('user10', 'Hannah', 'Thomas', 'password123', 'admin', 'hannah.thomas@example.com');
