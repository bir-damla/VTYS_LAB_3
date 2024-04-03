--SORU 3 : �Yaz�l�m� veya �Donan�m� birimlerinde �al��anlar�n ad, soyad ve maa� bilgilerini listeleyen SQL sorgusunu yaz�n�z. (Tek bir sorgu ile)
SELECT e.EMPLOYEE_NAME, e.EMPLOYEE_SURNAME, e.SALARY
FROM EMPLOYEE e
JOIN UNIT u ON e.EMPLOYEE_UNIT = u.ID
WHERE u.UNIT_NAME IN ('Software', 'Hardware');


--SORU 4 : Maa�� en y�ksek olan �al��anlar�n ad, soyad ve maa� bilgilerini listeleyen SQL sorgusunu yaz�n�z. (Tek bir sorgu ile)
SELECT EMPLOYEE_NAME, EMPLOYEE_SURNAME, SALARY FROM EMPLOYEE WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE)


--SORU 5 : Birimlerin her birinde ka� adet �al��an oldu�unu ve birimlerin isimlerini listeleyen sorguyu yaz�n�z. 
--(Tek bir sorgu ile) (�rne�in; x biriminde 3 �al��an var gibi d���nebilirsiniz.) (Gruplamal� sorgu ile)
SELECT u.UNIT_NAME, COUNT(e.ID) AS EMPLOYEE_COUNT
FROM UNIT u
LEFT JOIN EMPLOYEE e ON u.ID = e.EMPLOYEE_UNIT
GROUP BY u.UNIT_NAME;


--SORU 6 : Birden fazla �al��ana ait olan unvanlar�n isimlerini ve o unvan alt�nda �al��anlar�n say�s�n� listeleyen sorguyu yaz�n�z. (Tek bir sorgu ile)
SELECT jt.JOBTITLE_NAME, COUNT(e.ID) AS EMPLOYEE_COUNT
FROM JOBTITLE jt
INNER JOIN EMPLOYEE e ON jt.EMPLOYEE_ID = e.ID
GROUP BY jt.JOBTITLE_NAME
HAVING COUNT(e.ID) > 1;


--SORU 7 : Maa�lar� �50000� ve �100000� aras�nda de�i�en �al��anlar�n ad, soyad ve maa� bilgilerini listeleyen sorguyu yaz�n�z. (Tek bir sorgu ile)
SELECT EMPLOYEE_NAME, EMPLOYEE_SURNAME, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN 50000 AND 100000


--SORU 8 : �kramiye hakk�na sahip �al��anlara ait ad, soyad, birim, unvan ve ikramiye �creti bilgilerini listeleyen sorguyu yaz�n�z. (Tek bir sorgu ile)
SELECT e.EMPLOYEE_NAME, e.EMPLOYEE_SURNAME, u.UNIT_NAME, jt.JOBTITLE_NAME, r.REWARD_PAYMENT
FROM EMPLOYEE e
INNER JOIN UNIT u ON e.EMPLOYEE_UNIT = u.ID
INNER JOIN JOBTITLE jt ON e.ID = jt.EMPLOYEE_ID
INNER JOIN REWARD r ON e.ID = r.EMPLOYEE_ID;


--SORU 9 : �nvan� �Y�netici� ve �M�d�r� olan �al��anlar�n ad, soyad ve �nvanlar�n� listeleyen sorguyu yaz�n�z. (Tek bir sorgu ile)
SELECT e.EMPLOYEE_NAME, e.EMPLOYEE_SURNAME, jt.JOBTITLE_NAME
FROM EMPLOYEE e
INNER JOIN JOBTITLE jt ON e.ID = jt.EMPLOYEE_ID
WHERE jt.JOBTITLE_NAME IN ('Executive' , 'Manager');


--SORU 10 : Her bir birimde en y�ksek maa� alan �al��anlar�n ad, soyad ve maa� bilgilerini listeleyen sorguyu yaz�n�z. (Tek bir sorgu ile)
SELECT EMPLOYEE_NAME, EMPLOYEE_SURNAME, SALARY, UNIT_NAME
FROM (
    SELECT e.EMPLOYEE_NAME, e.EMPLOYEE_SURNAME, e.SALARY, u.UNIT_NAME,
           ROW_NUMBER() OVER (PARTITION BY e.EMPLOYEE_UNIT ORDER BY e.SALARY DESC) AS ROW_NUM
    FROM EMPLOYEE e
    INNER JOIN UNIT u ON e.EMPLOYEE_UNIT = u.ID
) AS RANKED_EMPLOYEES
WHERE ROW_NUM = 1;