-----------------삭제------------------
-- 해당 계정의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
--해당 계정의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT * FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE "'||C.TABLE_NAME||'" CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--해당 계정의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--해당 계정의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
---------------------------------------

--시퀀스 

-- 시퀀스 생성

-- 게시글번호 시퀀스
CREATE SEQUENCE SEQ_BOARDNO
NOCACHE;

-- 레시피글번호 시퀀스
CREATE SEQUENCE SEQ_RECIPENO
NOCACHE;

-- 댓글번호 시퀀스
CREATE SEQUENCE SEQ_REPLYNO
NOCACHE;

-- 요리순서번호 시퀀스
CREATE SEQUENCE SEQ_COOKINGNO
NOCACHE;

-- 상품 번호 시퀀스
CREATE SEQUENCE SEQ_PRODUCTNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE;

--상품 이미지 번호 시퀀스  
CREATE SEQUENCE SEQ_FILENO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE;     

 -- 회원테이블
CREATE SEQUENCE SEQ_MEMBERNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 

-- FAQ
CREATE SEQUENCE SEQ_FAQNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 

-- 신고관리
CREATE SEQUENCE SEQ_REPORTNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 

-- 주문 번호 시퀀스
CREATE SEQUENCE SEQ_ORDERNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE;  

-- 장바구니 번호
CREATE SEQUENCE SEQ_CARTNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 

-- 결제 번호
CREATE SEQUENCE SEQ_PAYMENT
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 

-- 적립금 번호
CREATE SEQUENCE SEQ_POINTNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 

-- 리뷰 번호
CREATE SEQUENCE SEQ_REVIEWNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 

-- 1:1질문게시판 번호
CREATE SEQUENCE SEQ_CONSULTNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 

-- 주문별 상품 시퀀스 생성

CREATE SEQUENCE SEQ_ORDPRONO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE;  


-- 테이블 생성

CREATE TABLE "PRODUCT" (
	"PRO_NO"	NUMBER		NOT NULL,
	"PRO_NAME"	VARCHAR2(500)		NOT NULL,
	"PRICE"	NUMBER		NOT NULL,
	"SOLDOUT"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	"EXPIRED_DATE"	VARCHAR2(100)		NOT NULL,
	"ENROLL_DATE"	VARCHAR2(100)	DEFAULT SYSDATE	NOT NULL,
	"SAVE"	NUMBER	DEFAULT 0.1	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	"THUMB_IMG"	VARCHAR2(1000)		NOT NULL,
	"CATEGORY"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "PRODUCT"."PRO_NO" IS '상품 번호';

COMMENT ON COLUMN "PRODUCT"."PRO_NAME" IS '상품명';

COMMENT ON COLUMN "PRODUCT"."PRICE" IS '가격';

COMMENT ON COLUMN "PRODUCT"."SOLDOUT" IS '품절여부';

COMMENT ON COLUMN "PRODUCT"."EXPIRED_DATE" IS '유통기한';

COMMENT ON COLUMN "PRODUCT"."ENROLL_DATE" IS '등록일';

COMMENT ON COLUMN "PRODUCT"."SAVE" IS '적립률 (%)';

COMMENT ON COLUMN "PRODUCT"."STATUS" IS 'STATUS';

COMMENT ON COLUMN "PRODUCT"."THUMB_IMG" IS '섬네일경로';

COMMENT ON COLUMN "PRODUCT"."CATEGORY" IS '카테고리';

CREATE TABLE "MEMBER" (
	"USER_NO"	NUMBER		NOT NULL,
	"USER_ID"	VARCHAR2(20)		NOT NULL,
	"USER_PWD"	VARCHAR2(20)		NOT NULL,
	"USER_NAME"	VARCHAR2(20)		NOT NULL,
	"EMAIL"	VARCHAR2(30)		NULL,
	"PHONE"	VARCHAR2(20)		NOT NULL,
	"POST_CODE"	NUMBER		NOT NULL,
	"ADDRESS"	VARCHAR2(100)		NOT NULL,
	"DETAILED_ADDRESS"	VARCHAR2(100)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"POINT"	NUMBER	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "MEMBER"."USER_ID" IS '회원아이디';

COMMENT ON COLUMN "MEMBER"."USER_PWD" IS '비밀번호';

COMMENT ON COLUMN "MEMBER"."USER_NAME" IS '이름';

COMMENT ON COLUMN "MEMBER"."EMAIL" IS '이메일';

COMMENT ON COLUMN "MEMBER"."PHONE" IS '휴대전화';

COMMENT ON COLUMN "MEMBER"."POST_CODE" IS '우편번호';

COMMENT ON COLUMN "MEMBER"."ADDRESS" IS '기본주소';

COMMENT ON COLUMN "MEMBER"."DETAILED_ADDRESS" IS '상세주소';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '가입일';

COMMENT ON COLUMN "MEMBER"."MODIFY_DATE" IS '정보변경일';

COMMENT ON COLUMN "MEMBER"."STATUS" IS '상태(Y/N)';

COMMENT ON COLUMN "MEMBER"."POINT" IS '적립금';

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TYPE"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	CLOB		NOT NULL,
	"BOARD_WRITER"	NUMBER		NOT NULL,
	"COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "BOARD"."BOARD_TYPE" IS '공지사항(1) / 자유게시판(2)';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글내용';

COMMENT ON COLUMN "BOARD"."BOARD_WRITER" IS '회원번호 / 관리자번호';

COMMENT ON COLUMN "BOARD"."COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."CREATE_DATE" IS '게시글작성일';

COMMENT ON COLUMN "BOARD"."STATUS" IS '상태';

CREATE TABLE "RECIPE" (
	"RECIPE_NO"	NUMBER		NOT NULL,
	"RECIPE_TITLE"	VARCHAR2(100)		NOT NULL,
	"RECIPE_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"THUMBIMG"	VARCHAR2(1000)		NOT NULL,
	"EFFECT"	VARCHAR2(50)		NULL,
	"TIME"	NUMBER		NULL,
	"INGREDIENT"	VARCHAR2(1000)		NULL,
	"PROCESS_COUNT"	NUMBER	DEFAULT 2	NOT NULL,
	"COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL
);

COMMENT ON COLUMN "RECIPE"."RECIPE_NO" IS '레시피글번호';

COMMENT ON COLUMN "RECIPE"."RECIPE_TITLE" IS '레시피제목';

COMMENT ON COLUMN "RECIPE"."RECIPE_CONTENT" IS '레시피소개';

COMMENT ON COLUMN "RECIPE"."THUMBIMG" IS '썸네일파일경로+수정명';

COMMENT ON COLUMN "RECIPE"."EFFECT" IS '효과(10,20,30,40,50)';

COMMENT ON COLUMN "RECIPE"."TIME" IS '소요시간(10, 20, 30, 40)';

COMMENT ON COLUMN "RECIPE"."INGREDIENT" IS '재료들';

COMMENT ON COLUMN "RECIPE"."PROCESS_COUNT" IS '요리순서개수(2~10)';

COMMENT ON COLUMN "RECIPE"."COUNT" IS '조회수';

COMMENT ON COLUMN "RECIPE"."CREATE_DATE" IS '레시피글작성일';

COMMENT ON COLUMN "RECIPE"."STATUS" IS '상태';

CREATE TABLE "REPLY" (
	"REPLY_NO"	NUMBER		NOT NULL,
	"BOARD_TYPE"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"REPLY_WRITER"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글번호';

COMMENT ON COLUMN "REPLY"."BOARD_TYPE" IS '글분류(공지1 / 자유2/ 레시피3)';

COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '참조게시글번호';

COMMENT ON COLUMN "REPLY"."REPLY_WRITER" IS '회원번호';

COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글내용';

COMMENT ON COLUMN "REPLY"."CREATE_DATE" IS '댓글작성일';

COMMENT ON COLUMN "REPLY"."STATUS" IS '상태';

CREATE TABLE "TB_CART" (
	"CART_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"PRO_NO"	NUMBER		NOT NULL,
	"CART_QTY"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_CART"."CART_NO" IS '장바구니번호';

COMMENT ON COLUMN "TB_CART"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_CART"."PRO_NO" IS '상품번호';

COMMENT ON COLUMN "TB_CART"."CART_QTY" IS '상품수량';

CREATE TABLE "COOKING" (
	"COOKING_NO"	NUMBER		NOT NULL,
	"RECIPE_NO"	NUMBER		NOT NULL,
	"COOKING_ORDER"	NUMBER		NOT NULL,
	"COOKING_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"FILE_PATH"	VARCHAR2(1000)		NULL
);

COMMENT ON COLUMN "COOKING"."COOKING_NO" IS '요리순서글번호';

COMMENT ON COLUMN "COOKING"."RECIPE_NO" IS '레시피글번호';

COMMENT ON COLUMN "COOKING"."COOKING_ORDER" IS '요리순서(1~10)';

COMMENT ON COLUMN "COOKING"."COOKING_CONTENT" IS '해당순서설명';

COMMENT ON COLUMN "COOKING"."FILE_PATH" IS '이미지파일경로+수정명';

CREATE TABLE "PRO_ATT" (
	"FILE_NO"	NUMBER		NOT NULL,
	"PRO_NO"	NUMBER		NOT NULL,
	"FILE_PATH"	VARCHAR2(1000)		NOT NULL,
	"UPLOAD_DATE"	VARCHAR2(100)	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	"FILE_LEVEL"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "PRO_ATT"."FILE_NO" IS '파일번호';

COMMENT ON COLUMN "PRO_ATT"."PRO_NO" IS '상품 번호';

COMMENT ON COLUMN "PRO_ATT"."FILE_PATH" IS '저장폴더경로';

COMMENT ON COLUMN "PRO_ATT"."UPLOAD_DATE" IS '업로드일';

COMMENT ON COLUMN "PRO_ATT"."STATUS" IS 'STATUS';

COMMENT ON COLUMN "PRO_ATT"."FILE_LEVEL" IS 'VARCHAR2(1)';

CREATE TABLE "REPORT" (
	"REPORT_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"POST_NO"	NUMBER		NOT NULL,
	"REPORT_CONTENT"	VARCHAR2(100)		NULL,
	"DONE"	VARCHAR2(1)	DEFAULT 'N'	NULL,
	"REPORT_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "REPORT"."REPORT_NO" IS '신고번호';

COMMENT ON COLUMN "REPORT"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "REPORT"."POST_NO" IS '참조게시글번호';

COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고내용';

COMMENT ON COLUMN "REPORT"."DONE" IS '상태';

COMMENT ON COLUMN "REPORT"."REPORT_DATE" IS '신고날짜';

CREATE TABLE "REVIEW" (
	"REVIEW_NO"	NUMBER		NOT NULL,
	"ORD_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"REVIEW_TITLE"	VARCHAR2(1000)		NOT NULL,
	"REVIEW_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"STAR"	NUMBER		NOT NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REVIEW_PHOTO"	VARCHAR2(1000)		NULL,
	"FILE_PATH"	VARCHAR2(1000)		NULL,
	"STATUS"	VARCHAR2(10)	DEFAULT 'Y'	NOT NULL
);

COMMENT ON COLUMN "REVIEW"."REVIEW_NO" IS '리뷰번호';

COMMENT ON COLUMN "REVIEW"."ORD_NO" IS '주문 번호';

COMMENT ON COLUMN "REVIEW"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "REVIEW"."REVIEW_TITLE" IS '리뷰제목';

COMMENT ON COLUMN "REVIEW"."REVIEW_CONTENT" IS '리뷰내용';

COMMENT ON COLUMN "REVIEW"."STAR" IS '별점';

COMMENT ON COLUMN "REVIEW"."MODIFY_DATE" IS '리뷰수정일';

COMMENT ON COLUMN "REVIEW"."ENROLL_DATE" IS '리뷰작성일';

COMMENT ON COLUMN "REVIEW"."REVIEW_PHOTO" IS '첨부파일원본명';

COMMENT ON COLUMN "REVIEW"."FILE_PATH" IS '첨부파일경로';

COMMENT ON COLUMN "REVIEW"."STATUS" IS 'STATUS';

CREATE TABLE "POINT" (
	"POINT_NO"	NUMBER		NOT NULL,
	"POINT_CATEGORY"	VARCHAR2(100)		NULL,
	"POINT_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"POINT_USE"	VARCHAR2(1000)		NULL,
	"POINT_PRICE"	NUMBER	DEFAULT 0	NOT NULL,
	"USER_NO"	NUMBER		NULL,
	"ORD_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "POINT"."POINT_NO" IS '적립금번호';

COMMENT ON COLUMN "POINT"."POINT_CATEGORY" IS '적립/사용';

COMMENT ON COLUMN "POINT"."POINT_DATE" IS '적립및사용날짜';

COMMENT ON COLUMN "POINT"."POINT_USE" IS '적립및사용내역';

COMMENT ON COLUMN "POINT"."POINT_PRICE" IS '적립및사용금액';

COMMENT ON COLUMN "POINT"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "POINT"."ORD_NO" IS '주문 번호';

CREATE TABLE "PAYMENT" (
	"PAYMENT_NO"	NUMBER		NOT NULL,
	"ORD_NO"	NUMBER		NOT NULL,
	"DISCOUNT"	NUMBER		NULL,
	"DELIVERY"	NUMBER	DEFAULT 4000	NOT NULL,
	"TOTAL_PRICE"	NUMBER		NOT NULL,
	"PAY_DATE"	DATE		NOT NULL,
	"CARD"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "PAYMENT"."PAYMENT_NO" IS '결제번호';

COMMENT ON COLUMN "PAYMENT"."ORD_NO" IS '주문한 상품가격';

COMMENT ON COLUMN "PAYMENT"."DISCOUNT" IS '적립금할인금액';

COMMENT ON COLUMN "PAYMENT"."DELIVERY" IS '배송비';

COMMENT ON COLUMN "PAYMENT"."TOTAL_PRICE" IS '총가격';

CREATE TABLE "ADMIN" (
	"ADMIN_NO"	NUMBER		NOT NULL,
	"ADMIN_ID"	VARCHAR2(20)		NOT NULL,
	"PASSWORD"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "ADMIN"."ADMIN_NO" IS '관리자번호';

COMMENT ON COLUMN "ADMIN"."ADMIN_ID" IS '관리자 아이디';

COMMENT ON COLUMN "ADMIN"."PASSWORD" IS '관리자 비밀번호';

CREATE TABLE "CONSULT" (
	"CONSULT_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"RESPONDENTS"	NUMBER		NULL,
	"CONSULT_TITLE"	VARCHAR2(1000)		NOT NULL,
	"CONSULT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CONSULT_ANSWER"	VARCHAR2(4000)		NULL,
	"ANSWER_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(1000)		NULL,
	"FILE_PATH"	VARCHAR2(1000)		NULL,
	"CONSULT_CATEGORY"	VARCHAR2(100)		NOT NULL,
	"ANSWER_STATUS"	VARCHAR2(50)	DEFAULT '미답변'	NULL
);

COMMENT ON COLUMN "CONSULT"."CONSULT_NO" IS '문의번호';

COMMENT ON COLUMN "CONSULT"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "CONSULT"."RESPONDENTS" IS '답변자';

COMMENT ON COLUMN "CONSULT"."CONSULT_TITLE" IS '문의제목';

COMMENT ON COLUMN "CONSULT"."CONSULT_CONTENT" IS '문의내용';

COMMENT ON COLUMN "CONSULT"."ENROLL_DATE" IS '질문직성일';

COMMENT ON COLUMN "CONSULT"."MODIFY_DATE" IS '질문수정일';

COMMENT ON COLUMN "CONSULT"."CONSULT_ANSWER" IS '질문답변';

COMMENT ON COLUMN "CONSULT"."ANSWER_DATE" IS '질문답변일';

COMMENT ON COLUMN "CONSULT"."STATUS" IS 'STATUS';

COMMENT ON COLUMN "CONSULT"."ORIGIN_NAME" IS '첨부파일원본명';

COMMENT ON COLUMN "CONSULT"."FILE_PATH" IS '첨부파일경로';

COMMENT ON COLUMN "CONSULT"."CONSULT_CATEGORY" IS '카테고리';

COMMENT ON COLUMN "CONSULT"."ANSWER_STATUS" IS '답변/미답변';

CREATE TABLE "FAQ" (
	"CONTACT_NO"	NUMBER		NOT NULL,
	"CONTACT_TITLE"	VARCHAR2(500)		NOT NULL,
	"CONTACT_ANSWER"	VARCHAR2(500)		NOT NULL,
	"CATEGORY"	VARCHAR2(50)		NOT NULL,
	"FAQ_WRITER"	NUMBER	DEFAULT 0	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "FAQ"."CONTACT_NO" IS 'FAQ번호';

COMMENT ON COLUMN "FAQ"."CONTACT_TITLE" IS 'FAQ제목';

COMMENT ON COLUMN "FAQ"."CONTACT_ANSWER" IS 'FAQ답변';

COMMENT ON COLUMN "FAQ"."CATEGORY" IS 'FAQ카테고리';

COMMENT ON COLUMN "FAQ"."FAQ_WRITER" IS 'FAQ등록자';

COMMENT ON COLUMN "FAQ"."STATUS" IS '상태(Y/N)';

CREATE TABLE "LIKE" (
	"PRO_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"LIKE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "LIKE"."PRO_NO" IS '상품 번호';

COMMENT ON COLUMN "LIKE"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "LIKE"."LIKE_DATE" IS '찜한날짜';

CREATE TABLE "ORD_PRO" (
	"ORD_PRO_NO"	NUMBER		NOT NULL,
	"ORD_NO"	NUMBER		NOT NULL,
	"PRO_NO"	NUMBER		NOT NULL,
	"AMOUNT"	NUMBER	DEFAULT 1	NULL
);

COMMENT ON COLUMN "ORD_PRO"."ORD_PRO_NO" IS '식별 번호';

COMMENT ON COLUMN "ORD_PRO"."ORD_NO" IS '주문 번호';

COMMENT ON COLUMN "ORD_PRO"."PRO_NO" IS '상품 번호';

COMMENT ON COLUMN "ORD_PRO"."AMOUNT" IS '수량';

CREATE TABLE "HEART" (
	"RECIPE_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"HEART_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "HEART"."RECIPE_NO" IS '레시피글번호';

COMMENT ON COLUMN "HEART"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "HEART"."HEART_DATE" IS '하트누른날짜';

CREATE TABLE "TB_ORDER" (
	"ORD_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"DEL_ADD"	VARCHAR(30)		NULL,
	"PAYMENT"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	"DELIVERY"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	"PHONE"	VARCHAR2(100)		NOT NULL,
	"EMAIL"	VARCHAR2(100)		NOT NULL,
	"ADDRESS"	VARCHAR2(100)		NOT NULL,
	"REQUIRE"	VARCHAR2(1000)		NULL,
	"ORDER_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "TB_ORDER"."ORD_NO" IS '주문 번호';

COMMENT ON COLUMN "TB_ORDER"."USER_NO" IS '회원 번호';

COMMENT ON COLUMN "TB_ORDER"."DEL_ADD" IS '배송지';

COMMENT ON COLUMN "TB_ORDER"."PAYMENT" IS '입금 여부';

COMMENT ON COLUMN "TB_ORDER"."DELIVERY" IS '배송 시작 여부';

COMMENT ON COLUMN "TB_ORDER"."STATUS" IS 'STATUS';

COMMENT ON COLUMN "TB_ORDER"."PHONE" IS '휴대전화';

COMMENT ON COLUMN "TB_ORDER"."EMAIL" IS '이메일';

COMMENT ON COLUMN "TB_ORDER"."ADDRESS" IS '주소';

COMMENT ON COLUMN "TB_ORDER"."REQUIRE" IS '배송시요청사항';

COMMENT ON COLUMN "TB_ORDER"."ORDER_DATE" IS '주문일자';

ALTER TABLE "PRODUCT" ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY (
	"PRO_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "RECIPE" ADD CONSTRAINT "PK_RECIPE" PRIMARY KEY (
	"RECIPE_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "TB_CART" ADD CONSTRAINT "PK_TB_CART" PRIMARY KEY (
	"CART_NO"
);

ALTER TABLE "COOKING" ADD CONSTRAINT "PK_COOKING" PRIMARY KEY (
	"COOKING_NO"
);

ALTER TABLE "PRO_ATT" ADD CONSTRAINT "PK_PRO_ATT" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"REPORT_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"REVIEW_NO"
);

ALTER TABLE "POINT" ADD CONSTRAINT "PK_POINT" PRIMARY KEY (
	"POINT_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY (
	"PAYMENT_NO"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"ADMIN_NO"
);

ALTER TABLE "CONSULT" ADD CONSTRAINT "PK_CONSULT" PRIMARY KEY (
	"CONSULT_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"CONTACT_NO"
);

ALTER TABLE "ORD_PRO" ADD CONSTRAINT "PK_ORD_PRO" PRIMARY KEY (
	"ORD_PRO_NO"
);

ALTER TABLE "TB_ORDER" ADD CONSTRAINT "PK_TB_ORDER" PRIMARY KEY (
	"ORD_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_1" FOREIGN KEY ("REPLY_WRITER")
REFERENCES "MEMBER" ("USER_NO") ON DELETE CASCADE;

ALTER TABLE "TB_CART" ADD CONSTRAINT "FK_MEMBER_TO_TB_CART_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_CART" ADD CONSTRAINT "FK_PRODUCT_TO_TB_CART_1" FOREIGN KEY (
	"PRO_NO"
)
REFERENCES "PRODUCT" (
	"PRO_NO"
);

ALTER TABLE "COOKING" ADD CONSTRAINT "FK_RECIPE_TO_COOKING_1" FOREIGN KEY ("RECIPE_NO")
REFERENCES "RECIPE" ("RECIPE_NO") ON DELETE CASCADE;

ALTER TABLE "PRO_ATT" ADD CONSTRAINT "FK_PRODUCT_TO_PRO_ATT_1" FOREIGN KEY (
	"PRO_NO"
)
REFERENCES "PRODUCT" (
	"PRO_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "MEMBER" (
	"USER_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_TB_ORDER_TO_REVIEW_1" FOREIGN KEY (
	"ORD_NO"
)
REFERENCES "TB_ORDER" (
	"ORD_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_REVIEW_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "MEMBER" (
	"USER_NO"
);

ALTER TABLE "POINT" ADD CONSTRAINT "FK_MEMBER_TO_POINT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "MEMBER" (
	"USER_NO"
);

ALTER TABLE "POINT" ADD CONSTRAINT "FK_TB_ORDER_TO_POINT_1" FOREIGN KEY (
	"ORD_NO"
)
REFERENCES "TB_ORDER" (
	"ORD_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_TB_ORDER_TO_PAYMENT_1" FOREIGN KEY (
	"ORD_NO"
)
REFERENCES "TB_ORDER" (
	"ORD_NO"
);

ALTER TABLE "CONSULT" ADD CONSTRAINT "FK_MEMBER_TO_CONSULT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "MEMBER" (
	"USER_NO"
);

ALTER TABLE "CONSULT" ADD CONSTRAINT "FK_ADMIN_TO_CONSULT_1" FOREIGN KEY (
	"RESPONDENTS"
)
REFERENCES "ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "FK_ADMIN_TO_FAQ_1" FOREIGN KEY (
	"FAQ_WRITER"
)
REFERENCES "ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "LIKE" ADD CONSTRAINT "FK_PRODUCT_TO_LIKE_1" FOREIGN KEY (
	"PRO_NO"
)
REFERENCES "PRODUCT" (
	"PRO_NO"
);

ALTER TABLE "LIKE" ADD CONSTRAINT "FK_MEMBER_TO_LIKE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "MEMBER" (
	"USER_NO"
);

ALTER TABLE "ORD_PRO" ADD CONSTRAINT "FK_TB_ORDER_TO_ORD_PRO_1" FOREIGN KEY (
	"ORD_NO"
)
REFERENCES "TB_ORDER" (
	"ORD_NO"
);

ALTER TABLE "ORD_PRO" ADD CONSTRAINT "FK_PRODUCT_TO_ORD_PRO_1" FOREIGN KEY (
	"PRO_NO"
)
REFERENCES "PRODUCT" (
	"PRO_NO"
);

ALTER TABLE "HEART" ADD CONSTRAINT "FK_RECIPE_TO_HEART_1" FOREIGN KEY ("RECIPE_NO")
REFERENCES "RECIPE" ("RECIPE_NO") ON DELETE CASCADE;

ALTER TABLE "HEART" ADD CONSTRAINT "FK_MEMBER_TO_HEART_1" FOREIGN KEY ("USER_NO")
REFERENCES "MEMBER" ("USER_NO") ON DELETE CASCADE;

ALTER TABLE "TB_ORDER" ADD CONSTRAINT "FK_MEMBER_TO_TB_ORDER_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "MEMBER" (
	"USER_NO"
);

