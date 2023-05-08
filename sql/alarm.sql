-- "CD_ALARM"(알림종류) 테이블 생성

DROP TABLE "CD_ALARM";

CREATE TABLE "CD_ALARM" (
	"ALARM_CODE"	CHAR(3)		NOT NULL,
	"ALARM_NAME"	VARCHAR(100)		NOT NULL,
	"ALARM_DETAIL"	VARCHAR2(100)		NOT NULL,
	"ALARM_CONTENT"	VARCHAR(2000)		NOT NULL
);

COMMENT ON COLUMN "CD_ALARM"."ALARM_CODE" IS 'A01 ~ A99';

COMMENT ON COLUMN "CD_ALARM"."ALARM_NAME" IS '회원 알림 SET 이름과 동일';

COMMENT ON COLUMN "CD_ALARM"."ALARM_DETAIL" IS '알림설명';

COMMENT ON COLUMN "CD_ALARM"."ALARM_CONTENT" IS '알림내용';

ALTER TABLE "CD_ALARM" ADD CONSTRAINT "PK_CD_ALARM" PRIMARY KEY (
	"ALARM_CODE"
);

-- 알림 종류 데이터 추가

INSERT INTO	"CD_ALARM" VALUES('A01', 'AL_FRIEND_REQ', '친구요청알림', '{FRIEND}님이 친구 신청을 보냈습니다.');
INSERT INTO	"CD_ALARM" VALUES('A02', 'AL_REQ_ACCEPT', '친구신청수락알림', '{FRIEND}님과 친구가 되었습니다!');
INSERT INTO	"CD_ALARM" VALUES('A03', 'AL_TAG', '태그알림', '{FRIEND}님이 게시글에서 {USER}님을 언급했습니다.');
INSERT INTO	"CD_ALARM" VALUES('A04', 'AL_REPLY', '게시글댓글알림', '{FRIEND}님이 {USER}님의 게시글에 댓글을 남겼습니다.');
INSERT INTO	"CD_ALARM" VALUES('A05', 'AL_LIKE', '게시글좋아요알림', '{FRIEND}님이 {USER}님의 게시글에 좋아요를 남겼습니다.');
INSERT INTO	"CD_ALARM" VALUES('A06', 'AL_SHARE', '게시글공유알림', '{FRIEND}님이 {USER}님의 게시글을 공유했습니다.');
INSERT INTO	"CD_ALARM" VALUES('A07', 'AL_FEED', '개인피드갱신알림', '{FRIEND}님이 {USER}님의 피드에 게시글을 남겼습니다.');

SELECT * FROM CD_ALARM ;


-- 알림 테이블 생성
DROP TABLE "ALARM";

CREATE TABLE "ALARM" (
	"ALARM_NO"	NUMBER		NOT NULL,
	"ALARM_CODE"	CHAR(3)		NOT NULL,
	"MEMBER_SEND"	NUMBER		NOT NULL,
	"MEMBER_RECV"	NUMBER		NOT NULL,
	"CONFIRM_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "ALARM"."ALARM_NO" IS '알림번호(SEQ_ALARM_NO)';

COMMENT ON COLUMN "ALARM"."ALARM_CODE" IS 'A01 ~ A99';

COMMENT ON COLUMN "ALARM"."MEMBER_SEND" IS '알림보낸대상';

COMMENT ON COLUMN "ALARM"."MEMBER_RECV" IS '알림받는대상';

COMMENT ON COLUMN "ALARM"."CONFIRM_FL" IS 'N: 확인 전, Y: 확인 후';

ALTER TABLE "ALARM" ADD CONSTRAINT "PK_ALARM" PRIMARY KEY (
	"ALARM_NO"
);

ALTER TABLE "ALARM" ADD CONSTRAINT "FK_CD_ALARM_TO_ALARM_1" FOREIGN KEY (
	"ALARM_CODE"
)
REFERENCES "CD_ALARM" (
	"ALARM_CODE"
);

ALTER TABLE "ALARM" ADD CONSTRAINT "FK_MEMBER_TO_ALARM_1" FOREIGN KEY (
	"MEMBER_SEND"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "ALARM" ADD CONSTRAINT "FK_MEMBER_TO_ALARM_2" FOREIGN KEY (
	"MEMBER_RECV"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

-- CHECK 제약조건 추가
ALTER TABLE "ALARM" ADD CONSTRAINT "CHK_CONFIRM_FL" CHECK(CONFIRM_FL IN ('N', 'Y'));

