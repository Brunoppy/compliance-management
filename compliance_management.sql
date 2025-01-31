-- Criar o banco de dados
CREATE DATABASE ComplianceManagement;
USE ComplianceManagement;

-- Tabela de Normas e Regulamentações
CREATE TABLE Regulations (
    regulation_id INT AUTO_INCREMENT PRIMARY KEY,
    regulation_name VARCHAR(255) NOT NULL,
    description TEXT,
    effective_date DATE NOT NULL,
    compliance_deadline DATE NOT NULL
);

-- Tabela de Auditorias
CREATE TABLE Audits (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    regulation_id INT,
    audit_type ENUM('Interna', 'Externa') NOT NULL,
    audit_date DATE NOT NULL,
    status ENUM('Pendente', 'Concluída', 'Não Conformidade') DEFAULT 'Pendente',
    findings TEXT,
    FOREIGN KEY (regulation_id) REFERENCES Regulations(regulation_id)
);

-- Tabela de Treinamentos Obrigatórios
CREATE TABLE ComplianceTraining (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    training_name VARCHAR(255) NOT NULL,
    regulation_id INT,
    duration INT CHECK(duration > 0), -- Duração em horas
    validity_period INT CHECK(validity_period > 0), -- Validade em meses
    FOREIGN KEY (regulation_id) REFERENCES Regulations(regulation_id)
);

-- Tabela de Registros de Treinamento dos Funcionários
CREATE TABLE EmployeeTrainingRecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    training_id INT,
    completion_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    FOREIGN KEY (training_id) REFERENCES ComplianceTraining(training_id)
);

-- Inserindo Normas e Regulamentações
INSERT INTO Regulations (regulation_name, description, effective_date, compliance_deadline) VALUES
('LGPD', 'Lei Geral de Proteção de Dados', '2020-09-18', '2025-12-31'),
('SOX', 'Lei Sarbanes-Oxley', '2002-07-30', '2025-06-30');

-- Inserindo Auditorias
INSERT INTO Audits (regulation_id, audit_type, audit_date, status, findings) VALUES
(1, 'Interna', '2024-10-10', 'Pendente', 'Nenhuma irregularidade encontrada até o momento'),
(2, 'Externa', '2024-12-15', 'Não Conformidade', 'Falta de documentação contábil completa');

-- Inserindo Treinamentos
INSERT INTO ComplianceTraining (training_name, regulation_id, duration, validity_period) VALUES
('Proteção de Dados Pessoais', 1, 8, 12),
('Ética e Governança Corporativa', 2, 6, 24);

-- Inserindo Registros de Treinamento dos Funcionários
INSERT INTO EmployeeTrainingRecords (employee_id, training_id, completion_date, expiration_date) VALUES
(3, 1, '2024-01-15', '2025-01-15'),
(5, 2, '2024-02-20', '2026-02-20');
