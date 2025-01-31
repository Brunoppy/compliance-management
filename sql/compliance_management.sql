-- Create the database
CREATE DATABASE ComplianceManagement;
USE ComplianceManagement;

-- Table for Regulations and Policies
CREATE TABLE Regulations (
    regulation_id INT AUTO_INCREMENT PRIMARY KEY,
    regulation_name VARCHAR(255) NOT NULL,
    description TEXT,
    effective_date DATE NOT NULL,
    compliance_deadline DATE NOT NULL
);

-- Table for Audit Management
CREATE TABLE Audits (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    regulation_id INT,
    audit_type ENUM('Internal', 'External') NOT NULL,
    audit_date DATE NOT NULL,
    status ENUM('Pending', 'Completed', 'Non-Compliance') DEFAULT 'Pending',
    findings TEXT,
    FOREIGN KEY (regulation_id) REFERENCES Regulations(regulation_id)
);

-- Table for Mandatory Compliance Training
CREATE TABLE ComplianceTraining (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    training_name VARCHAR(255) NOT NULL,
    regulation_id INT,
    duration INT CHECK(duration > 0), -- Duration in hours
    validity_period INT CHECK(validity_period > 0), -- Validity in months
    FOREIGN KEY (regulation_id) REFERENCES Regulations(regulation_id)
);

-- Table for Employee Training Records
CREATE TABLE EmployeeTrainingRecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    training_id INT,
    completion_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    FOREIGN KEY (training_id) REFERENCES ComplianceTraining(training_id)
);

-- Insert Regulations
INSERT INTO Regulations (regulation_name, description, effective_date, compliance_deadline) VALUES
('GDPR', 'General Data Protection Regulation', '2018-05-25', '2025-12-31'),
('SOX', 'Sarbanes-Oxley Act', '2002-07-30', '2025-06-30');

-- Insert Audits
INSERT INTO Audits (regulation_id, audit_type, audit_date, status, findings) VALUES
(1, 'Internal', '2024-10-10', 'Pending', 'No irregularities found so far'),
(2, 'External', '2024-12-15', 'Non-Compliance', 'Incomplete financial documentation');

-- Insert Training Programs
INSERT INTO ComplianceTraining (training_name, regulation_id, duration, validity_period) VALUES
('Personal Data Protection', 1, 8, 12),
('Corporate Ethics and Governance', 2, 6, 24);

-- Insert Employee Training Records
INSERT INTO EmployeeTrainingRecords (employee_id, training_id, completion_date, expiration_date) VALUES
(3, 1, '2024-01-15', '2025-01-15'),
(5, 2, '2024-02-20', '2026-02-20');
