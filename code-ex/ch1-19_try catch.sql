  select     1/0

  /*
  訊息 8134，層級 16，狀態 1，行 3 發現除以零的錯誤。

  */

--try catch

begin  try
  select   1  / 0
end try
begin catch
  select N'分母不可以為零'  --加 N 表萬國碼 顯示中文
end catch


