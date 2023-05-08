DROP TABLE "FEEDBACK";

CREATE TABLE "FEEDBACK" (
	"FEEDBACK_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"FEEDBACK_CONTENT"	CLOB		NULL,
	"FEEDBACK_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"ADMIN_NO"	NUMBER		NOT NULL,
	"ADMIN_COMMENT"	VARCHAR2(4000)		NULL,
	"CONFIRM_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"CONFIRM_DATE"	DATE		NULL
);

COMMENT ON COLUMN "FEEDBACK"."FEEDBACK_NO" IS '의견번호(SEQ_OPINION_NO)';

COMMENT ON COLUMN "FEEDBACK"."MEMBER_NO" IS '회원번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "FEEDBACK"."FEEDBACK_CONTENT" IS '의견내용';

COMMENT ON COLUMN "FEEDBACK"."FEEDBACK_DATE" IS '작성일';

COMMENT ON COLUMN "FEEDBACK"."ADMIN_NO" IS '처리한관리자(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "FEEDBACK"."ADMIN_COMMENT" IS '관리자의견';

COMMENT ON COLUMN "FEEDBACK"."CONFIRM_FL" IS 'N: 처리중, Y:처리완료';

COMMENT ON COLUMN "FEEDBACK"."CONFIRM_DATE" IS '처리일시';

ALTER TABLE "FEEDBACK" ADD CONSTRAINT "PK_FEEDBACK" PRIMARY KEY (
	"FEEDBACK_NO"
);

ALTER TABLE "FEEDBACK" ADD CONSTRAINT "FK_MEMBER_TO_FEEDBACK_USER" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "FEEDBACK" ADD CONSTRAINT "FK_MEMBER_TO_FEEDBACK_ADMIN" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

