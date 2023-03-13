CREATE TABLE "tb_Hospital" (
	"Hospital_ID" VARCHAR(10) NOT NULL,
	"HospitalName" VARCHAR(75) NOT NULL,
	"HospitalLocation" CHAR(50) NOT NULL,	
CONSTRAINT Hospital_PK PRIMARY KEY (Hospital_ID)
);

CREATE TABLE "tb_Doctor" (
	"Doctor_ID" VARCHAR(10) NOT NULL,
	"DoctorName" VARCHAR(75) NOT NULL,
	"DoctorLocation" CHAR(50) NOT NULL,
	"Specialization" CHAR(20) NOT NULL,
CONSTRAINT Doctor_PK PRIMARY KEY (Doctor_ID)
);

CREATE TABLE "tb_Deceased" (
	"Deceased_ID" VARCHAR(10) NOT NULL,
	"Hospital_ID" VARCHAR(10) NOT NULL,
	"DeceasedName" VARCHAR(75) NOT NULL,
	"DeceasedAge" INT NOT NULL,
	"DeceasedSex" CHAR(6) NOT NULL,
	"DateofBirth" DATE NOT NULL,
	"DateofDeath" DATE NOT NULL,
	"TimeofDeath" TIME NOT NULL,
	"CauseofDeath" CHAR(50) NOT NULL,
CONSTRAINT Deceased_PK PRIMARY KEY (Deceased_ID),
CONSTRAINT Deceased_FK FOREIGN KEY (Hospital_ID) REFERENCES "tb_Hospital"(Hospital_ID)
);

CREATE TABLE "tb_Procedure" (
	"ProcedureType" CHAR(10) NOT NULL,
	"ProcedureDetails" VARCHAR(50) NOT NULL,
	"Performer" CHAR(50) NOT NULL,
CONSTRAINT Procedure_PK PRIMARY KEY (ProcedureType)
);

CREATE TABLE "tb_Request" (
	"Request_ID" VARCHAR(10) NOT NULL,
	"Deceased_ID" VARCHAR(10) NOT NULL,
	"ProcedureType" CHAR(10) NOT NULL,
	"RequestDate" DATE NOT NULL,
	"RequestReason" CHAR(20) NOT NULL,
	"RequesterName" VARCHAR(75) NOT NULL,
CONSTRAINT Request_PK PRIMARY KEY (Request_ID),
CONSTRAINT Request_FK1 FOREIGN KEY (Deceased_ID) REFERENCES "tb_Deceased"(Deceased_ID),
CONSTRAINT Request_FK2 FOREIGN KEY (ProcedureType) REFERENCES "tb_Procedure"(ProcedureType)
);

CREATE TABLE "tb_Approval" (
	"Approval_ID" VARCHAR(10) NOT NULL,
	"Request_ID" VARCHAR(10) NOT NULL,
	"ApprovedPerformer" VARCHAR(50) NOT NULL,	
CONSTRAINT Approval_PK PRIMARY KEY (Approval_ID),
CONSTRAINT Approval_FK FOREIGN KEY (Request_ID) REFERENCES "tb_Request"(Request_ID)
);

CREATE TABLE "tb_PathologistTable" (
	"Pathologist_ID" VARCHAR(10) NOT NULL,
	"PathologistName" VARCHAR(75) NOT NULL,	
CONSTRAINT Pathologist_PK PRIMARY KEY (Pathologist_ID)
);

CREATE TABLE "tb_Mortician" (
	"Mortician_ID" VARCHAR(10) NOT NULL,
	"MorticianName" VARCHAR(75) NOT NULL,	
CONSTRAINT Mortician_PK PRIMARY KEY (Mortician_ID)
);

CREATE TABLE "tb_Mortuary" (
	"Mortuary_ID" VARCHAR(10) NOT NULL,
	"MortuaryName" VARCHAR(75) NOT NULL,
	"MortuaryLocation" CHAR(50) NOT NULL,
	"Capacity" INT NOT NULL,	
CONSTRAINT Mortuary_PK PRIMARY KEY (Mortuary_ID)
);
