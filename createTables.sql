
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
 
create table Student /* ѧ���� */
(Sno char(20) primary key,
Sname char(20) unique,
Ssex char(2),
Sage smallint,
Sdept char(20)
);

create table Course /* �γ̱� */
(Cno char(4) primary key,
Cname char(40) not null, /* �м�������Լ������ Cname����ȡ��ֵ */
Cpno char(4), 
/* Cpno �ĺ��������޿� */
Credit smallint,
Foreign key(Cpno) references Course(Cno) /* Cpno ������,�����ձ���Course, ����������Cno */
);


create table SC /* ѧ��ѡ�α� */
(
  Sno char(20),
  Cno char(4),
  Grade smallint,
  primary key(Sno,Cno), /* �������������Թ��� */
  foreign key(Sno) references Student(Sno),
  foreign key(Cno) references Course(Cno)
);

