-- drop table Student;
-- drop table Course;
-- drop table SC;

create table Student 
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

insert into Student values ('201215121', '李勇', '男',20 , 'CS');
insert into Student values ('201215122', '刘晨', '女',19, 'CS');
insert into Student values ('201215123', '王敏', '女',18 , 'MA');
insert into Student values ('201215125', '张立', '男',19 , 'IS');
insert into Student values ('201516920711', '宋建', '男',20 , 'SE');

insert into Course values('2','数学',null,2);
insert into Course values('6','数据处理',null,2);
insert into Course values('7','PASCAL语言','6',4);
insert into Course values('5','数据结构','7',4);
insert into Course values('1','数据库','5',4);
insert into Course values('3','信息系统','1',4);
insert into Course values('4','操作系统','6',3);

insert into SC values('201215121','1',92);
insert into SC values('201215121','2',85);
insert into SC values('201215121','3',88);
insert into SC values('201215122','2',90);
insert into SC values('201215122','3',80);

-- create CLUSTERED index Stuno on Student(Sname); /* 创建非唯一聚簇索引 */

-- create unique CLUSTERED index Stuno on Student(Sname); /* 创建唯一聚簇索引 */

-- create index Stuno on Student(Sname); /* 创建非唯一非聚簇索引 */

-- create unique index Stuno on Student(Sname); /* 创建唯一非聚簇索引 */






