/*

-- �޸Ļ�����
-- ��Student �������ѧʱ���� ����������Ϊ������(Sqlserver2008��֧��Date���� ��������SqlServer2016��Ѱ�)
alter table Student add S_entrance Date; 

-- ������������������ַ��͸�Ϊ����
alter table Student alter column Sage int;

-- ���ӿγ����Ʊ���ȡΨһֵ��Լ������
alter table Course add unique (Cname);



-- ɾ����
-- ����ɾ��Student ��
drop table Student cascade;

-- �����Ľ�����ɾ��
-- ��������
-- Ϊѧ��-�γ����ݿ��е�Student, Course, SC ������������������Student ��ѧ������Ψһ������Course���γ̺�����Ψһ������
SC��ѧ������Ϳγ̺Ž���Ψһ����
create unique index Stusno on Student(Sno);
create unique index Coucno on Course(Cno);
create unique index SCno on SC(Sno ASC,Cno DESC);

-- �޸�����
-- �����Ѿ������������������Ҫ������������������ʹ��alter index��䡣
-- ��SC���SCno��������ΪSCSno;
alter index SCno rename to SCSno;

-- ɾ������
-- ɾ��Student ���Stusname����
drop index Stusname;


*/