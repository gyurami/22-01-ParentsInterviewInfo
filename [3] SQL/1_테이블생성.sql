-- 1. 학생정보 테이블 생성
CREATE TABLE studentInfo(
    no NUMBER(5),
    grade NUMBER(1) NOT NULL,
    sclass VARCHAR2(2) NOT NULL,
    name VARCHAR2(10) NOT NULL,
    CONSTRAINT st_no_pk PRIMARY KEY(no)
);

-- 1-2. 학생정보 中 no 컬럼 자동증가 시퀀스 생성
CREATE SEQUENCE st_no_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


-- 2. 학부모 면담정보 테이블 생성
CREATE TABLE interviewInfo(
    ino NUMBER(5),
    no NUMBER(5),
    relation VARCHAR2(6) CONSTRAINT par_relation_nn NOT NULL,
    interview CLOB CONSTRAINT int_interview_nn NOT NULL,
    CONSTRAINT int_ino_pk PRIMARY KEY(ino),
    CONSTRAINT int_no_fk FOREIGN KEY(no)
    REFERENCES studentInfo(no)
    on delete cascade,
    CONSTRAINT par_relation_ch CHECK(relation IN('부', '모', '기타'))
);

-- 2-1. 학부모 면담정보 中 ino 컬럼 자동증가 시퀀스 생성
CREATE SEQUENCE int_ino_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;




--1-3. 학생정보 추가, 수정, 삭제
INSERT INTO studentInfo VALUES(ST_NO_SEQ.nextval, 3,3,'양요섭');
UPDATE studentInfo SET name='이은지' WHERE no=37;
DELETE FROM studentInfo WHERE no='1';

--2-3. 상담내용 추가, 수정, 삭제
INSERT INTO interviewInfo VALUES(int_ino_seq.nextval, 36,'기타','기타 가족의 상담내용입니다.');
UPDATE interviewInfo SET relation='모', interview='어머니 상담내용입니다.(수정)' WHERE ino=2;
DELETE FROM interviewInfo WHERE ino='40';

