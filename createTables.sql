
-- create database miku
-- go
use miku
go

create table TAB1(
COL1 smallint,
COL2 int,
COL3 char(20),
COL4 numeric(10,3),
COL5 decimal(5,2)
);
 
create table Student /* 学生表 */
(Sno char(20) primary key,
Sname char(20) unique,
Ssex char(2),
Sage smallint,
Sdept char(20)
);

create table Course /* 课程表 */
(Cno char(4) primary key,
Cname char(40) not null, /* 列级完整性约束条件 Cname不能取空值 */
Cpno char(4), 
/* Cpno 的含义是先修课 */
Credit smallint,
Foreign key(Cpno) references Course(Cno) /* Cpno 是外码,被参照表是Course, 被参照列是Cno */
);


create table SC /* 学生选课表 */
(
  Sno char(20),
  Cno char(4),
  Grade smallint,
  primary key(Sno,Cno), /* 主键由两个属性构成 */
  foreign key(Sno) references Student(Sno),
  foreign key(Cno) references Course(Cno)
);

