
--case 0  1,2,3,...10

declare @x  int;
set @x  = 1;
while(@x <=10)
begin
   print  @x;
   set @x = @x + 1 ;   -- set @x += 1
end
go


--case 1  1+2+3...+10  ¿é¥X   55

declare @x  int,
        @s int;
set @x  = 1;
set @s = 0;
while(@x <=10)
begin
   --print  @x;
   set @s = @s + @x;
   set @x = @x + 1 ;   -- set @x += 1
end
   print  @s;
go

--case 2  ¿é¥X S= 55

declare @x  int,
        @s int;
set @x  = 1;
set @s = 0;
while(@x <=10)
begin
   --print  @x;
   set @s = @s + @x;
   set @x = @x + 1 ;   -- set @x += 1
end
   print  'S= ' + convert( varchar(5) , @s);
go


--case 3  ¿é¥X S= 1+2+3+4+5+6+7+8+9+10= 55

declare @x  int,
        @s int,
		@str  varchar(200);
set @x  = 1;
set @s = 0;
set @str = '';

while(@x <=10)
begin
   --print  @x;
   if @x <10
     set @str = @str + convert( varchar(3) , @x) + '+';
   else
      set @str = @str + convert( varchar(3) , @x) + '=';
   set @s = @s + @x;
   set @x = @x + 1 ;   -- set @x += 1
end
   print  'S= ' + @str  + convert( varchar(5) , @s);
go