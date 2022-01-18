-- 1. �л����� ���̺� ����
CREATE TABLE studentInfo(
    no NUMBER(5),
    grade NUMBER(1) NOT NULL,
    sclass VARCHAR2(2) NOT NULL,
    name VARCHAR2(10) NOT NULL,
    CONSTRAINT st_no_pk PRIMARY KEY(no)
);

-- 1-2. �л����� �� no �÷� �ڵ����� ������ ����
CREATE SEQUENCE st_no_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


-- 2. �кθ� ������� ���̺� ����
CREATE TABLE interviewInfo(
    ino NUMBER(5),
    no NUMBER(5),
    relation VARCHAR2(6) CONSTRAINT par_relation_nn NOT NULL,
    interview CLOB CONSTRAINT int_interview_nn NOT NULL,
    CONSTRAINT int_ino_pk PRIMARY KEY(ino),
    CONSTRAINT int_no_fk FOREIGN KEY(no)
    REFERENCES studentInfo(no)
    on delete cascade,
    CONSTRAINT par_relation_ch CHECK(relation IN('��', '��', '��Ÿ'))
);

-- 2-1. �кθ� ������� �� ino �÷� �ڵ����� ������ ����
CREATE SEQUENCE int_ino_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;




--1-3. �л����� �߰�, ����, ����
INSERT INTO studentInfo VALUES(ST_NO_SEQ.nextval, 3,3,'��伷');
UPDATE studentInfo SET name='������' WHERE no=37;
DELETE FROM studentInfo WHERE no='1';

--2-3. ��㳻�� �߰�, ����, ����
INSERT INTO interviewInfo VALUES(int_ino_seq.nextval, 36,'��Ÿ','��Ÿ ������ ��㳻���Դϴ�.');
UPDATE interviewInfo SET relation='��', interview='��Ӵ� ��㳻���Դϴ�.(����)' WHERE ino=2;
DELETE FROM interviewInfo WHERE ino='40';

