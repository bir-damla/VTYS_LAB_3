INSERT INTO EMPLOYEE (ID, EMPLOYEE_NAME, EMPLOYEE_SURNAME, SALARY, JOINNING_DATE, EMPLOYEE_UNIT)
VALUES
	(1,'�smail','��eri',100000,'2014-02-20',1),
	(2,'Hami','Sat�lm��',80000,'2014-06-11',1),
	(3,'Durmu�','�ahin',300000,'2014-02-20',2),
	(4,'Ka�an','Yazar',500000,'2014-02-20',3),
	(5,'Meryem','Soysald�',500000,'2014-06-11',3),
	(6,'Duygu','Ak�ehir',200000,'2014-06-11',2),
	(7,'K�bra','Seyhan',75000,'2014-01-20',1),
	(8,'G�lcan','Y�ld�z',50000,'2014-04-11',3);

INSERT INTO REWARD (EMPLOYEE_ID, REWARD_PAYMENT, REWARD_DATE)
VALUES
	(1,5000,'2016-02-20'),
	(2,3000,'2016-06-11'),
	(3,4000,'2016-02-20'),
	(1,4500,'2016-02-20'),
	(2,3500,'2016-06-11');

INSERT INTO JOBTITLE (EMPLOYEE_ID, JOBTITLE_NAME, JOBTITLE_DATE)
VALUES
	(1,'Executive','2016-02-20'),
	(2,'Staff','2016-06-11'),
	(8,'Staff','2016-06-11'),
	(5,'Manager','2016-06-11'),
	(4,'Executive Assistant','2016-06-11'),
	(7,'Staff','2016-06-11'),
	(6,'Team Leader','2016-06-11'),
	(3,'Team Leader','2016-06-11');

INSERT INTO UNIT (ID, UNIT_NAME)
VALUES
	(1,'Software'),
	(2,'Hardware'),
	(3,'Security');