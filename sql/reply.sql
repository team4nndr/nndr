-- 댓글 샘플 데이터 삽입
INSERT INTO "REPLY" VALUES (
	SEQ_REPLY_NO.NEXTVAL,
	'댓글 샘플 3',
	SYSDATE,
	DEFAULT,
	1,
	17,
	NULL
);

-- 특정 게시글에 달린 댓글 조회
SELECT REPLY_NO, REPLY_CONTENT, REPLY_DELETE, MEMBER_NO, BOARD_NO,
	CASE  
		WHEN SYSDATE - REPLY_DATE < 1/24/60
		THEN FLOOR( (SYSDATE - REPLY_DATE) * 24 * 60 * 60 ) || '초 전'
		WHEN SYSDATE - REPLY_DATE < 1/24
		THEN FLOOR( (SYSDATE - REPLY_DATE) * 24 * 60) || '분 전'
		WHEN SYSDATE - REPLY_DATE < 1
		THEN FLOOR( (SYSDATE - REPLY_DATE) * 24) || '시간 전'
		ELSE TO_CHAR(REPLY_DATE, 'YYYY-MM-DD')
	END REPLY_DATE
FROM "REPLY"
WHERE REPLY_DELETE = 'N'
ORDER BY REPLY_NO DESC;

-- 부모댓글번호 컬럼 추가
ALTER TABLE "nndr".REPLY ADD PARENT_REPLY_NO NUMBER NULL;
ALTER TABLE "REPLY" ADD CONSTRAINT "FK_REPLY_TO_REPLY_1" FOREIGN KEY (
	"PARENT_REPLY_NO"
)
REFERENCES "REPLY" (
	"REPLY_NO"
);
COMMIT;

-- 대댓글 샘플 데이터 입력
INSERT INTO "REPLY" VALUES (
	SEQ_REPLY_NO.NEXTVAL,
	'대댓글 샘플22222',
	SYSDATE,
	DEFAULT,
	1,
	17,
	42
);

-- 댓글 조회
SELECT LEVEL, C.*
FROM (
	SELECT * FROM "REPLY"
	) C
WHERE REPLY_DELETE = 'N'
START WITH PARENT_REPLY_NO IS NULL
CONNECT BY PRIOR REPLY_NO = PARENT_REPLY_NO
ORDER SIBLINGS BY REPLY_NO

		;
	
	---
	
	
SELECT LEVEL, C.*
FROM (
	SELECT REPLY_NO, REPLY_CONTENT, REPLY_DELETE, MEMBER_NO, BOARD_NO, PARENT_REPLY_NO,
				CASE  
					WHEN SYSDATE - REPLY_DATE < 1/24/60
					THEN FLOOR( (SYSDATE - REPLY_DATE) * 24 * 60 * 60 ) || '초 전'
					WHEN SYSDATE - REPLY_DATE < 1/24
					THEN FLOOR( (SYSDATE - REPLY_DATE) * 24 * 60) || '분 전'
					WHEN SYSDATE - REPLY_DATE < 1
					THEN FLOOR( (SYSDATE - REPLY_DATE) * 24) || '시간 전'
					ELSE TO_CHAR(REPLY_DATE, 'YYYY-MM-DD')
				END REPLY_DATE,
				MEMBER_NAME, SET_FRIEND_REQ, SET_AL_REPLY, SET_AL_LIKE, SET_AL_TAG, SET_AL_REQ_ACCEPT, INFO_IMG
	FROM "REPLY" JOIN "MEMBER" USING(MEMBER_NO) JOIN "MEMBER_INFO" USING(MEMBER_NO)
	) C
WHERE BOARD_NO = 17 AND REPLY_DELETE = 'N'
START WITH PARENT_REPLY_NO IS NULL
CONNECT BY PRIOR REPLY_NO = PARENT_REPLY_NO
ORDER SIBLINGS BY REPLY_NO



-----

-- 댓글 연속삭제

UPDATE "REPLY"
SET		REPLY_DELETE = 'Y'
WHERE   REPLY_NO IN(
	SELECT REPLY_NO FROM REPLY
	START WITH REPLY_NO = 151
	CONNECT BY PRIOR REPLY_NO = PARENT_REPLY_NO
)

;