-- ##############################################################
--          3NF JUSTIFICATION FOR RELATIONAL SCHEMA
-- ##############################################################

-- R1(holidaycode, cost)
-- Candidate Key: holidaycode
-- Functional Dependency: holidaycode → cost
-- No partial or transitive dependency.
-- All non-prime attributes (only cost) depend only on the primary key.
-- R1 is in 3NF

-- R2(airportcode, airportname)
-- Candidate Key: airportcode
-- Functional Dependency: airportcode → airportname
-- airportname depends only on the key, no transitive dependency.
-- R2 is in 3NF

-- R3(agentcode, agentname)
-- Candidate Key: agentcode
-- Functional Dependency: agentcode → agentname
-- No derived attributes or transitive dependencies.
-- R3 is in 3NF

-- R4(batchno, agentno, holidaycode, airportcode, quantitybooked)
-- Composite Key Assumption: (batchno, holidaycode, airportcode)
-- Functional Dependencies:
--   - quantitybooked depends on (batchno, holidaycode, airportcode)
--   - agentno is included per batch (batchno → agentno)
--   - agentname is stored separately in R3, so no violation here.
-- All non-key attributes are dependent on the full primary key.
-- R4 is in 3NF

-- Final Verdict:
-- All relations R1, R2, R3, and R4 are in Third Normal Form (3NF)
-- They satisfy the condition: 
-- Every non-prime attribute is non-transitively and fully functionally dependent on the whole key.

-- ##############################################################
-- QUESTION i [3NF]

-- 1. Creating and Populating the 3NF Tables

-- R1: Holidays
CREATE TABLE Holidays (
    holidaycode VARCHAR(10) PRIMARY KEY,
    cost INT
);

INSERT INTO Holidays VALUES
('B563', 363),
('B248', 248),
('B428', 322),
('C930', 568),
('A270', 972),
('B728', 248),
('A430', 279);

-- R2: Airports
CREATE TABLE Airports (
    airportcode INT PRIMARY KEY,
    airportname VARCHAR(50)
);

INSERT INTO Airports VALUES
(1, 'Luton'),
(12, 'Edinburgh'),
(11, 'Glasgow'),
(14, 'Newcastle');

-- R3: Agents
CREATE TABLE Agents (
    agentno INT PRIMARY KEY,
    agentname VARCHAR(50)
);

INSERT INTO Agents VALUES
(76, 'Bairns travel'),
(142, 'Active Holidays');

-- R4: Bookings
CREATE TABLE Bookings (
    batchno INT,
    agentno INT,
    holidaycode VARCHAR(10),
    airportcode INT,
    quantitybooked INT,
    PRIMARY KEY (batchno, holidaycode, airportcode),
    FOREIGN KEY (agentno) REFERENCES Agents(agentno),
    FOREIGN KEY (holidaycode) REFERENCES Holidays(holidaycode),
    FOREIGN KEY (airportcode) REFERENCES Airports(airportcode)
);

INSERT INTO Bookings VALUES
(1, 76, 'B563', 1, 10),
(1, 76, 'B248', 12, 20),
(1, 76, 'B428', 11, 18),
(2, 142, 'B563', 1, 15),
(2, 142, 'C930', 14, 2),
(2, 142, 'A270', 14, 1),
(2, 142, 'B728', 12, 5),
(3, 76, 'C930', 1, 11),
(3, 76, 'A430', 11, 15);

-- 2. Creating a view AgentHolidaySummary

CREATE VIEW AgentHolidaySummary AS
SELECT 
    a.agentname,
    b.holidaycode,
    h.cost,
    b.quantitybooked,
    ap.airportname,
    b.batchno,
    (h.cost * b.quantitybooked) AS totalcost
FROM 
    Bookings b
JOIN Agents a ON b.agentno = a.agentno
JOIN Holidays h ON b.holidaycode = h.holidaycode
JOIN Airports ap ON b.airportcode = ap.airportcode;

SELECT * FROM AgentHolidaySummary;

