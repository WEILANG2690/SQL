--會員

create table member
( mno  int primary key,
  name  char(20)
);


--互加好友
create table friend
(  mno  int references member(mno),
   fmno int references member(mno)
);

insert into member  values ( 101,'張三');
insert into member  values ( 102,'李四');
insert into member  values ( 103,'王五');
--
insert into friend  values (101, 102);
insert into friend  values (101, 103);
insert into friend  values (102, 101);
insert into friend  values (103, 101);
--error
insert into friend  values (103, 104);
insert into friend  values (104, 101);

--

select * from member;
select * from prod;
select * from friend;


--列出好友資料

select *
from  member m  JOIN  friend  f
ON   m.mno = f.mno
JOIN  member  fm
ON  f.fmno = fm.mno


----------------------------

create table prod
(  ino  int primary key,
   smno  int  references member(mno),
   pname char(20),
   price int,
   bmno  int  references member(mno)
);

insert into  prod  values ( 1, 101, 'p1', 100, 102);
insert into  prod  values ( 2, 101, 'p1', 110, 103);

--列出賣物品會員及購買人list member name and buyername
--拍賣人及購買人 ,一樣物品只有一購買人

select *
from  member m JOIN  prod  p
ON    m.mno = p.smno
JOIN  member bm
ON   p.bmno = bm.mno

