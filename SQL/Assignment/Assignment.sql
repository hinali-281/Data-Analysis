use da_2025;
CREATE TABLE company (
    company_id INT PRIMARY KEY,
    companay_name VARCHAR(45),
    street VARCHAR(45),
    city VARCHAR(45),
    state VARCHAR(10),
    zip VARCHAR(10)
);
CREATE TABLE contact (
    contact_id INT PRIMARY KEY,
    company_id INT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    street VARCHAR(45),
    city VARCHAR(45),
    state VARCHAR(10),
    zip VARCHAR(10),
    is_main BOOLEAN,
    email VARCHAR(45),
    phone VARCHAR(10),
    FOREIGN KEY (company_id)
        REFERENCES company (company_id)
);
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    salary DECIMAL(10 , 2 ),
    hiredate DATE,
    job_title VARCHAR(25),
    email VARCHAR(45),
    phone VARCHAR(12)
);
CREATE TABLE contact_employee (
    contact_employee_id INT PRIMARY KEY,
    contact_id INT,
    employee_id INT,
    contact_date DATE,
    description VARCHAR(100),
    FOREIGN KEY (contact_id)
        REFERENCES contact (contact_id),
    FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id)
);
INSERT INTO company (company_id, companay_name, street, city, state, zip) VALUES
(1, 'Urban Outfitters, Inc.', '5000 South Broad St', 'Philadelphia', 'PA', '19112'),
(2, 'Toll Brothers', '1140 Virginia Dr', 'Fort Washington', 'PA', '19034'),
(3, 'Apple Inc.', '1 Apple Park Way', 'Cupertino', 'CA', '95014'),
(4, 'Microsoft Corp.', 'One Microsoft Way', 'Redmond', 'WA', '98052'),
(5, 'Google LLC', '1600 Amphitheatre Pkwy', 'Mountain View', 'CA', '94043'),
(6, 'Amazon.com, Inc.', '410 Terry Ave N', 'Seattle', 'WA', '98109'),
(7, 'Facebook, Inc.', '1 Hacker Way', 'Menlo Park', 'CA', '94025'),
(8, 'Tesla, Inc.', '3500 Deer Creek Rd', 'Palo Alto', 'CA', '94304'),
(9, 'Netflix, Inc.', '121 Albright Way', 'Los Gatos', 'CA', '95032'),
(10, 'Nike, Inc.', 'One Bowerman Dr', 'Beaverton', 'OR', '97005'),
(11, 'Intel Corp.', '2200 Mission College Blvd', 'Santa Clara', 'CA', '95054'),
(12, 'IBM', '1 New Orchard Rd', 'Armonk', 'NY', '10504'),
(13, 'Oracle Corp.', '500 Oracle Pkwy', 'Redwood City', 'CA', '94065'),
(14, 'Adobe Inc.', '345 Park Ave', 'San Jose', 'CA', '95110'),
(15, 'Salesforce', '415 Mission St', 'San Francisco', 'CA', '94105'),
(16, 'Uber Technologies', '1455 Market St', 'San Francisco', 'CA', '94103'),
(17, 'Lyft Inc.', '185 Berry St', 'San Francisco', 'CA', '94107'),
(18, 'Airbnb, Inc.', '888 Brannan St', 'San Francisco', 'CA', '94103'),
(19, 'SpaceX', 'Rocket Rd', 'Hawthorne', 'CA', '90250'),
(20, 'Twitter, Inc.', '1355 Market St', 'San Francisco', 'CA', '94103');

INSERT INTO contact (contact_id, company_id, first_name, last_name, street, city, state, zip, is_main, email, phone) VALUES
(1, 1, 'John', 'Doe', '5000 South Broad St', 'Philadelphia', 'PA', '19112', TRUE, 'johndoe@urban.com', '2155551234'),
(2, 2, 'Alice', 'Smith', '1140 Virginia Dr', 'Fort Washington', 'PA', '19034', TRUE, 'alice@tollbrothers.com', '2155555678'),
(3, 3, 'Steve', 'Jobs', '1 Apple Park Way', 'Cupertino', 'CA', '95014', FALSE, 'steve@apple.com', '4085551234'),
(4, 4, 'Bill', 'Gates', 'One Microsoft Way', 'Redmond', 'WA', '98052', TRUE, 'bill@microsoft.com', '4255555678'),
(5, 5, 'Larry', 'Page', '1600 Amphitheatre Pkwy', 'Mountain View', 'CA', '94043', TRUE, 'larry@google.com', '6505559101'),
(6, 6, 'Jeff', 'Bezos', '410 Terry Ave N', 'Seattle', 'WA', '98109', TRUE, 'jeff@amazon.com', '2065557654'),
(7, 7, 'Mark', 'Zuckerberg', '1 Hacker Way', 'Menlo Park', 'CA', '94025', FALSE, 'mark@facebook.com', '6505551023'),
(8, 8, 'Elon', 'Musk', '3500 Deer Creek Rd', 'Palo Alto', 'CA', '94304', TRUE, 'elon@tesla.com', '6505556789'),
(9, 9, 'Reed', 'Hastings', '121 Albright Way', 'Los Gatos', 'CA', '95032', TRUE, 'reed@netflix.com', '4085553210'),
(10, 10, 'Phil', 'Knight', 'One Bowerman Dr', 'Beaverton', 'OR', '97005', TRUE, 'phil@nike.com', '5035558765'),
(11, 11, 'Pat', 'Gelsinger', '2200 Mission College Blvd', 'Santa Clara', 'CA', '95054', TRUE, 'pat@intel.com', '4085552345'),
(12, 12, 'Arvind', 'Krishna', '1 New Orchard Rd', 'Armonk', 'NY', '10504', TRUE, 'arvind@ibm.com', '9145556789'),
(13, 13, 'Safra', 'Catz', '500 Oracle Pkwy', 'Redwood City', 'CA', '94065', TRUE, 'safra@oracle.com', '6505559876'),
(14, 14, 'Shantanu', 'Narayen', '345 Park Ave', 'San Jose', 'CA', '95110', TRUE, 'shantanu@adobe.com', '4085556543'),
(15, 15, 'Marc', 'Benioff', '415 Mission St', 'San Francisco', 'CA', '94105', TRUE, 'marc@salesforce.com', '4155557890'),
(16, 16, 'Dara', 'Khosrowshahi', '1455 Market St', 'San Francisco', 'CA', '94103', TRUE, 'dara@uber.com', '4155554321'),
(17, 17, 'Logan', 'Green', '185 Berry St', 'San Francisco', 'CA', '94107', TRUE, 'logan@lyft.com', '4155552468'),
(18, 18, 'Brian', 'Chesky', '888 Brannan St', 'San Francisco', 'CA', '94103', TRUE, 'brian@airbnb.com', '4155551357'),
(19, 19, 'Gwynne', 'Shotwell', 'Rocket Rd', 'Hawthorne', 'CA', '90250', TRUE, 'gwynne@spacex.com', '3105559874'),
(20, 20, 'Linda', 'Yaccarino', '1355 Market St', 'San Francisco', 'CA', '94103', TRUE, 'linda@twitter.com', '4155558523');

INSERT INTO employee (employee_id, first_name, last_name, salary, hiredate, job_title, email, phone) VALUES
(1, 'Lesley', 'Bland', 75000.00, '2019-05-15', 'Manager', 'lesley.bland@example.com', '2155559901'),
(2, 'Jack', 'Lee', 62000.00, '2018-03-22', 'Engineer', 'jack.lee@example.com', '4155553311'),
(3, 'Dianne', 'Connor', 67000.00, '2020-01-12', 'Analyst', 'dianne.connor@example.com', '3125552255'),
(4, 'Sundar', 'Pichai', 150000.00, '2015-10-02', 'CEO', 'sundar.pichai@google.com', '6505552001'),
(5, 'Tim', 'Cook', 180000.00, '2011-08-24', 'CEO', 'tim.cook@apple.com', '4085553002'),
(6, 'Satya', 'Nadella', 175000.00, '2014-02-04', 'CEO', 'satya.nadella@microsoft.com', '4255554003'),
(7, 'Andy', 'Jassy', 160000.00, '2021-07-05', 'CEO', 'andy.jassy@amazon.com', '2065555004'),
(8, 'Sheryl', 'Sandberg', 130000.00, '2008-03-24', 'COO', 'sheryl@facebook.com', '6505556005'),
(9, 'Elon', 'Musk', 250000.00, '2004-02-01', 'CEO', 'elon.musk@tesla.com', '3105557006'),
(10, 'Reed', 'Hastings', 140000.00, '1997-08-29', 'CEO', 'reed.hastings@netflix.com', '4085558007'),
(11, 'Phil', 'Knight', 120000.00, '1964-01-25', 'Founder', 'phil.knight@nike.com', '5035559008'),
(12, 'Pat', 'Gelsinger', 135000.00, '2021-02-15', 'CEO', 'pat.gelsinger@intel.com', '4085551009'),
(13, 'Arvind', 'Krishna', 140000.00, '2020-04-06', 'CEO', 'arvind.krishna@ibm.com', '9145552010'),
(14, 'Safra', 'Catz', 145000.00, '2014-09-18', 'CEO', 'safra.catz@oracle.com', '6505553011'),
(15, 'Shantanu', 'Narayen', 138000.00, '2007-12-01', 'CEO', 'shantanu.narayen@adobe.com', '4085554012'),
(16, 'Marc', 'Benioff', 155000.00, '1999-02-03', 'CEO', 'marc.benioff@salesforce.com', '4155555013'),
(17, 'Dara', 'Khosrowshahi', 130000.00, '2017-08-30', 'CEO', 'dara.khosrowshahi@uber.com', '4155556014'),
(18, 'Logan', 'Green', 120000.00, '2012-06-01', 'CEO', 'logan.green@lyft.com', '4155557015'),
(19, 'Brian', 'Chesky', 135000.00, '2008-08-11', 'CEO', 'brian.chesky@airbnb.com', '4155558016'),
(20, 'Gwynne', 'Shotwell', 160000.00, '2002-10-01', 'President', 'gwynne.shotwell@spacex.com', '3105559017');

INSERT INTO contact_employee (contact_employee_id, contact_id, employee_id, contact_date, description) VALUES
(1, 1, 1, '2024-01-01', 'Initial business meeting with Google.'),
(2, 2, 2, '2024-01-03', 'Follow-up discussion with Apple on product collaboration.'),
(3, 3, 3, '2024-01-05', 'Meeting with Microsoft on cloud services.'),
(4, 4, 4, '2024-01-08', 'Amazon partnership discussion for AWS integration.'),
(5, 5, 5, '2024-01-10', 'Meta advertising strategy collaboration.'),
(6, 6, 6, '2024-01-12', 'Tesla supply chain and logistics discussion.'),
(7, 7, 7, '2024-01-14', 'Netflix content licensing agreement meeting.'),
(8, 8, 8, '2024-01-16', 'Nike product launch and branding collaboration.'),
(9, 9, 9, '2024-01-18', 'Intel hardware procurement negotiation.'),
(10, 10, 10, '2024-01-20', 'IBM cloud service and AI solutions discussion.'),
(11, 11, 11, '2024-01-22', 'Oracle database services partnership talk.'),
(12, 12, 12, '2024-01-24', 'Adobe creative software licensing deal.'),
(13, 13, 13, '2024-01-26', 'Salesforce CRM integration meeting.'),
(14, 14, 14, '2024-01-28', 'Uber ride-sharing technology improvement discussion.'),
(15, 15, 15, '2024-01-30', 'Lyft self-driving technology partnership talk.'),
(16, 16, 16, '2024-02-02', 'Airbnb short-term rental policy discussion.'),
(17, 17, 17, '2024-02-04', 'SpaceX satellite internet collaboration.'),
(18, 18, 18, '2024-02-06', 'Twitter advertising and engagement strategy meeting.'),
(19, 19, 19, '2024-02-08', 'Tesla solar energy product partnership discussion.'),
(20, 20, 20, '2024-02-10', 'Microsoft AI and machine learning development project.');

-- 4.In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800
set sql_safe_updates=0;  
update employee set phone='215-555-8800' where first_name="Lesley" and last_name="Bland";
set sql_safe_updates=1;  

--  5.In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters”
set sql_safe_updates=0;  
UPDATE company 
SET companay_name = 'Urban Outfitters' 
WHERE companay_name = 'Urban Outfitters, Inc.';
set sql_safe_updates=1;  

-- 6.In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement)
DELETE FROM contact_employee 
WHERE contact_id = (SELECT contact_id FROM contact WHERE first_name = 'Dianne' AND last_name = 'Connor') 
AND employee_id = (SELECT employee_id FROM employee WHERE first_name = 'Jack' AND last_name = 'Lee');

 -- 7.Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). 
SELECT e.employee_id, e.first_name,e.last_name, com.company_id, com.companay_name
FROM employee e
INNER JOIN contact_employee ce ON e.employee_id = ce.employee_id
INNER JOIN contact con ON ce.contact_id = con.contact_id
INNER JOIN company com ON con.company_id = com.company_id
WHERE com.companay_name = 'Toll Brothers';
-- result
-- 2	Jack	Lee	2	Toll Brothers


-- 8.What is the significance of “%” and “_” operators in the LIKE statement? 
-- >>>>>% (Percentage Sign) → Matches Zero, One, or Many Characters
-- >The % wildcard represents any number of characters, including zero characters.
-- It can be used before, after, or within a search pattern.
-- >EX.SELECT * FROM employee WHERE first_name LIKE 'J%';
-- >>>>>_ (Underscore) → Matches Exactly One Character
-- The _ wildcard represents exactly one character.
-- You can use multiple _ to match a specific number of characters
-- EX.SELECT * FROM employee WHERE first_name LIKE 'J_n';


-- 9.Explain normalization in the context of databases. 
-- 🔹 Normalization organizes data to reduce redundancy and improve efficiency by splitting large tables into smaller, related ones.
-- 🔹 It follows Normal Forms (NF) to ensure data integrity and eliminate anomalies (insertion, update, deletion errors).
-- >>>>>Why Normalize?
-- > Eliminates duplicate data
-- > Improves consistency & efficiency
-- > Avoids anomalies in data operations
-- > Normalization is essential for structured, optimized databases.alter


-- 10. What does a join in MySQL mean?  
--  🔹 JOIN in MySQL is used to combine data from multiple tables based on a related column (usually a foreign key).
--  🔹 It helps retrieve meaningful relationships between tables.
-- INNER JOIN >>Returns only matching records from both tables.
-- LEFT JOIN>>Returns all records from the left table and matching records from the right.
-- RIGHT JOIN>>Returns all records from the right table and matching records from the left.
-- FULL JOIN >>(Not in MySQL)	Returns all records when there's a match in either table (use UNION instead).


-- 11.What do you understand about DDL, DCL, and DML in MySQL? 
-- 	1.DDL (Data Definition Language) → Defines structure of database objects.
-- 		  Commands: CREATE, ALTER, DROP, TRUNCATE
-- 	2.DML (Data Manipulation Language) → Manages data in tables.
-- 		  Commands: INSERT, UPDATE, DELETE, SELECT
-- 	3.DCL (Data Control Language) → Controls user permissions & access.
-- 		  Commands: GRANT, REVOKE


-- 12.What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
--  🔹 JOIN in MySQL is used to combine data from multiple tables based on a related column (usually a foreign key).
--  🔹 It helps retrieve meaningful relationships between tables.
-- INNER JOIN >>Returns only matching records from both tables.
-- LEFT JOIN>>Returns all records from the left table and matching records from the right.
-- RIGHT JOIN>>Returns all records from the right table and matching records from the left.
-- FULL JOIN >>(Not in MySQL)	Returns all records when there's a match in either table (use UNION instead).






