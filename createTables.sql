CREATE TABLE "tb_Hospital" (
	"Hospital_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"HospitalName" VARCHAR(75) NOT NULL,
	"HospitalLocation" VARCHAR(50) NOT NULL	
);

CREATE TABLE "tb_Doctor" (
	"Doctor_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"DoctorName" VARCHAR(75) NOT NULL,
	"DoctorLocation" VARCHAR(50) NOT NULL,
	"Specialization" VARCHAR(20) NOT NULL
);

CREATE TABLE "tb_Deceased" (
	"Deceased_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"Hospital_ID" VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES "tb_Hospital"(Hospital_ID),
	"DeceasedName" VARCHAR(75) NOT NULL,
	"DeceasedAge" INT NOT NULL,
	"DeceasedSex" VARCHAR(6) NOT NULL,
	"DateofBirth" DATE NOT NULL,
	"DateofDeath" DATE NOT NULL,
	"TimeofDeath" TIME NOT NULL,
	"CauseofDeath" VARCHAR(50) NOT NULL
);

CREATE TABLE "tb_Procedure" (
	"ProcedureType" VARCHAR(10) NOT NULL PRIMARY KEY,
	"ProcedureDetails" VARCHAR(50) NOT NULL,
	"Performer" VARCHAR(50) NOT NULL
);

CREATE TABLE "tb_Request" (
	"Request_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"Deceased_ID" VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES "tb_Deceased"(Deceased_ID),
	"ProcedureType" VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES "tb_Procedure"(ProcedureType),
	"RequestDate" DATE NOT NULL,
	"RequestReason" VARCHAR(20) NOT NULL,
	"RequesterName" VARCHAR(75) NOT NULL,
);

CREATE TABLE "tb_Approval" (
	"Approval_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"Request_ID" VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES "tb_Request"(Request_ID),
	"ApprovedPerformer" VARCHAR(50) NOT NULL,	
);

CREATE TABLE "tb_Pathologist" (
	"Pathologist_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"PathologistName" VARCHAR(75) NOT NULL,	
);

CREATE TABLE "tb_Mortician" (
	"Mortician_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"MorticianName" VARCHAR(75) NOT NULL,	
);

CREATE TABLE "tb_Mortuary" (
	"Mortuary_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"MortuaryName" VARCHAR(75) NOT NULL,
	"MortuaryLocation" VARCHAR(50) NOT NULL,
	"Capacity" INT NOT NULL,	
);
