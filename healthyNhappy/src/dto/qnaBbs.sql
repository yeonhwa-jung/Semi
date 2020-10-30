CREATE TABLE QNA_BOARD
(
    QNA_SEQ NUMBER(8) NOT NULL,
    QNA_ID VARCHAR2(50),
    QNA_TITLE VARCHAR2(300)NOT NULL,
    QNA_CONTENT VARCHAR2(4000) NOT NULL,
    QNA_WDATE DATE NOT NULL,
    QNA_FILE_NAME VARCHAR2(200),
    QNA_DEL NUMBER(1) NOT NULL,
    QNA_READCOUNT NUMBER(8) NOT NULL,
    QNA_OPEN NUMBER(1) NOT NULL,
    QNA_STATUS NUMBER(1) NOT NULL
    );
    
ALTER TABLE QNA_BOARD
ADD CONSTRAINT FK_QA_ID FOREIGN KEY(QNA_ID)
REFERENCES MEMBER(ID);

SELECT * FROM QNA_BOARD
SELECT COUNT(*) FROM QNA_BOARD

CREATE SEQUENCE SEQ_QNA
START WITH 1
INCREMENT BY 1;

SELECT QNA_SEQ, QNA_ID, QNA_TITLE, QNA_CONTENT, QNA_WDATE, QNA_DEL, QNA_READCOUNT, QNA_OPEN, QNA_STATUS
FROM
(SELECT ROW_NUMBER()OVER(ORDER BY QNA_SEQ DESC) AS RNUM,
 QNA_SEQ, QNA_ID, QNA_TITLE, QNA_CONTENT, QNA_WDATE, QNA_DEL, QNA_READCOUNT, QNA_OPEN, QNA_STATUS
 FROM QNA_BOARD
 ORDER BY QNA_SEQ DESC
 )

ALTER TABLE QNA_BOARD
MODIFY
FILE_NAME VARCHAR2(50);


SELECT TO_CHAR(QNA_WDATE,'YYYY/MM/DD HH24:MI:SS') from QNA_BOARD;
SELECT SYSDATE FROM DUAL

INSERT INTO QNA_BOARD 
(QNA_SEQ, QNA_ID, 
QNA_TITLE, QNA_CONTENT, QNA_WDATE, QNA_FILE_NAME, 
QNA_DEL, QNA_READCOUNT, QNA_OPEN, QNA_STATUS ) 
VALUES( 
SEQ_QNA.NEXTVAL, 'aaa', 
 '중복된 글입니다.', '중복된 내용입니다.중복된 내용입니다.중복된 내용입니다.중복된 내용입니다.중복된 내용입니다.
중복된 내용입니다.중복된 내용입니다.중복된 내용입니다.중복된 내용입니다.중복된 내용입니다.
중복된 내용입니다.중복된 내용입니다.중복된 내용입니다.중복된 내용입니다.중복된 내용입니다.', SYSDATE, null, 
0, 0, 0, 0);



DROP SEQUENCE SEQ_QNA

DROP TABLE QNA_BOARD CASCADE CONSTRAINTS;