CREATE TABLE UNIT
(
	ID INT PRIMARY KEY NOT NULL,
	UNIT_NAME NVARCHAR(25) NULL
)
CREATE TABLE EMPLOYEE
(
	ID INT PRIMARY KEY NOT NULL,
	EMPLOYEE_NAME NVARCHAR(25) NULL,
	EMPLOYEE_SURNAME NVARCHAR(25) NULL,
	SALARY INT NULL,
	JOINNING_DATE DATETIME NULL,
	EMPLOYEE_UNIT INT NOT NULL,
	FOREIGN KEY (EMPLOYEE_UNIT) REFERENCES UNIT(ID)
)
CREATE TABLE JOBTITLE
(
	EMPLOYEE_ID INT NOT NULL,
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE (ID),
	JOBTITLE_NAME NVARCHAR(25) NULL,
	JOBTITLE_DATE DATETIME NULL
)
CREATE TABLE REWARD
(
	EMPLOYEE_ID INT NOT NULL,
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE (ID),
	REWARD_PAYMENT INT NULL,
	JOBTITLE_DATE DATETIME NULL
)