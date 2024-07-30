CREATE DATABASE clinic;

CREATE TABLE patients (
  patiantID INT PRIMARY KEY,
  patiantName VARCHAR(50) NOTNULL,
  contactDetails VARCHAR(200),
  insuranceProvider VARCHAR(50),
  medicalHistory TEXT
);

CREATE TABLE doctors (
  doctorID INT PRIMARY KEY,
  doctorName VARCHAR(50) NOTNULL,
  speciality VARCHAR(80) NOTNULL
);

CREATE TABLE appointments (
  appointmentID INT PRIMARY KEY,
  appointmentDate DATETIME,
  reasonForVisit VARCHAR(150),
  patiantID INT NOTNULL,
  doctorID SMALLINT,
  FOREIGN KEY (patiantID) REFERENCES patients(patiantID),
  FOREIGN KEY (doctorID) REFERENCES doctors(doctorID)
);

CREATE TABLE prescriptions (
  prescriptionID INT PRIMARY KEY,
  dateIssued DATETIME NOTNULL, 
  doctorInstructions TEXT,
  patiantID INT NOTNULL,
  doctorID SMALLINT NOTNULL,
  FOREIGN KEY (patiantID) REFERENCES patients(patiantID),
  FOREIGN KEY (doctorID) REFERENCES doctors(doctorID)
);

CREATE TABLE dosages (
  dosageID INT PRIMARY KEY,
  prescriptionID INT NOTNULL,
  medicationName VARCHAR(100),
  dosage DECIMAL,
  FOREIGN KEY (prescriptionID) REFERENCES prescriptions(prescriptionID)
);
