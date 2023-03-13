CREATE TABLE "tb_Hospital" (
	"Hospital_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"HospitalName" VARCHAR(75) NOT NULL,
	"HospitalLocation" VARCHAR(50) NOT NULL	
);

CREATE TABLE "tb_Doctor" (
	"Doctor_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"Hospital_ID" VARCHAR (10) NOT NULL FOREIGN KEY REFERENCES "tb_Hospital"(Hospital_ID),
	"DoctorName" VARCHAR(75) NOT NULL,
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

CREATE TABLE "tb_Professional" (
	"Professional_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"ProfessionalName" VARCHAR(75) NOT NULL,
	"ProfessionalType" VARCHAR(15) NOT NULL
);

CREATE TABLE "tb_Procedure" (
	"Procedure_ID" INT NOT NULL PRIMARY KEY,
	"ProcedureType" VARCHAR(15) NOT NULL,
	"ProcedureDetails" VARCHAR(250) NOT NULL
);

CREATE TABLE "tb_Request" (
	"Request_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"Deceased_ID" VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES "tb_Deceased"(Deceased_ID),
	"Procedure_ID" INT NOT NULL FOREIGN KEY REFERENCES "tb_Procedure"(Procedure_ID),
	"Professional_ID" VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES "tb_Professional"(Professional_ID),
	"RequestDate" DATE NOT NULL,
	"RequestReason" VARCHAR(100) NOT NULL,
	"RequesterName" VARCHAR(75) NOT NULL,
	"IsApproved" BIT NOT NULL DEFAULT 0
);

CREATE TABLE "tb_Mortuary" (
	"Mortuary_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"MortuaryName" VARCHAR(75) NOT NULL,
	"MortuaryLocation" VARCHAR(50) NOT NULL,
	"Capacity" INT NOT NULL,	
);

CREATE TABLE "tb_MortuaryLogs" (
	"Log_ID" VARCHAR(10) NOT NULL PRIMARY KEY,
	"Mortuary_ID" VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES "tb_Mortuary"(Mortuary_ID),
	"Deceased_ID" VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES "tb_Deceased"(Deceased_ID),
	"DateReceived" DATE NOT NULL
);
