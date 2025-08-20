/*
Project: MiMedx Ticket Analysis
Author: Anahi Torres
Date: 07/2025
Purpose: 
 - Create a database and tickets table
     - Insert sample ticket data for Manufacturing dept
     - Analyze June 2025 issues by frequency
     - Identify top recurring issue categories
*/


-- create a table to show which issue had the most tickts for the month of June 2025, on JIRA cloud.
CREATE DATABASE mimedx_tickets; 				-- creating a new database named mimedx_tickets
USE mimedx_tickets;								-- any following commands should apply only to mimedx_tickets
CREATE TABLE tickets 							-- create table to store tix info
    (ticket_id INT AUTO_INCREMENT PRIMARY KEY,			-- Unique ID for each ticket that automatically increments
    department VARCHAR(50),									-- AKA allows numeric column in database table to automatically generate a unique, seq value each time a new row is inserted
    issue_category VARCHAR(100),				-- stores dept name up to 50 characters & issue up to 100 characters
    date_opened DATE							-- stores the date the ticket was opened.
);
-- A table is like a spreadsheet where each row is a ticket and columns are ticket details.


-- Need data in the table to run queires, like counting issues or generating reports
-- inserting initial ticket records
INSERT INTO tickets (department, issue_category, date_opened)  -- adds multiple rows (tickets) into tickets table
VALUES
('Manufacturing', 'Data correction- other', '2025-06-01'), 		-- adding depts, issue type and date created.
('Manufacturing', 'Donor hold/ release', '2025-06-02'),
('Manufacturing', 'Donor name correction', '2025-06-03'),
('Manufacturing', 'Donor product type correction', '2025-06-04'),
('Manufacturing', 'Donor rejection issue', '2025-06-05'),
('Manufacturing', 'Donor remove/delete', '2025-06-06'),
('Manufacturing', 'Donor site correction', '2025-06-07'),
('Manufacturing', 'Donor to paperless', '2025-06-08'),
('Manufacturing', 'Equipment selected correction', '2025-06-09'),
('Manufacturing', 'Label issue', '2025-06-10'),
('Manufacturing', 'Label reprint request', '2025-06-11'),
('Manufacturing', 'Lyo run correction', '2025-06-12'),
('Manufacturing', 'RFI correction', '2025-06-13'),
('Manufacturing', 'Tissue code correction', '2025-06-14'),
('Manufacturing', 'Serology correction', '2025-06-15'),
('Manufacturing', 'Signature issue', '2025-06-16'),
('Manufacturing', 'Transfer issue', '2025-06-17'),
('Manufacturing', 'Other', '2025-06-18');

-- count tickets per issues for June 2025
SELECT issue_category, COUNT(*) AS total_issues		-- shows each issue_category and how many tickets fall under it
FROM tickets										-- look into the tickets table
WHERE department = 'Manufacturing'					-- only consider tickets from Manufacturing dept from June 2025
  AND MONTH(date_opened) = 6
  AND YEAR(date_opened) = 2025
GROUP BY issue_category								-- group tickets by issue type so we can count them
ORDER BY total_issues DESC							-- sort from most tickets to least
LIMIT 1;											-- only show the top issue

-- This helps identify the single most common issue in June 2025 for Manufacturing


-- re-create table if it doesnt exist
-- prevents erors if the table already exists
CREATE TABLE IF NOT EXISTS tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    department VARCHAR(50),
    issue_category VARCHAR(100),
    date_opened DATE
);

-- show all tables in the database to keep checking work
USE mimedx_tickets;
SHOW TABLES;

-- Get the top 3 issues in June 2025
-- same as previous query except limit to 3
SELECT issue_category, COUNT(*) AS total_issues
FROM tickets
WHERE department = 'Manufacturing'
  AND MONTH(date_opened) = 6    -- June
  AND YEAR(date_opened) = 2025
GROUP BY issue_category
ORDER BY total_issues DESC
LIMIT 3;

-- insert more tickets ( additional data)
-- adds more tickets to have a bigger dataset
-- in future should have a file already with big data and will not have to manually import it next time
INSERT INTO tickets (department, issue_category, date_opened) VALUES
('Manufacturing', 'Donor Record Correction', '2025-06-01'),
('Manufacturing', 'Manufacturing Software Support', '2025-06-02'),
('Manufacturing', 'Donor Corrective Action Request', '2025-06-03'),
('Manufacturing', 'SBWeb Software Issue Reported', '2025-06-04'),
('Manufacturing', 'Data Correction - Other', '2025-06-05'),
('Manufacturing', 'Donor remove/delete', '2025-06-06'),
('Manufacturing', 'Label reprint request', '2025-06-07'),
('Manufacturing', 'Equipment selected correction', '2025-06-08'),
('Manufacturing', 'Donor name correction', '2025-06-09'),
('Manufacturing', 'Label issue', '2025-06-10'),

('Manufacturing', 'Donor Record Correction', '2025-06-11'),
('Manufacturing', 'Manufacturing Software Support', '2025-06-12'),
('Manufacturing', 'Donor Corrective Action Request', '2025-06-13'),
('Manufacturing', 'SBWeb Software Issue Reported', '2025-06-14'),
('Manufacturing', 'Data Correction - Other', '2025-06-15'),
('Manufacturing', 'Donor remove/delete', '2025-06-16'),
('Manufacturing', 'Label reprint request', '2025-06-17'),
('Manufacturing', 'Equipment selected correction', '2025-06-18'),
('Manufacturing', 'Donor name correction', '2025-06-19'),
('Manufacturing', 'Label issue', '2025-06-20'),

('Manufacturing', 'Donor Record Correction', '2025-06-21'),
('Manufacturing', 'Manufacturing Software Support', '2025-06-22'),
('Manufacturing', 'Donor Corrective Action Request', '2025-06-23'),
('Manufacturing', 'SBWeb Software Issue Reported', '2025-06-24'),
('Manufacturing', 'Data Correction - Other', '2025-06-25'),
('Manufacturing', 'Donor remove/delete', '2025-06-26'),
('Manufacturing', 'Label reprint request', '2025-06-27'),
('Manufacturing', 'Equipment selected correction', '2025-06-28'),
('Manufacturing', 'Donor name correction', '2025-06-29'),
('Manufacturing', 'Label issue', '2025-06-30');

-- count the top 3 issues again afer adding more tickets
-- recalcuate the top 3 issues for June 2025 using the larger dataset
SELECT issue_category, COUNT(*) AS total_issues
FROM tickets
WHERE department = 'Manufacturing'
  AND MONTH(date_opened) = 6    -- June
  AND YEAR(date_opened) = 2025
GROUP BY issue_category
ORDER BY total_issues DESC
LIMIT 3;

-- count all tickets per issue
-- shows the total number of tickets per issue for the manufacturing dept, ignoring the date if it had other dates other than June
-- gives complete picture of the most frequent issues overall.
SELECT issue_category, COUNT(*) AS total_tickets
FROM tickets
WHERE department = 'Manufacturing'
GROUP BY issue_category
ORDER BY total_tickets DESC;


/* summary:
- Create a database > create a table > insert data > analyze dta with SELECT and GROUP BY
- Filter by department, month, or year
- ORDER BY, DECS, and LIMIT helps identify top issues
- SHOW tables and CREATE TABLE IF NOT EXISTS are safety checks.

End of script
Purpose:
1. The top issue in June 2025
2. The top 3 issues in JUne 2025
3. Overall issue frequency across Manufacturing tickets
*/
