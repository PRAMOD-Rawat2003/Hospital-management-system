--create database Hospital_Management_system

--Here’s the order in which you should create the tables for the Hospital Management System:

 --Rooms
--Ward Boys
--Medical Stores
--Patients (references Rooms)
--Doctors (references Rooms)
--Nurses (references Ward Boys)
--Admissions (references Patients, Doctors, Rooms)
--Discharge Summaries (references Patients, Doctors)
--Treatments (references Patients, Doctors)
--By creating the tables in this order, you ensure that all foreign key references are to tables that already exist.
select * from Patients
select * from WardBoys
select * from MedicalStores
select * from Doctors
select * from Nurses
select * from Admissions
select * from DischargeSummaries
select * from Treatments
select * from Rooms

--Patient table
CREATE TABLE Patients( PatientID INT PRIMARY KEY, 
Name VARCHAR(100) NOT NULL, 
Age INT CHECK (Age > 0), 
Gender CHAR(1) CHECK (Gender IN ('M', 'F')), 
Address VARCHAR(255), 
Phone VARCHAR(15), 
Email VARCHAR(100) UNIQUE, 
MedicalHistory TEXT, 
CurrentTreatment VARCHAR(255), 
RoomID INT, 
FOREIGN KEY (RoomID)REFERENCES Rooms(RoomID))


select * from Patients


--Doctore table
CREATE TABLE Doctors ( DoctorID INT PRIMARY KEY, 
Name VARCHAR(100) NOT NULL, 
Specialization VARCHAR(100), 
Phone VARCHAR(15), 
Email VARCHAR(100) UNIQUE, 
Department VARCHAR(100), 
RoomID INT, 
FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID) )

Nurses
CREATE TABLE Nurses ( NurseID INT PRIMARY KEY, 
Name VARCHAR(100) NOT NULL, 
Phone VARCHAR(15), 
Email VARCHAR(100) UNIQUE, 
DutyShift VARCHAR(50), 
WardBoyID INT, 
FOREIGN KEY (WardBoyID) REFERENCES WardBoys(WardBoyID))

--Admission table
CREATE TABLE Admissions ( 
AdmissionID INT PRIMARY KEY, 
PatientID INT, 
DoctorID INT, 
AdmissionDate DATE, 
Reason VARCHAR(255), 
RoomID INT, 
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID), 
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID), 
FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID))


--Discharge table
CREATE TABLE DischargeSummaries ( 
DischargeID INT PRIMARY KEY, 
PatientID INT, 
DischargeDate DATE, 
Summary TEXT, 
DoctorID INT, 
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID), 
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID))


--Tratment table
CREATE TABLE Treatments ( TreatmentID INT PRIMARY KEY, 
PatientID INT, 
DoctorID INT, 
TreatmentDate DATE, 
Description TEXT, 
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID), 
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID))

--Room Table
CREATE TABLE Rooms ( RoomID INT PRIMARY KEY, 
RoomNumber VARCHAR(10), 
Type VARCHAR(50), 
Capacity INT, 
Status VARCHAR(50))

select * from Rooms


--WardBoys
CREATE TABLE WardBoys ( WardBoyID INT PRIMARY KEY, 
Name VARCHAR(100) NOT NULL, 
Phone VARCHAR(15), 
Email VARCHAR(100) UNIQUE, 
DutyShift VARCHAR(50))

--Medical store
CREATE TABLE MedicalStores ( StoreID INT PRIMARY KEY, 
MedicineID INT, 
Stock INT, 
ExpiryDate DATE)


--***********************************************************************************************************
--Data insert into table.
--ROOMS TABLE......
--Start with the Rooms table as it does not reference any other table.
INSERT INTO Rooms (RoomID, RoomNumber, Type, Capacity, Status)
VALUES 
(1, '101A', 'General', 2, 'Occupied'),
(2, '102B', 'ICU', 1, 'Unoccupied'),
(3, '103C', 'Private', 1, 'Occupied'),
(4, '104D', 'General', 2, 'Unoccupied'),
(5, '105E', 'ICU', 1, 'Occupied'), 
(6, '106F', 'Private', 1, 'Unoccupied'),
(7, '107G', 'General', 2, 'Occupied'),
(8, '108H', 'ICU', 1, 'Occupied'),
(9, '109I', 'Private', 1, 'Unoccupied'),
(10, '110J', 'General', 2, 'Unoccupied')




--WARD BOYS TABLE........
--Next, insert into the Ward Boys table, as it does not reference any other table.
INSERT INTO WardBoys (WardBoyID, Name, Phone, Email, DutyShift) VALUES
(1, 'Ravi Kumar', '9876543210', 'ravi.kumar@example.com', 'Day'),
(2, 'Sohan Singh', '8765432109', 'sohan.singh@example.com', 'Night'),
(3, 'Amit Sharma', '7654321098', 'amit.sharma@example.com', 'Day'),
(4, 'Raj Patel', '6543210987', 'raj.patel@example.com', 'Night'),
(5, 'Karan Verma', '5432109876', 'karan.verma@example.com', 'Day'),
(6, 'Vikas Rao', '4321098765', 'vikas.rao@example.com', 'Night'),
(7, 'Deepak Jain', '3210987654', 'deepak.jain@example.com', 'Day'),
(8, 'Manoj Gupta', '2109876543', 'manoj.gupta@example.com', 'Night'),
(9, 'Alok Tiwari', '1098765432', 'alok.tiwari@example.com', 'Day'),
(10, 'Sumit Roy', '0198765432', 'sumit.roy@example.com', 'Night');



--MEDICAL STORE TABLE..
--Insert into the Medical Stores table as it also does not reference any other table.
INSERT INTO MedicalStores (StoreID, MedicineID, Stock, ExpiryDate) VALUES
(1, 101, 50, '2025-12-31'),
(2, 102, 30, '2024-06-15'),
(3, 103, 100, '2026-03-10'),
(4, 104, 40, '2023-11-20'),
(5, 105, 60, '2025-07-25'),
(6, 106, 20, '2024-09-05'),
(7, 107, 80, '2026-01-18'),
(8, 108, 10, '2023-12-01'),
(9, 109, 90, '2025-05-09'),
(10, 110, 70, '2024-10-30');


--PATIENTS TABLE
--Now, insert into the Patients table since RoomID references the Rooms table.
INSERT INTO Patients (PatientID, Name, Age, Gender, Address, Phone, Email, MedicalHistory, CurrentTreatment, RoomID) VALUES
(1, 'Anita Verma', 30, 'F', '123 MG Road, Ghaziabad', '9123456780', 'anita.verma@example.com', 'Asthma', 'Inhaler', 1),
(2, 'Rajesh Kumar', 45, 'M', '456 Park Avenue, Ghaziabad', '9234567891', 'rajesh.kumar@example.com', 'Diabetes', 'Insulin', 2),
(3, 'Sunita Sharma', 50, 'F', '789 NH Road, Ghaziabad', '9345678912', 'sunita.sharma@example.com', 'Hypertension', 'Medication', 3),
(4, 'Vijay Rao', 35, 'M', '321 MG Road, Ghaziabad', '9456789123', 'vijay.rao@example.com', 'Allergy', 'Antihistamines', 4),
(5, 'Meena Gupta', 40, 'F', '654 Park Avenue, Ghaziabad', '9567891234', 'meena.gupta@example.com', 'Asthma', 'Inhaler', 5),
(6, 'Suresh Mehta', 55, 'M', '987 NH Road, Ghaziabad', '9678912345', 'suresh.mehta@example.com', 'Diabetes', 'Insulin', 6),
(7, 'Kavita Singh', 29, 'F', '456 MG Road, Ghaziabad', '9789123456', 'kavita.singh@example.com', 'Hypertension', 'Medication', 7),
(8, 'Arun Roy', 48, 'M', '789 Park Avenue, Ghaziabad', '9891234567', 'arun.roy@example.com', 'Allergy', 'Antihistamines', 8),
(9, 'Priya Nair', 34, 'F', '123 NH Road, Ghaziabad', '9901234567', 'priya.nair@example.com', 'Asthma', 'Inhaler', 9),
(10, 'Rakesh Jain', 52, 'M', '456 MG Road, Ghaziabad', '9912345678', 'rakesh.jain@example.com', 'Diabetes', 'Insulin', 10);

SELECT * FROM Patients


--DOCTORE TABLE
--Insert into the Doctors table since RoomID references the Rooms table.
INSERT INTO Doctors (DoctorID, Name, Specialization, Phone, Email, Department, RoomID) VALUES
(1, 'Dr. Arjun Mehta', 'Cardiology', '9876543210', 'arjun.mehta@example.com', 'Cardiology', 1),
(2, 'Dr. Priya Nair', 'Neurology', '8765432109', 'priya.nair@example.com', 'Neurology', 2),
(3, 'Dr. Vivek Singh', 'Orthopedics', '7654321098', 'vivek.singh@example.com', 'Orthopedics', 3),
(4, 'Dr. Neha Sharma', 'Pediatrics', '6543210987', 'neha.sharma@example.com', 'Pediatrics', 4),
(5, 'Dr. Rohan Desai', 'Oncology', '5432109876', 'rohan.desai@example.com', 'Oncology', 5),
(6, 'Dr. Anjali Rao', 'Dermatology', '4321098765', 'anjali.rao@example.com', 'Dermatology', 6),
(7, 'Dr. Karan Verma', 'ENT', '3210987654', 'karan.verma@example.com', 'ENT', 7),
(8, 'Dr. Meera Sinha', 'Gynecology', '2109876543', 'meera.sinha@example.com', 'Gynecology', 8),
(9, 'Dr. Amit Patel', 'Nephrology', '1098765432', 'amit.patel@example.com', 'Nephrology', 9),
(10, 'Dr. Suman Gupta', 'Urology', '0198765432', 'suman.gupta@example.com', 'Urology', 10);

sp_help 'Doctors'
select * from Doctors
update Doctors set 
Name='Dr. Arjun Mehta',
Specialization='Cardiology',
Phone='9876543210',
Email='arjun.mehta@example.com',
Department='cardiology'
where RoomID=7


--NURSE TABLE
--Insert into the Nurses table since WardBoyID references the WardBoys table.
INSERT INTO Nurses (NurseID, Name, Phone, Email, DutyShift, WardBoyID) VALUES
(1, 'Nurse Asha', '9123456780', 'asha.nurse@example.com', 'Day', 1),
(2, 'Nurse Rani', '9234567891', 'rani.nurse@example.com', 'Night', 2),
(3, 'Nurse Lakshmi', '9345678912', 'lakshmi.nurse@example.com', 'Day', 3),
(4, 'Nurse Sita', '9456789123', 'sita.nurse@example.com', 'Night', 4),
(5, 'Nurse Geeta', '9567891234', 'geeta.nurse@example.com', 'Day', 5),
(6, 'Nurse Radhika', '9678912345', 'radhika.nurse@example.com', 'Night', 6),
(7, 'Nurse Anjali', '9789123456', 'anjali.nurse@example.com', 'Day', 7),
(8, 'Nurse Sunita', '9891234567', 'sunita.nurse@example.com', 'Night', 8),
(9,'Nurse prerna','9545120298','Prerna.nurse@example.com','Day',9),
(10,'Nurse soniya','7817059848','soniya.nurse@example.com','Night',10)



--ADMISSIONS TABLE
--Insert into the Admissions table since PatientID, DoctorID, and RoomID reference the Patients, Doctors, and Rooms tables respectively.
 INSERT INTO Admissions (AdmissionID, PatientID, DoctorID, AdmissionDate, Reason, RoomID) VALUES
(1, 1, 1, '2025-01-01', 'Routine Checkup', 1),
(2, 2, 2, '2025-01-02', 'Emergency', 2),
(3, 3, 3, '2025-01-03', 'Surgery', 3),
(4, 4, 4, '2025-01-04', 'Fever', 4),
(5, 5, 5, '2025-01-05', 'Routine Checkup', 5),
(6, 6, 6, '2025-01-06', 'Surgery', 6),
(7, 7, 7, '2025-01-07', 'Allergy', 7),
(8, 8, 8, '2025-01-08', 'Emergency', 8),
(9, 9, 9, '2025-01-09', 'Routine Checkup', 9),
(10, 10, 10, '2025-01-10', 'Fever', 10);


--DISCHARGESUMMARIES TABLE..
--Insert into the Discharge Summaries table since PatientID and DoctorID reference the Patients and Doctors tables respectively.
INSERT INTO DischargeSummaries (DischargeID, PatientID, DischargeDate, Summary, DoctorID) VALUES
(1, 1, '2025-01-10', 'Recovered well', 1),
(2, 2, '2025-01-15', 'Stable condition', 2),
(3, 3, '2025-01-20', 'Successful surgery', 3),
(4, 4, '2025-01-25', 'Fever subsided', 4),
(5, 5, '2025-01-30', 'Routine checkup completed', 5),
(6, 6, '2025-02-01', 'Successful surgery', 6),
(7, 7, '2025-02-05', 'Allergy treated', 7),
(8, 8, '2025-02-10', 'Emergency stabilized', 8),
(9, 9, '2025-02-15', 'Routine checkup completed', 9),
(10, 10, '2025-02-20', 'Fever subsided', 10);


--TREATMENT.....
--Insert into the Treatments table since PatientID and DoctorID reference the Patients and Doctors tables respectively.
 INSERT INTO Treatments (TreatmentID, PatientID, DoctorID, TreatmentDate, Description) VALUES
(1, 1, 1, '2024-12-05', 'Administered Inhaler for Asthma'),
(2, 2, 2, '2025-01-06', 'Provided Insulin for Diabetes management'),
(3, 3, 3, '2025-01-07', 'Performed Surgery for Hip Replacement'),
(4, 4, 4, '2025-01-08', 'Administered Antipyretic for Fever'),
(5, 5, 5, '2025-01-09', 'Routine Checkup and Consultation'),
(6, 6, 6, '2025-01-10', 'Performed Surgery for Gallbladder removal'),
(7, 7, 7, '2025-01-11', 'Administered Antihistamines for Allergy'),
(8, 8, 8, '2025-01-12', 'Provided Emergency Care for Injury'),
(9, 9, 9, '2025-01-13', 'Routine Checkup and Blood Work'),
(10, 10, 10, '2025-01-14', 'Administered Antipyretic for High Fever');
update Treatments set TreatmentDate='2024-12-05' where TreatmentID=1


--*************************************************************************************************************
--Here are some Querie operation based on above table and projects...

--Find all patients assigned to a specific doctor and their room details (working)
SELECT P.Name AS [PatientName], P.RoomID, R.RoomNumber, D.Name AS [DoctorName]
FROM Patients P
JOIN Rooms R ON P.RoomID = R.RoomID
JOIN Admissions A ON P.PatientID = A.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID
WHERE D.Name = 'Dr. Sakshi Rawat'


--List all patients who have been admitted more than once.
--(working but without having clause coz there is no one patient who admitted more then once)
SELECT P.Name AS PatientName, COUNT(A.AdmissionID) AS [AdmissionCount]
FROM Patients P
JOIN Admissions A ON P.PatientID = A.PatientID
GROUP BY P.Name
HAVING COUNT(A.AdmissionID) > 1


--Find the average age of patients in each room type (working)
SELECT R.Type AS RoomType, AVG(P.Age) AS AverageAge
FROM Patients P
JOIN Rooms R ON P.RoomID = R.RoomID
GROUP BY R.Type;


--Retrieve all treatments provided by a specific doctor within the last month
--(working but now we don't have last month data)
SELECT T.Description AS TreatmentDescription, T.TreatmentDate, P.Name AS PatientName
FROM Treatments T
JOIN Patients P ON T.PatientID = P.PatientID
JOIN Doctors D ON T.DoctorID = D.DoctorID
WHERE D.Name = 'Dr. Arjun Mehta' AND T.TreatmentDate >= DATEADD(MONTH, -1, GETDATE());


--List all ward boys and the nurses assigned to them
SELECT WB.Name AS WardBoyName, N.Name AS NurseName
FROM WardBoys WB
JOIN Nurses N ON WB.WardBoyID = N.WardBoyID;



--Find all doctors who have discharged more than 10 patients
SELECT D.Name AS DoctorName, COUNT(DISTINCT DS.DischargeID) AS DischargeCount
FROM Doctors D
JOIN DischargeSummaries DS ON D.DoctorID = DS.DoctorID
GROUP BY D.Name
HAVING COUNT(DISTINCT DS.DischargeID) > 10;



--Get details of all patients who were admitted but not yet discharged
SELECT P.Name AS PatientName, A.AdmissionDate, R.RoomNumber
FROM Patients P
JOIN Admissions A ON P.PatientID = A.PatientID
JOIN Rooms R ON A.RoomID = R.RoomID
LEFT JOIN DischargeSummaries DS ON P.PatientID = DS.PatientID
WHERE DS.DischargeID IS NULL;



--Calculate the total number of medicines in stock in the medical store
SELECT SUM(Stock) AS TotalMedicinesInStock
FROM MedicalStores;


--Find all rooms that are currently unoccupied( Blank )..
SELECT * 
FROM Rooms 
WHERE Status = 'Unoccupied'


--List all doctors and the number of treatments they have provided
SELECT D.Name AS DoctorName, COUNT(T.TreatmentID) AS TreatmentCount
FROM Doctors D
JOIN Treatments T ON D.DoctorID = T.DoctorID
GROUP BY D.Name;

 --Here are some Basic shortcut for SQL Server
 --If you wanna Comment out group of code so you can use multiple steps
 -- 1. /* SQL Queries_______________ _ _ _ _ _  _ _ _  _ _ _*/

 --just select group of code and press for comment 
 --Ctrl + K, Ctrl + C

 --Uncomment
 --Ctrl + K, Ctrl + U