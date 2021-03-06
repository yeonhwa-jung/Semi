CREATE TABLE CART_PRD
(
	CART_ID VARCHAR2(50),
    CART_PRD_NUM NUMBER(8),
    CART_AMOUNT NUMBER(8) NOT NULL,
    CART_PRICE NUMBER(10) NOT NULL,
    CART_ORDER_SEQ NUMBER(8)
    ); 
    
ALTER TABLE CART_PRD
ADD CONSTRAINT FK_CART_ID FOREIGN KEY(CART_ID)
REFERENCES MEMBER(ID);   

ALTER TABLE CART_PRD
ADD CONSTRAINT FK_CART_PRD_NUM FOREIGN KEY(CART_PRD_NUM)
REFERENCES PRODUCT(PRD_NUM);

ALTER TABLE CART_PRD
ADD CONSTRAINT FK_CART_ORDER_SEQ FOREIGN KEY(CART_ORDER_SEQ)
REFERENCES ORDER_PRD(ORDER_SEQ);