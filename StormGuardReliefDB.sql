CREATE DATABASE StormGuardReliefDB;
USE StormGuardReliefDB;

-- Tables

CREATE TABLE Hurricane (
    Event_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    Severity INT,
    Description TEXT,
    Start_Date DATE,
    End_Date DATE,
    Duration VARCHAR(20)
);

CREATE TABLE Location (
    Country_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Region VARCHAR(100),
    Latitude DECIMAL(8,4),
    Longitude DECIMAL(8,4)
);

CREATE TABLE Relief (
    Relief_id VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100),
    Type VARCHAR(50),
    Active VARCHAR(20),
    Description TEXT
);

CREATE TABLE Logistics (
    Logistics_id VARCHAR(10) PRIMARY KEY,
    Relief_id VARCHAR(10),
    Supply_Status VARCHAR(50),
    Delivery_Status VARCHAR(50),
    FOREIGN KEY (Relief_id) REFERENCES Relief(Relief_id)
);

CREATE TABLE Medical_Support (
    Med_id VARCHAR(10) PRIMARY KEY,
    Relief_id VARCHAR(10),
    Medicines_Provided TEXT,
    Patients_Care_Reports TEXT,
    FOREIGN KEY (Relief_id) REFERENCES Relief(Relief_id)
);

CREATE TABLE Volunteer (
    Volunteer_id VARCHAR(10) PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Role VARCHAR(50),
    Assigned_Region VARCHAR(100),
    Total_Volunteers INT
);

CREATE TABLE Administration (
    Admin_id VARCHAR(10) PRIMARY KEY,
    Volunteer_id VARCHAR(10),
    User_Role VARCHAR(50),
    Privileges TEXT,
    FOREIGN KEY (Volunteer_id) REFERENCES Volunteer(Volunteer_id)
);

CREATE TABLE Hurricane_Affects (
    Event_id VARCHAR(10),
    Country_id VARCHAR(10),
    PRIMARY KEY (Event_id, Country_id),
    FOREIGN KEY (Event_id) REFERENCES Hurricane(Event_id),
    FOREIGN KEY (Country_id) REFERENCES Location(Country_id)
);

CREATE TABLE Country_Requests_Relief (
    Country_id VARCHAR(10),
    Relief_id VARCHAR(10),
    PRIMARY KEY (Country_id, Relief_id),
    FOREIGN KEY (Country_id) REFERENCES Location(Country_id),
    FOREIGN KEY (Relief_id) REFERENCES Relief(Relief_id)
);

CREATE TABLE Volunteer_Relief (
    Volunteer_id VARCHAR(10),
    Relief_id VARCHAR(10),
    PRIMARY KEY (Volunteer_id, Relief_id),
    FOREIGN KEY (Volunteer_id) REFERENCES Volunteer(Volunteer_id),
    FOREIGN KEY (Relief_id) REFERENCES Relief(Relief_id)
);

-- Data Inserts

INSERT INTO Hurricane VALUES 
('H001', 'A', 4, 'Strong winds', '2024-06-01', '2024-06-05', '4 days'),
('H002', 'B', 3, 'Heavy rainfall', '2024-07-10', '2024-07-13', '3 days'),
('H003', 'C', 5, 'Catastrophic storm surge', '2024-08-20', '2024-08-25', '5 days'),
('H004', 'Diana', 2, 'Minimal damage but heavy rainfall', '2024-09-15', '2024-09-16', '1 day'),
('H005', 'Edward', 4, 'Strong winds and flooding', '2024-10-01', '2024-10-04', '3 days'),
('H006', 'Fiona', 3, 'Storm surge and flooding in coastal areas', '2024-11-01', '2024-11-05', '4 days'),
('H007', 'George', 5, 'Widespread devastation and high casualties', '2024-11-20', '2024-11-27', '7 days'),
('H008', 'Helena', 2, 'Short-lived tropical storm', '2025-01-05', '2025-01-06', '1 day'),
('H009', 'Isaac', 4, 'Structural damage and power outages', '2025-02-12', '2025-02-15', '3 days');

INSERT INTO Location VALUES 
('C001', 'USA', 'Florida', 27.6648, -81.5158),
('C002', 'Mexico', 'Yucatan', 20.6843, -88.5678),
('C003', 'Cuba', 'Havana', 23.1136, -82.3666),
('C004', 'Jamaica', 'Kingston', 17.9714, -76.7936),
('C005', 'Bahamas', 'Nassau', 25.0343, -77.3963),
('C006', 'Dominican Republic', 'Santo Domingo', 18.4861, -69.9312),
('C007', 'Puerto Rico', 'San Juan', 18.4655, -66.1057),
('C008', 'Honduras', 'Tegucigalpa', 14.0723, -87.1921),
('C009', 'Haiti', 'Port-au-Prince', 18.5944, -72.3074),
('C010', 'Belize', 'Belmopan', 17.2510, -88.7590);

INSERT INTO Relief VALUES 
('R001', 'Food Distribution', 'Food Aid', 'Active', 'Emergency food packages'),
('R002', 'Medical Assistance', 'Medical Aid', 'Completed', 'Doctors and nurses providing aid'),
('R003', 'Shelter Setup', 'Housing', 'Active', 'Temporary shelters for displaced people'),
('R004', 'Water Purification', 'Sanitation', 'Active', 'Clean drinking water systems'),
('R005', 'Power Restoration', 'Infrastructure', 'Ongoing', 'Temporary electricity support'),
('R006', 'Rescue Ops', 'Search and Rescue', 'Completed', 'Search operations and evacuations'),
('R007', 'Child Care Units', 'Welfare', 'Active', 'Orphaned children temporary housing'),
('R008', 'Communication Setup', 'Infrastructure', 'Ongoing', 'Satellite phones and towers'),
('R009', 'Fuel Delivery', 'Energy Support', 'Pending', 'Diesel and gas supply'),
('R010', 'Evacuation Transport', 'Transport', 'Completed', 'Buses and helicopters for evacuations');

INSERT INTO Logistics VALUES 
('L001', 'R001', 'In Transit', 'Pending'),
('L002', 'R002', 'Delivered', 'Completed'),
('L003', 'R003', 'Awaiting Dispatch', 'Not Started'),
('L007', 'R007', 'Dispatched', 'Ongoing'),
('L008', 'R008', 'Awaiting', 'Not Started'),
('L009', 'R009', 'In Transit', 'Ongoing'),
('L010', 'R010', 'Delivered', 'Completed');

INSERT INTO Medical_Support VALUES 
('M001', 'R002', 'Painkillers, Antibiotics', '12 Reports'),
('M002', 'R002', 'IV Fluids, Bandages', '8 Reports'),
('M003', 'R003', 'None', '0 Reports'),
('M006', 'R007', 'Pediatric Supplies', '9 Reports'),
('M007', 'R008', 'None', '0 Reports'),
('M008', 'R009', 'None', '1 Report'),
('M009', 'R010', 'Injury Reports', '7 Reports');

INSERT INTO Volunteer VALUES 
('V001', 'John', 'Doe', 'Field Vol', 'Florida', 50),
('V002', 'Alice', 'Smith', 'Admin', 'Yucatan', 30),
('V003', 'Luis', 'Martinez', 'Medical Staff', 'Havana', 20),
('V004', 'Sarah', 'Lee', 'Field Vol', 'Florida', 40),
('V009', 'Omar', 'Hassan', 'Field Vol', 'San Juan', 28),
('V010', 'Leila', 'Chavez', 'Medical Staff', 'Port-au-Prince', 34),
('V011', 'Tom', 'Ngugi', 'Admin', 'Tegucigalpa', 22),
('V012', 'Anna', 'Koenig', 'Psychologist', 'Belmopan', 19),
('V013', 'Ricardo', 'Fernandez', 'Logistics', 'San Juan', 31),
('V014', 'Fahima', 'Zahid', 'Medical Staff', 'Florida', 25),
('V015', 'Mohammed', 'Khan', 'Field Vol', 'Havana', 38);

INSERT INTO Administration VALUES 
('A001', 'V002', 'Manager', 'Full Access'),
('A002', 'V003', 'Medical Coordinator', 'Patient Data & Reports Access'),
('A004', 'V011', 'Site Coordinator', 'Relief Assignment Control'),
('A005', 'V012', 'Mental Health Lead', 'Therapy & Crisis Mgmt'),
('A006', 'V014', 'Clinic Supervisor', 'Medical Inventory Access');

INSERT INTO Hurricane_Affects VALUES 
('H001', 'C001'),
('H002', 'C002'),
('H003', 'C003'),
('H004', 'C003'),
('H005', 'C004'),
('H006', 'C007'), ('H006', 'C008'), 
('H007', 'C001'), ('H007', 'C004'), ('H007', 'C009'), 
('H008', 'C010'),
('H009', 'C005'), ('H009', 'C006'), ('H009', 'C008');

INSERT INTO Country_Requests_Relief VALUES 
('C001', 'R001'), ('C001', 'R003'), ('C001', 'R008'),
('C002', 'R002'),
('C003', 'R003'),
('C004', 'R009'),
('C007', 'R007'), ('C007', 'R004'),
('C008', 'R008'), ('C008', 'R001'), ('C008', 'R010'),
('C009', 'R006'), ('C009', 'R002'),
('C010', 'R003'), ('C010', 'R009');

INSERT INTO Volunteer_Relief VALUES 
('V001', 'R001'),
('V002', 'R002'),
('V003', 'R002'),
('V004', 'R003'),
('V009', 'R007'), ('V009', 'R004'),
('V010', 'R002'), ('V010', 'R006'), ('V010', 'R010'),
('V011', 'R008'),
('V012', 'R006'), ('V012', 'R007'),
('V013', 'R009'), ('V013', 'R001'),
('V014', 'R002'), ('V014', 'R005'),
('V015', 'R001'), ('V015', 'R003');
