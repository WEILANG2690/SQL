-- student 學員資料表 
-- course  學員各科成績

--** 單純 23 學員中 每人考三科, 有一學員 3科都沒考 , 沒登記分數 非登記成 零分
--** 難一點則 10號學員只考兩科   這時 平均分數 就會有爭議

--ch3
--查出分數(score) 大於90分以上的學員(不管那一科)
select *
from course
where score>90
order by score desc;

--查出課程名稱(name) 為 JAVA 且分數(score) 介於85分及90分之間的學員 
select name,score,id
from course
where name = 'java'  and score>=85 and score<=90
order by score desc;

--列出學員各科分數,從高到低排序(不管那一科)
select name,score,id
from course
order by score desc;
--列出學員各科分數,先依課程名稱(name)排序, 相同名稱再依分數從高到低排列 
select name,score,id
from course
group by name,score,id
order by name,score desc;

--ch4
--查出 平均 的分數是幾分 (不管那一科)

select  name,AVG(score)as 各科平均
from course
group by name


--依各科(name)分組, 列出各科(name)最高 的分數是幾分

select name, max(score)
from course
group by name

--依學號(id)分組, 列出各人總分
select  id,sum(score)as 總分
from course
group by id

--依學號(id)分組, 列出各人總分 大於 250 以上者  (列出學號,總分)
select  id,sum(score)as 總分
from course
group by id
HAVING SUM(score)>=250
order by SUM(score) desc;


--ch5
--列出學員姓名及各科成績
select s.name,c.name,score
from course c join student s
on s.id = c.id
group by s.id,s.name,c.name,score

--列出學員姓名及各科成績 (未參加考試的學員也要列出)
select s.name,c.name,score,s.id
from course c full outer join student s
on s.id = c.id
group by s.id,s.name,c.name,score

--ch6
--查出學員任一科分數大於總平均的有那些 (含學號,個人分數)
select c.id AS 學號,s.name AS 姓名,c.name AS 科目,score AS 成績 
from student s join course c
on s.id =  c.id
group by c.id,s.name,c.name,score
having score > any (
                       select avg(c.score)
					   from   course c   );


--依學號(id)分組, 計算學員總分最高者 (含學號,總分)

select  top 1 c.id AS 學號,s.name AS 姓名, SUM(score) sums 
from student s join course c
on s.id =  c.id
group by c.id,s.name
order by sums desc
--having SUM (c.score) >=  (
                       --select sum(c.score)
					   --from   course c   );


select  top 1 s.id,s.name,sum(score) sums
from student s join course c
on s.id=c.id
group by s.id,s.name
order by sums desc




--進階
--ch45
--列出學員姓名及總分
select s.name 姓名,sum(score) 總分
from student s join course c
on s.id = c.id
group by s.name

--列出學員學號,姓名及總分
select s.id,s.name 姓名,sum(score) 總分
from student s join course c
on s.id = c.id
group by s.id,s.name

--查出學員總分數最高 (含姓名,總分)
select top 1 s.id,s.name 姓名,sum(score) 總分
from student s join course c
on s.id = c.id
group by s.id,s.name
order by sum(score) desc

--查出學員總分數最高 (含學號,姓名,總分)
select top 1 s.id,s.name 姓名,sum(score) 總分
from student s join course c
on s.id = c.id
group by s.id,s.name
order by sum(score) desc

--ch456
--查出學員任一科分數大於總平均的有那些 (含姓名,個人分數) 
select c.id AS 學號,s.name AS 姓名,c.name AS 科目,sum(score) AS 成績 
from student s join course c
on s.id =  c.id
group by c.id,s.name,c.name
having avg(score) > any (
                       select avg(c.score)
					   from   course c   );

--查出學員各科分數大於該科平均的有那些 (含姓名,個人分數) 




select c.id AS 學號,s.name AS 姓名,c.name AS 科目,sum(score) AS 成績 
from student s join course c
on s.id =  c.id
where score > any(c.name in(select c.name,avg(c.score)
					       from   course c );


--ch8
--PIVOT 將學員各科成績轉成 PIVOT欄位 (含學號,[JAVA],[T-SQL],[電概]) 各科分數  )

--ch8 adv Subquery
--列出學員任一科分數及總平均分數 (含學號,個人分數,平均分數)
--查出學員任一科分數大於總平均的有那些 (含學號,個人分數,平均分數)



use DB01    --若 定序非 Chinese_Taiwan 則另建 DB

go

drop table course;
drop table student;
go

create table student
( id    int        PRIMARY KEY,   --學號
  name  nchar(20),                --姓名
  bdate date,
  tel   char(20)
);

create table course
( id    int     ,   --學號
  name  char(20),   --課名
  score int,        --分數
  FOREIGN KEY(id) REFERENCES student(id) 
);
go

insert into student values ( 1, '彭至淳','1993-04-21','09205556781');
insert into student values ( 2, '林雍原','1993-09-23','09205556789');
insert into student values ( 3, '黃彥坤','1993-08-25','09205556785');
insert into student values ( 4, '藍浩天','1993-07-27','09205556723');
insert into student values ( 5, '韓博鈞','1993-05-29','09205556889');
insert into student values ( 6, '許竣為','1993-06-22','09205556729');
insert into student values ( 7, '陳建業','1993-03-24','09205556726');
insert into student values ( 8, '陳品維','1993-01-26','09205556729');
insert into student values ( 9, '朱奕叡','1993-02-28','09205556789');
insert into student values (10, '陳泓宇','1993-11-20','09205556782');
insert into student values (11, '陳怡如','1993-10-21','09205556729');
insert into student values (12, '江致輝','1993-04-23','09205556389');
insert into student values (13, '李亦然','1993-05-25','09205556728');
insert into student values (14, '劉明凱','1993-07-23','09205556029');
insert into student values (15, '莊君威','1993-02-27','09205556783');
insert into student values (16, '黃世傑','1993-04-23','09205556789');
insert into student values (17, '賴彥誠','1993-06-29','09205556781');
insert into student values (18, '張紘瑋','1993-04-22','09205556780');
insert into student values (19, '林哲弘','1993-08-24','09205556789');
insert into student values (20, '李紹群','1993-04-26','09205556787');
insert into student values (21, '徐漢勳','1993-09-28','09205556089');
insert into student values (22, '高晟桓','1993-04-20','09205556189');
insert into student values (23, '林子傑','1993-05-25','09205556188');
go

insert into course values ( 1,'JAVA',85);
insert into course values ( 2,'JAVA',86);
insert into course values ( 3,'JAVA',80);
insert into course values ( 4,'JAVA',85);
insert into course values ( 5,'JAVA',75);
insert into course values ( 6,'JAVA',70);
insert into course values ( 7,'JAVA',92);
insert into course values ( 8,'JAVA',85);
insert into course values ( 9,'JAVA',83);
insert into course values (11,'JAVA',87);
insert into course values (12,'JAVA',85);
insert into course values (13,'JAVA',86);
insert into course values (14,'JAVA',85);
insert into course values (15,'JAVA',84);
insert into course values (16,'JAVA',75);
insert into course values (17,'JAVA',81);
insert into course values (18,'JAVA',85);
insert into course values (19,'JAVA',79);
insert into course values (20,'JAVA',85);
insert into course values (21,'JAVA',78);
insert into course values (22,'JAVA',85);

go

insert into course values ( 1,'電概',81);
insert into course values ( 2,'電概',80);
insert into course values ( 3,'電概',82);
insert into course values ( 4,'電概',84);
insert into course values ( 5,'電概',64);
insert into course values ( 6,'電概',83);
insert into course values ( 7,'電概',85);
insert into course values ( 8,'電概',87);
insert into course values ( 9,'電概',86);
insert into course values (10,'電概',85);
insert into course values (11,'電概',82);
insert into course values (12,'電概',81);
insert into course values (13,'電概',89);
insert into course values (14,'電概',85);
insert into course values (15,'電概',88);
insert into course values (16,'電概',87);
insert into course values (17,'電概',86);
insert into course values (18,'電概',85);
insert into course values (19,'電概',84);
insert into course values (20,'電概',82);
insert into course values (21,'電概',85);
insert into course values (22,'電概',81);
go

insert into course values ( 1,'T-SQL',85);
insert into course values ( 2,'T-SQL',85);
insert into course values ( 3,'T-SQL',80);
insert into course values ( 4,'T-SQL',85);
insert into course values ( 5,'T-SQL',85);
insert into course values ( 6,'T-SQL',83);
insert into course values ( 7,'T-SQL',85);
insert into course values ( 8,'T-SQL',82);
insert into course values ( 9,'T-SQL',91);
insert into course values (10,'T-SQL',85);
insert into course values (11,'T-SQL',85);
insert into course values (12,'T-SQL',87);
insert into course values (13,'T-SQL',85);
insert into course values (14,'T-SQL',85);
insert into course values (15,'T-SQL',86);
insert into course values (16,'T-SQL',85);
insert into course values (17,'T-SQL',85);
insert into course values (18,'T-SQL',89);
insert into course values (19,'T-SQL',85);
insert into course values (20,'T-SQL',88);
insert into course values (21,'T-SQL',85);
insert into course values (22,'T-SQL',84);
go

/* Unicode
insert into student values (24, N'黃瀞賢','1993-07-23','09206256029');
insert into student values (25, N'曾珦煊','1983-06-22','09205556789');
insert into student values (26, N'黃頎晧','1983-04-23','09207556789');
*/

select * from student;
select * from course;
