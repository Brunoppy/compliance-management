# Compliance Management System

## Overview
The **Compliance Management System** is a structured SQL database designed to track corporate regulatory requirements, audits, compliance training, and employee training records. This database ensures adherence to policies like **GDPR** and **SOX**, enabling smooth compliance operations.

## Database Structure
- **Regulations**: Stores compliance regulations and policies.
- **Audits**: Tracks internal and external audits.
- **Compliance Training**: Manages mandatory training related to regulations.
- **Employee Training Records**: Keeps records of employee participation in compliance training.

## Tables & Relationships
- Each **Audit** is linked to a **Regulation**.
- Each **Compliance Training** is tied to a **Regulation**.
- **Employee Training Records** store training completion details.

## Sample Data
The database includes **sample data** for:
- Regulations (GDPR, SOX)
- Audits (Internal and External)
- Training Programs
- Employee Training Records

## How to Use
1. **Create Database and Tables**:
   ```sql
   CREATE DATABASE ComplianceManagement;
   USE ComplianceManagement;
