CREATE TABLE "Hospital" (
	Hospital_ID VARCHAR(10) NOT NULL,
	HospitalName VARCHAR(30) NOT NULL,
	HospitalLocation CHAR(20) NOT NULL,	
CONSTRAINT Hospital_PK PRIMARY KEY (Hospital_ID)
);

CREATE TABLE "Doctor" (
	Doctor_ID VARCHAR(10) NOT NULL,
	DoctorName VARCHAR(75) NOT NULL,
	DoctorLocation CHAR(20) NOT NULL,
	Specialization CHAR(20) NOT NULL,
CONSTRAINT Doctor_PK PRIMARY KEY (Doctor_ID)
);

CREATE TABLE "Deceased" (
	Deceased_ID VARCHAR(10) NOT NULL,
	Hospital_ID VARCHAR(10) NOT NULL,
	DeceasedName VARCHAR(75) NOT NULL,
	Age INT NOT NULL,
	Sex CHAR(6) NOT NULL,
	DateofBirth DATE NOT NULL,
	DateofDeath DATE NOT NULL,
	TimeofDeath VARCHAR(10) NOT NULL,
	CauseofDeath CHAR(50) NOT NULL,
CONSTRAINT Deceased_PK PRIMARY KEY (Deceased_ID),
CONSTRAINT Deceased_FK FOREIGN KEY (Hospital_ID) REFERENCES "Hospital"(Hospital_ID)
);

CREATE TABLE "Procedure" (
	ProcedureType CHAR(10) NOT NULL,
	ProcedureDetails VARCHAR(50) NOT NULL,
	Performer CHAR(40) NOT NULL,
CONSTRAINT Procedure_PK PRIMARY KEY (ProcedureType)
);

CREATE TABLE "Request" (
	Request_ID VARCHAR(10) NOT NULL,
	Deceased_ID VARCHAR(10) NOT NULL,
	ProcedureType CHAR(10) NOT NULL,
	RequestDate DATE NOT NULL,
	RequestReason CHAR(20) NOT NULL,
	RequesterName VARCHAR(50) NOT NULL,
CONSTRAINT Request_PK PRIMARY KEY (Request_ID),
CONSTRAINT Request_FK1 FOREIGN KEY (Deceased_ID) REFERENCES "Deceased"(Deceased_ID),
CONSTRAINT Request_FK2 FOREIGN KEY (ProcedureType) REFERENCES "Procedure"(ProcedureType)
);

CREATE TABLE "Approval" (
	Approval_ID VARCHAR(10) NOT NULL,
	Request_ID VARCHAR(10) NOT NULL,
	ApprovedPerformer VARCHAR(50) NOT NULL,	
CONSTRAINT Approval_PK PRIMARY KEY (Approval_ID),
CONSTRAINT Approval_FK FOREIGN KEY (Request_ID) REFERENCES "Request"(Request_ID)
);

CREATE TABLE "Pathologist" (
	Pathologist_ID VARCHAR(10) NOT NULL,
	PathologistName VARCHAR(50) NOT NULL,	
CONSTRAINT Pathologist_PK PRIMARY KEY (Pathologist_ID)
);

CREATE TABLE "Mortician" (
	Mortician_ID VARCHAR(10) NOT NULL,
	MorticianName VARCHAR(50) NOT NULL,	
CONSTRAINT Mortician_PK PRIMARY KEY (Mortician_ID)
);

CREATE TABLE "Mortuary" (
	Mortuary_ID VARCHAR(10) NOT NULL,
	MortuaryName VARCHAR(30) NOT NULL,
	MortuaryLocation CHAR(20) NOT NULL,
	Capacity VARCHAR(10) NOT NULL,	
CONSTRAINT Mortuary_PK PRIMARY KEY (Mortuary_ID)
);
