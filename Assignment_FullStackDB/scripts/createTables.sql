--These set of commands are used to create tables for the 
--Appliance system.
USE ServiceAppointmentSystem;
GO
-- Customer table
CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(100) NOT NULL,
	Phone NVARCHAR(20) NOT NULL,
	CONSTRAINT CHK_Customer_Email CHECK (Email LIKE '%@%.%'),
	CONSTRAINT CHK_Customer_Phone CHECK (Phone NOT LIKE '%[^0-9()-]%')
);
GO
-- Technician Table
CREATE TABLE Technicians(
	TechnicianID INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(100) NOT NULL,
	Phone NVARCHAR(20) NOT NULL,
	Specialization NVARCHAR(50) NOT NULL, 
	CONSTRAINT CHK_Technician_Email CHECK (Email LIKE '%@%.%'),
	CONSTRAINT CHK_Technician_Phone CHECK (Phone NOT LIKE '%[^0-9()-]%')

);
GO
-- Services Table
CREATE TABLE Services(
	ServiceID INT IDENTITY(1,1) PRIMARY KEY,
	ServiceName NVARCHAR(100) NOT NULL UNIQUE,
	ServiceDescription NVARCHAR(500),
	Duration INT CHECK (Duration > 0) NOT NULL,
	Price DECIMAL(10,2) CHECK (Price >= 0) NOT NULL
);
GO
-- Appointments Table
CREATE TABLE Appointments (
	AppointmentID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT NOT NULL,
	TechnicianID INT NOT NULL,
	AppointmentDate DATE NOT NULL,
	StartTime TIME NOT NULL,
	EndTime TIME NOT NULL,
	AppointmentStatus NVARCHAR(20) DEFAULT 'Scheduled' CHECK (AppointmentStatus IN ('Scheduled','Completed','Cancelled')),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	FOREIGN KEY (TechnicianID) REFERENCES Technicians(TechnicianID),
	CHECK (EndTime > StartTime)
);
-- Junction Table
CREATE TABLE AppointmentServices (
	AppointmentID INT NOT NULL,
	ServiceID INT NOT NULL,
	PRIMARY KEY (AppointmentID, ServiceID),
	FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE,
	FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID) ON DELETE CASCADE
);