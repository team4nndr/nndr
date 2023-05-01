-- 기존 계정 삭제
DROP USER nndr cascade;

-- 계정 생성
CREATE USER "nndr" IDENTIFIED BY "nndr123!";

-- 계정에 권한 부여
GRANT resource, CONNECT, CREATE VIEW TO "nndr";

-- 객체가 생성될 수 있는 공간 할당량 지정
ALTER USER "nndr" DEFAULT TABLESPACE "WEB0206"
QUOTA 10M ON "WEB0206";