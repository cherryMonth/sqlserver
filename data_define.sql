/*

-- 修改基本表
-- 向Student 表添加入学时间列 其数据类型为日期型(Sqlserver2008不支持Date类型 可以下载SqlServer2016免费版)
alter table Student add S_entrance Date; 

-- 将年龄的数据类型由字符型改为整形
alter table Student alter column Sage int;

-- 增加课程名称必须取唯一值的约束条件
alter table Course add unique (Cname);



-- 删除表
-- 级联删除Student 表
drop table Student cascade;

-- 索引的建立与删除
-- 创建索引
-- 为学生-课程数据库中的Student, Course, SC 三个表建立索引。其中Student 表按学号升序建唯一索引，Course按课程号升序建唯一索引，
SC表按学号升序和课程号降序建唯一索引
create unique index Stusno on Student(Sno);
create unique index Coucno on Course(Cno);
create unique index SCno on SC(Sno ASC,Cno DESC);

-- 修改索引
-- 对于已经建立的索引，如果需要对其重新命名，可以使用alter index语句。
-- 将SC表的SCno索引名改为SCSno;
alter index SCno rename to SCSno;

-- 删除索引
-- 删除Student 表的Stusname索引
drop index Stusname;


*/