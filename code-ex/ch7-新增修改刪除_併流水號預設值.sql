--1新增資料

INSERT INTO departments VALUES ( 71, 'Public Relations', 100, 1700 );

--新增常見的錯誤1  重複主鍵
INSERT INTO departments VALUES ( 71, 'aaa', 100, 1700 );

--新增常見的錯誤2 找不到外部鍵
INSERT INTO departments VALUES ( 72, 'aaa', 100, 1701 );

select * from DEPARTMENTS
select * from LOCATIONS 

--新增部份欄位 
 INSERT INTO departments ( department_id, department_name )
              VALUES  ( 31, 'Purchasing' );

--新增資料強迫補 NULL值
INSERT  INTO  departments  VALUES  ( 101, 'Finance', NULL, NULL );

--2一次新增多筆                         
drop table t1
create table t1(id int, n char(20))  
go
                       
insert into t1 values (1,'aa'), 
                      (2,'bb'),
                      (3,'cc')
select * from t1

--3a新增流水號,預設值 
use DB01
go
drop table shippers
go

create table Shippers(shipperid int identity,
                       company char(30) default 'abc',
                       phone   char(20) default '0920333555')
go
insert into shippers(company,phone  ) values('aaa', '0932556677')
insert into shippers(company,phone  ) values(default, default)
insert into shippers default values
go
select * from shippers
go

--3b流水號強迫輸入

set IDENTITY_INSERT dbo.shippers ON
go

--須個別列出欄位名稱
insert into shippers (shipperid,company,phone)  values (80,'ccc','0955555555')
go

--錯誤- 未個別列出欄位名稱
/* 訊息 8101，層級 16，狀態 1，行 1
位於資料表 'Shippers' 的識別欄位其外顯值只有當使用了資料行清單
且 IDENTITY_INSERT 為 ON 時才能指定。
*/

insert into  shippers values(81,'ccc','0955555555')
go

select * from shippers
go

--3c回復成流水號輸入

set IDENTITY_INSERT dbo.shippers OFF
go
insert into shippers(company,phone  ) values('bbb', '0932556678')

--刪除一筆資料,再新增
delete from shippers where shipperid = 3

--3d再新增時, 該筆被刪除的流水號, 會重覆使用嗎
insert into shippers(company,phone  ) values(default, default)
select * from shippers
go


--4a複製表格結構+資料 - 臨時資料表

SELECT employee_id id,  last_name name ,  salary,  commission_pct
INTO   #sales_reps3
FROM   employees

--4b 在同一session 查詢

select * from #sales_reps3

--4c但在另一session 查詢不到

select * from #sales_reps3


--5a複製表格結構+資料

SELECT employee_id id,  last_name name ,  salary,  commission_pct
INTO   sales_reps2
FROM   employees;

--5b查詢

select * from sales_reps2

--6a複製表格結構而以,不含資料, 利用 1 = 2 的小技巧

SELECT employee_id id,  last_name name ,  salary,  commission_pct
INTO   sales_reps
FROM   employees
WHERE  1=2;

--6b從查詢中新增資料

INSERT  INTO  sales_reps ( id,  name,  salary,  commission_pct )
SELECT  employee_id,  last_name,  salary,  commission_pct
FROM    employees
WHERE   job_id  LIKE  '%REP%' ;

--6c查詢

select * from sales_reps


--查詢現有資料,準備更新

select * from departments
select employee_id, department_id from employees

--更新資料

 UPDATE  employees
 SET     department_id  =  60
 WHERE   employee_id  =  178;

--更新資料2 子查詢

UPDATE employees
SET    job_id = (SELECT job_id 
                 FROM   employees 
                 WHERE  employee_id  =  205 ), 
       salary = (SELECT salary 
                 FROM   employees 
                 WHERE  employee_id  =  205 ) 
WHERE  employee_id =  141;

--刪除

 DELETE FROM   employees
 WHERE  employee_id  =  141;

--刪除2

DELETE FROM employees
WHERE  department_id  = (SELECT  department_id
                         FROM    departments
                         WHERE  department_name  LIKE  '%Payroll%' );
                         

--truncate table

TRUNCATE TABLE sales_reps;