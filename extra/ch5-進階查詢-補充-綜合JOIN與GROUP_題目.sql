use DB01
go

  
--計算 各部門(department_id) 的 薪資(salary)總合

  SELECT  DEPARTMENT_ID,sum(SALARY)
  FROM    employees
  GROUP   BY  department_id;


--查詢 各員工姓名(last_name),薪資(salary),部門編號(department_id) 及所屬部門名稱(department_name)  

  SELECT  e.LAST_NAME,e.SALARY,
				  d.DEPARTMENT_ID,d.DEPARTMENT_NAME
  FROM    EMPLOYEES e join DEPARTMENTS d
  ON          d.DEPARTMENT_ID = e.DEPARTMENT_ID

--計算 各部門名稱(department_name)  的 薪資(salary)總合

  SELECT  d.DEPARTMENT_NAME,sum(salary)as 總和
  FROM    EMPLOYEES e join DEPARTMENTS d
  ON         d.DEPARTMENT_ID= e.DEPARTMENT_ID
  GROUP   BY d.DEPARTMENT_NAME
  

--計算 各部門名稱(department_id, department_name)  的 薪資(salary)總合

  SELECT  e.DEPARTMENT_ID,d.DEPARTMENT_ID,SUM(SALARY)as 總和,d.DEPARTMENT_NAME
  FROM    EMPLOYEES e join DEPARTMENTS d
  ON     e.DEPARTMENT_ID = d.DEPARTMENT_ID
  GROUP   BY  E.DEPARTMENT_ID,d.DEPARTMENT_NAME,d.DEPARTMENT_ID
    

--額外練習 
--查詢 客戶訂單明細資料

       Customers       (CustomerID) 
       Orders          (OrderID, CustomerID)
       [Order Details] (OrderID, ProductID)
       Products        (ProductID)

USE Northwind
go



