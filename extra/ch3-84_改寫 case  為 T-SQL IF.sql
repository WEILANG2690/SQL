
--§ï¼g case  ¬° IF
create function  raise_sal  (@job_id varchar(20), @salary int)
returns int
as
begin

  if @job_id = 'IT_PROG' 
       return @salary * 1.1
  else if @job_id = 'ST_CLERK' 
       return @salary * 1.2
  else  return @salary

  return @salary

end


go
select  employee_id,  job_id, salary,  dbo.raise_sal(job_id, salary)
from  employees
