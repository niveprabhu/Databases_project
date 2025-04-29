-- Create Database
CREATE DATABASE StormGuardReliefDB;

# Tables

-- Hurricane
CREATE TABLE Hurricane (
    Event_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    Severity INT,
    Description TEXT,
    Start_Date DATE,
    End_Date DATE,
    Duration VARCHAR(20)
);

-- Location
CREATE TABLE Location (
    Country_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Region VARCHAR(100),
    Latitude DECIMAL(8,4),
    Longitude DECIMAL(8,4)
);

-- Relif
CREATE TABLE Relief (
    Relief_id VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100),
    Type VARCHAR(50),
    Active VARCHAR(20),
    Description TEXT
);

-- Logistics (depends on Relif)
CREATE TABLE Logistics (
    Logistics_id VARCHAR(10) PRIMARY KEY,
    Relief_id VARCHAR(10),
    Supply_Status VARCHAR(50),
    Delivery_Status VARCHAR(50),
    FOREIGN KEY (Relief_id) REFERENCES Relief(Relief_id)
);

-- Medical_Support (depends on Relif)
CREATE TABLE Medical_Support (
    Med_id VARCHAR(10) PRIMARY KEY,
    Relief_id VARCHAR(10),
    Medicines_Provided TEXT,
    Patients_Care_Reports TEXT,
    FOREIGN KEY (Relief_id) REFERENCES Relief(Relief_id)
);

-- Volunteer
CREATE TABLE Volunteer (
    Volunteer_id VARCHAR(10) PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Role VARCHAR(50),
    Assigned_Region VARCHAR(100),
    Total_Volunteers INT
);

-- Adminstration (specialized from Volunteer)
CREATE TABLE Administration (
    Admin_id VARCHAR(10) PRIMARY KEY,
    Volunteer_id VARCHAR(10),
    User_Role VARCHAR(50),
    Privileges TEXT,
    FOREIGN KEY (Volunteer_id) REFERENCES Volunteer(Volunteer_id)
);

# Relationships

-- Hurricane Affects Country (1:M)
CREATE TABLE Hurricane_Affects (
    Event_id VARCHAR(10),
    Country_id VARCHAR(10),
    PRIMARY KEY (Event_id, Country_id),
    FOREIGN KEY (Event_id) REFERENCES Hurricane(Event_id),
    FOREIGN KEY (Country_id) REFERENCES Location(Country_id)
);

-- Country Requests Relief (M:N)
CREATE TABLE Country_Requests_Relief (
    Country_id VARCHAR(10),
    Relief_id VARCHAR(10),
    PRIMARY KEY (Country_id, Relief_id),
    FOREIGN KEY (Country_id) REFERENCES Location(Country_id),
    FOREIGN KEY (Relief_id) REFERENCES Relief(Relief_id)
);

-- Volunteer Supports Relief (M:N)
CREATE TABLE Volunteer_Relief (
    Volunteer_id VARCHAR(10),
    Relief_id VARCHAR(10),
    PRIMARY KEY (Volunteer_id, Relief_id),
    FOREIGN KEY (Volunteer_id) REFERENCES Volunteer(Volunteer_id),
    FOREIGN KEY (Relief_id) REFERENCES Relief(Relief_id)
);

# Data Inserts

-- Hurricane 
INSERT INTO Hurricane VALUES 
('H001', 'A', 4, 'Strong winds', '2024-06-01', '2024-06-05', '4 days'),
('H002', 'B', 3, 'Heavy rainfall', '2024-07-10', '2024-07-13', '3 days'),
('H003', 'C', 5, 'Catastrophic storm surge', '2024-08-20', '2024-08-25', '5 days');

-- Location
INSERT INTO Location VALUES 
('C001', 'USA', 'Florida', 27.6648, -81.5158),
('C002', 'Mexico', 'Yucatan', 20.6843, -88.5678),
('C003', 'Cuba', 'Havana', 23.1136, -82.3666);

-- Relief
INSERT INTO Relief VALUES 
('R001', 'Food Distribution', 'Food Aid', 'Active', 'Emergency food packages'),
('R002', 'Medical Assistance', 'Medical Aid', 'Completed', 'Doctors and nurses providing aid'),
('R003', 'Shelter Setup', 'Housing', 'Active', 'Temporary shelters for displaced people');

-- Logistics
INSERT INTO Logistics VALUES 
('L001', 'R001', 'In Transit', 'Pending'),
('L002', 'R002', 'Delivered', 'Completed'),
('L003', 'R003', 'Awaiting Dispatch', 'Not Started');

-- Medical_Support
INSERT INTO Medical_Support VALUES 
('M001', 'R002', 'Painkillers, Antibiotics', '12 Reports'),
('M002', 'R002', 'IV Fluids, Bandages', '8 Reports'),
('M003', 'R003', 'None', '0 Reports');

-- Volunteer
INSERT INTO Volunteer VALUES 
('V001', 'John', 'Doe', 'Field Vol', 'Florida', 50),
('V002', 'Alice', 'Smith', 'Admin', 'Yucatan', 30),
('V003', 'Luis', 'Martinez', 'Medical Staff', 'Havana', 20),
('V004', 'Sarah', 'Lee', 'Field Vol', 'Florida', 40);

-- Administration
 INSERT INTO Administration VALUES 
('A001', 'V002', 'Manager', 'Full Access'),
('A002', 'V003', 'Medical Coordinator', 'Patient Data & Reports Access');

-- Hurricane Affects
INSERT INTO Hurricane_Affects VALUES 
('H001', 'C001'),
('H002', 'C002'),
('H003', 'C003');

-- Country_Requests
INSERT INTO Country_Requests_Relief VALUES 
('C001', 'R001'),
('C001', 'R003'),
('C002', 'R002'),
('C003', 'R003');

-- Volunteer_Supports
INSERT INTO Volunteer_Relief VALUES 
('V001', 'R001'),
('V002', 'R002'),
('V003', 'R002'),
('V004', 'R003');


