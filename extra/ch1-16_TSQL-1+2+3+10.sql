--method 1 1+2+3...+10  ¿é¥X 55

declare  @x int,
         @s int
set @x = 1
set @s = 0
while (@x <= 10)
begin
  set @s = @s + @x 
  set @x = @x + 1
end		

select @s
print  @s
go 
 
--method 2 1+2+3...+10  ¿é¥X S= 55
declare  @x int,
         @s int,
		 @str varchar(2000)
set @x = 1
set @s = 0
set @str = ''
while (@x <= 10)
begin
  set @s = @s + @x 
  set @x = @x + 1
end		

select 'S= ' + cast (@s as varchar(20))
print  @s
 
 go
 
--method 3 1+2+3...+10   ¿é¥X S= 1+2+3+4+5+6+7+8+9+10= 55
declare  @x int,
         @s int,
		 @str varchar(2000)
set @x = 1
set @s = 0
set @str = ''
while (@x <= 10)
begin
  set @s = @s + @x 
  if @x = 10
    set @str = @str +  cast (@x as varchar(3)) + '= '
  else
    set @str = @str +  cast (@x as varchar(3)) + '+'
  set @x = @x + 1
end		

select 'S= ' +@str +  +cast (@s as varchar(20))

