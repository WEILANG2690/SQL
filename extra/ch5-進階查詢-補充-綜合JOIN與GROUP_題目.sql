use DB01
go

  
--�p�� �U����(department_id) �� �~��(salary)�`�X

  SELECT  DEPARTMENT_ID,sum(SALARY)
  FROM    employees
  GROUP   BY  department_id;


--�d�� �U���u�m�W(last_name),�~��(salary),�����s��(department_id) �Ω��ݳ����W��(department_name)  

  SELECT  e.LAST_NAME,e.SALARY,
				  d.DEPARTMENT_ID,d.DEPARTMENT_NAME
  FROM    EMPLOYEES e join DEPARTMENTS d
  ON          d.DEPARTMENT_ID = e.DEPARTMENT_ID

--�p�� �U�����W��(department_name)  �� �~��(salary)�`�X

  SELECT  d.DEPARTMENT_NAME,sum(salary)as �`�M
  FROM    EMPLOYEES e join DEPARTMENTS d
  ON         d.DEPARTMENT_ID= e.DEPARTMENT_ID
  GROUP   BY d.DEPARTMENT_NAME
  

--�p�� �U�����W��(department_id, department_name)  �� �~��(salary)�`�X

  SELECT  e.DEPARTMENT_ID,d.DEPARTMENT_ID,SUM(SALARY)as �`�M,d.DEPARTMENT_NAME
  FROM    EMPLOYEES e join DEPARTMENTS d
  ON     e.DEPARTMENT_ID = d.DEPARTMENT_ID
  GROUP   BY  E.DEPARTMENT_ID,d.DEPARTMENT_NAME,d.DEPARTMENT_ID
    

--�B�~�m�� 
--�d�� �Ȥ�q����Ӹ��

       Customers       (CustomerID) 
       Orders          (OrderID, CustomerID)
       [Order Details] (OrderID, ProductID)
       Products        (ProductID)

USE Northwind
go



