--SORU 3 : “Yazýlým” veya “Donaným” birimlerinde çalýþanlarýn ad, soyad ve maaþ bilgilerini listeleyen SQL sorgusunu yazýnýz. (Tek bir sorgu ile)
SELECT e.EMPLOYEE_NAME, e.EMPLOYEE_SURNAME, e.SALARY
FROM EMPLOYEE e
JOIN UNIT u ON e.EMPLOYEE_UNIT = u.ID
WHERE u.UNIT_NAME IN ('Software', 'Hardware');


--SORU 4 : Maaþý en yüksek olan çalýþanlarýn ad, soyad ve maaþ bilgilerini listeleyen SQL sorgusunu yazýnýz. (Tek bir sorgu ile)
SELECT EMPLOYEE_NAME, EMPLOYEE_SURNAME, SALARY FROM EMPLOYEE WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE)


--SORU 5 : Birimlerin her birinde kaç adet çalýþan olduðunu ve birimlerin isimlerini listeleyen sorguyu yazýnýz. 
--(Tek bir sorgu ile) (Örneðin; x biriminde 3 çalýþan var gibi düþünebilirsiniz.) (Gruplamalý sorgu ile)
SELECT u.UNIT_NAME, COUNT(e.ID) AS EMPLOYEE_COUNT
FROM UNIT u
LEFT JOIN EMPLOYEE e ON u.ID = e.EMPLOYEE_UNIT
GROUP BY u.UNIT_NAME;


--SORU 6 : Birden fazla çalýþana ait olan unvanlarýn isimlerini ve o unvan altýnda çalýþanlarýn sayýsýný listeleyen sorguyu yazýnýz. (Tek bir sorgu ile)
SELECT jt.JOBTITLE_NAME, COUNT(e.ID) AS EMPLOYEE_COUNT
FROM JOBTITLE jt
INNER JOIN EMPLOYEE e ON jt.EMPLOYEE_ID = e.ID
GROUP BY jt.JOBTITLE_NAME
HAVING COUNT(e.ID) > 1;


--SORU 7 : Maaþlarý “50000” ve “100000” arasýnda deðiþen çalýþanlarýn ad, soyad ve maaþ bilgilerini listeleyen sorguyu yazýnýz. (Tek bir sorgu ile)
SELECT EMPLOYEE_NAME, EMPLOYEE_SURNAME, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN 50000 AND 100000


--SORU 8 : Ýkramiye hakkýna sahip çalýþanlara ait ad, soyad, birim, unvan ve ikramiye ücreti bilgilerini listeleyen sorguyu yazýnýz. (Tek bir sorgu ile)
SELECT e.EMPLOYEE_NAME, e.EMPLOYEE_SURNAME, u.UNIT_NAME, jt.JOBTITLE_NAME, r.REWARD_PAYMENT
FROM EMPLOYEE e
INNER JOIN UNIT u ON e.EMPLOYEE_UNIT = u.ID
INNER JOIN JOBTITLE jt ON e.ID = jt.EMPLOYEE_ID
INNER JOIN REWARD r ON e.ID = r.EMPLOYEE_ID;


--SORU 9 : Ünvaný “Yönetici” ve “Müdür” olan çalýþanlarýn ad, soyad ve ünvanlarýný listeleyen sorguyu yazýnýz. (Tek bir sorgu ile)
SELECT e.EMPLOYEE_NAME, e.EMPLOYEE_SURNAME, jt.JOBTITLE_NAME
FROM EMPLOYEE e
INNER JOIN JOBTITLE jt ON e.ID = jt.EMPLOYEE_ID
WHERE jt.JOBTITLE_NAME IN ('Executive' , 'Manager');


--SORU 10 : Her bir birimde en yüksek maaþ alan çalýþanlarýn ad, soyad ve maaþ bilgilerini listeleyen sorguyu yazýnýz. (Tek bir sorgu ile)
SELECT EMPLOYEE_NAME, EMPLOYEE_SURNAME, SALARY, UNIT_NAME
FROM (
    SELECT e.EMPLOYEE_NAME, e.EMPLOYEE_SURNAME, e.SALARY, u.UNIT_NAME,
           ROW_NUMBER() OVER (PARTITION BY e.EMPLOYEE_UNIT ORDER BY e.SALARY DESC) AS ROW_NUM
    FROM EMPLOYEE e
    INNER JOIN UNIT u ON e.EMPLOYEE_UNIT = u.ID
) AS RANKED_EMPLOYEES
WHERE ROW_NUM = 1;