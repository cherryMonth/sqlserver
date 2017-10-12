-- 单表查询
-- 查询全体学生的学号和姓名
-- select Sno,Sname from Student;

-- 查询全体学生的姓名和学号,所在系
-- select Sname,Sno,Sdept from Student;

-- 查询全体学生的详细记录
-- select * from Student;

-- 查询全体学生的姓名，学号，所在系
-- select Sname,Sno,Sdept from Student;

-- 查询全体学生的详细记录
-- select * from Student;

-- 查询全体学生的姓名及其出生年份
-- select Sname,2014-Sage from Student;

-- 查询全体学生的姓名，出生年份和所在院系，要求用小写字母表示系名。
-- select Sname, 'Year of Birth', 2014-Sage, LOWER(Sdept) from Student;

-- 定义别名 通过指定别名来改变查询结果的列标题
-- select Sname NAME,'Year of Birth:' BIRTH,2014-Sage BIRTHDAY,LOWER(Sdept) DEPARTMENT from Student;

-- 查询不重复的学号
-- select distinct Sno from Student;

-- 查询计算机科学系全体学生的名单
-- select Sname from Student where Sdept='CS';

-- 查询所有年龄在20岁以下的学生姓名及其年龄
-- select Sname,Sage from Student where Sage<20;

-- 查询考试成绩不及格的学生学号
-- select Sno from SC where Grade<60;

-- 查询考试成绩不及格的学生学号(不重复)
-- select DISTINCT Sno from SC where Grade<60;

-- 查询年龄在20~23岁之间(包括20岁和23岁)之间学生的姓名，系别和年龄
-- select Sname,Sdept,Sage from Student where Sage between 20 and 30;

-- 查询年龄不在20~23岁之间(包括20岁和23岁)之间学生的姓名，系别和年龄
-- select Sname,Sdept,Sage from Student where Sage not between 20 and 30;

-- 查询计算机科学系，数学系和信息系学生的姓名和性别
-- select Sname,Ssex from Student where Sdept in ('CS','MA','IS');

-- 查询既不是计算机科学系，数学系也不是信息系的学生的姓名和性别
-- select Sname,Ssex from Student where Sdept not in ('CS','MA','IS');

-- 查询学号为201215121的学生的详细情况
-- select * from Student where Sno like '201215121';

-- 用户可以用order by子句对查询结果按照一个或者多个属性列的升序(ASC)或者降序(DESC)默认是升序
-- 查询选修了3号课程的学生学号及其成绩,查询结果按分数的降序排列
-- select Sno,Grade from SC where Cno='3' order by Grade DESC;
-- 查询全体学生情况，查询结果按所在系的系号升序排列同一系的学生按照年龄降序排列
-- select * from Student order by Sdept,Sage DESC;

-- group by 子句
-- group by 子句将查询结果按某一列或者多列的值分组，值相等的为一组
-- 求各个课程号及相应的选课人数
-- select Cno,COUNT(Sno) from SC group by Cno;

















