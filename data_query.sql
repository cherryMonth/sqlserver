-- �����ѯ
-- ��ѯȫ��ѧ����ѧ�ź�����
-- select Sno,Sname from Student;

-- ��ѯȫ��ѧ����������ѧ��,����ϵ
-- select Sname,Sno,Sdept from Student;

-- ��ѯȫ��ѧ������ϸ��¼
-- select * from Student;

-- ��ѯȫ��ѧ����������ѧ�ţ�����ϵ
-- select Sname,Sno,Sdept from Student;

-- ��ѯȫ��ѧ������ϸ��¼
-- select * from Student;

-- ��ѯȫ��ѧ������������������
-- select Sname,2014-Sage from Student;

-- ��ѯȫ��ѧ����������������ݺ�����Ժϵ��Ҫ����Сд��ĸ��ʾϵ����
-- select Sname, 'Year of Birth', 2014-Sage, LOWER(Sdept) from Student;

-- ������� ͨ��ָ���������ı��ѯ������б���
-- select Sname NAME,'Year of Birth:' BIRTH,2014-Sage BIRTHDAY,LOWER(Sdept) DEPARTMENT from Student;

-- ��ѯ���ظ���ѧ��
-- select distinct Sno from Student;

-- ��ѯ�������ѧϵȫ��ѧ��������
-- select Sname from Student where Sdept='CS';

-- ��ѯ����������20�����µ�ѧ��������������
-- select Sname,Sage from Student where Sage<20;

-- ��ѯ���Գɼ��������ѧ��ѧ��
-- select Sno from SC where Grade<60;

-- ��ѯ���Գɼ��������ѧ��ѧ��(���ظ�)
-- select DISTINCT Sno from SC where Grade<60;

-- ��ѯ������20~23��֮��(����20���23��)֮��ѧ����������ϵ�������
-- select Sname,Sdept,Sage from Student where Sage between 20 and 30;

-- ��ѯ���䲻��20~23��֮��(����20���23��)֮��ѧ����������ϵ�������
-- select Sname,Sdept,Sage from Student where Sage not between 20 and 30;

-- ��ѯ�������ѧϵ����ѧϵ����Ϣϵѧ�����������Ա�
-- select Sname,Ssex from Student where Sdept in ('CS','MA','IS');

-- ��ѯ�Ȳ��Ǽ������ѧϵ����ѧϵҲ������Ϣϵ��ѧ�����������Ա�
-- select Sname,Ssex from Student where Sdept not in ('CS','MA','IS');

-- ��ѯѧ��Ϊ201215121��ѧ������ϸ���
-- select * from Student where Sno like '201215121';

-- �û�������order by�Ӿ�Բ�ѯ�������һ�����߶�������е�����(ASC)���߽���(DESC)Ĭ��������
-- ��ѯѡ����3�ſγ̵�ѧ��ѧ�ż���ɼ�,��ѯ����������Ľ�������
-- select Sno,Grade from SC where Cno='3' order by Grade DESC;
-- ��ѯȫ��ѧ���������ѯ���������ϵ��ϵ����������ͬһϵ��ѧ���������併������
-- select * from Student order by Sdept,Sage DESC;

-- group by �Ӿ�
-- group by �Ӿ佫��ѯ�����ĳһ�л��߶��е�ֵ���飬ֵ��ȵ�Ϊһ��
-- ������γ̺ż���Ӧ��ѡ������
-- select Cno,COUNT(Sno) from SC group by Cno;

















