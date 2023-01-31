-- 추가 변경 사항

DROP SEQUENCE SEQ_CONSULT;
DROP SEQUENCE  SEQ_PAYMENT;
DROP SEQUENCE  SEQ_REVIEW;

CREATE SEQUENCE SEQ_CONSULTNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 
       
CREATE SEQUENCE SEQ_PAYMENTYNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 
       
CREATE SEQUENCE SEQ_REVIEWNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE; 

COMMENT ON COLUMN POINT.POINT_CATEGORY IS '적립1/사용2';

ALTER TABLE FAQ MODIFY(CONTACT_TITLE VARCHAR2(100BYTE));



-- 댓글 관련

DROP TABLE REPLY;
CREATE TABLE "REPLY" (
   "REPLY_NO"   NUMBER      NOT NULL,
   "BOARD_TYPE"   NUMBER      NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL,
   "REPLY_WRITER"   NUMBER      NOT NULL,
   "REPLY_CONTENT"   VARCHAR2(1000)      NOT NULL,
   "CREATE_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "STATUS"   VARCHAR2(1)   DEFAULT 'Y'   NOT NULL
);
COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글번호';
COMMENT ON COLUMN "REPLY"."BOARD_TYPE" IS '글분류(공지1 / 자유2/ 레시피3)';
COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '참조게시글번호';
COMMENT ON COLUMN "REPLY"."REPLY_WRITER" IS '회원번호';
COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글내용';
COMMENT ON COLUMN "REPLY"."CREATE_DATE" IS '댓글작성일';
COMMENT ON COLUMN "REPLY"."STATUS" IS '상태';
ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY ("REPLY_NO");
ALTER TABLE "REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_1" FOREIGN KEY ("REPLY_WRITER")
REFERENCES "MEMBER" ("USER_NO");
COMMIT;