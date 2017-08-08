--子查詢用於資料來源 FROM

use DB01
go

SELECT name, pay, startyear
FROM   ( SELECT first_name,  salary  , YEAR ( hire_date )
         FROM   employees
         WHERE  job_id  =  'ST_CLERK'
       ) AS  clerks  ( name,  pay,  startyear )
WHERE  pay < 3000  and  startyear <  2000;
  
--改寫成CTE
    
WITH emp2
AS
( SELECT first_name name,  salary pay , YEAR ( hire_date ) startyear
  FROM   employees
  WHERE  job_id  =  'ST_CLERK')
SELECT  *
FROM emp2
WHERE  pay < 3000  and  startyear <  2000;


--改寫成 不用子查詢
SELECT first_name,  salary  , YEAR ( hire_date )
FROM   employees
WHERE  job_id  =  'ST_CLERK' and 
salary < 3000  and  YEAR(hire_date) <  2000;
  