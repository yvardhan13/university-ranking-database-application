CREATE TABLE State (
	sName VARCHAR(25) NOT NULL, 
	CONSTRAINT pk_State_sName PRIMARY KEY (sName));



CREATE TABLE STEM (
	stem VARCHAR (10) NOT NULL,
	optLength INTEGER, 
	CONSTRAINT pk_STEM_pId PRIMARY KEY (stem));




CREATE TABLE Agency (
	aId CHAR(4) NOT NULL, 
	aName VARCHAR (30), 
	aWebsite VARCHAR (30),
	rankingSince INTEGER, 
	CONSTRAINT pk_Agency_aId PRIMARY KEY (aId));


CREATE TABLE University (
	uId CHAR (3) NOT NULL, 
	uName VARCHAR (50), 
	type VARCHAR (10),
	street VARCHAR (30), 
	city VARCHAR (15),
	zip CHAR (5),
	accreditation VARCHAR (7),
	uWebsite VARCHAR (30),
	sName VARCHAR(25),
	CONSTRAINT pk_University_uId PRIMARY KEY (uId),
	CONSTRAINT fk_University_sName FOREIGN KEY (sName)
		REFERENCES State (sName)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION);


	
CREATE TABLE Program (
	pId CHAR (3) NOT NULL,
	pName VARCHAR (4),
stem VARCHAR (10) 
	CONSTRAINT pk_Program_pId PRIMARY KEY (pId),
CONSTRAINT fk_Program_STEM FOREIGN KEY (stem)
		REFERENCES STEM (stem)
		ON DELETE NO ACTION
	ON UPDATE NO ACTION);




CREATE TABLE ProgramStats (
	uId CHAR (3) NOT NULL,
	pId CHAR (3) NOT NULL,
	minTOEFL INTEGER, 
	minIELTS NUMERIC (2,1), 
	avgGMAT INTEGER, 
	tuition NUMERIC (8,2),
	length INTEGER,
	CONSTRAINT pk_ProgramStats_uId_pId PRIMARY KEY (uId, pId),
	CONSTRAINT fk_ProgramStats_uId FOREIGN KEY (uId)
		REFERENCES University (uId)
		ON DELETE NO ACTION
		ON UPDATE CASCADE, 
	CONSTRAINT fk_ProgramStats_pId FOREIGN KEY (pId)
		REFERENCES Program (pId)
		ON DELETE NO ACTION 
		ON UPDATE CASCADE);




CREATE TABLE Rank (
	aId CHAR(4) NOT NULL, 
	uId CHAR (3) NOT NULL,
	pId CHAR (3) NOT NULL,
	rank INTEGER, 
	year INTEGER NOT NULL, 
	CONSTRAINT pk_Rank_aId_uId_pId_year PRIMARY KEY (aId, uId, pId, year),
	CONSTRAINT fk_Rank_aId FOREIGN KEY (aId)
		REFERENCES Agency (aId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_Rank_uId FOREIGN KEY (uId)
		REFERENCES University (uId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_Rank_pId FOREIGN KEY (pId)
		REFERENCES Program (pId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION);


