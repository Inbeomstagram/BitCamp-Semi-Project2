-- 회원 생성 쿼리문
CREATE TABLE Member (
    seq_member NUMBER PRIMARY KEY,        -- 회원 고유 번호 (PK)
    name VARCHAR2(100) NOT NULL,   -- 이름
    id VARCHAR2(50) UNIQUE NOT NULL, -- 아이디 (고유 값)
    password VARCHAR2(100) NOT NULL, -- 비밀번호
    gender VARCHAR2(10),           -- 성별
    email VARCHAR2(200),           -- 이메일 (email1 + email2)
    phonenumber VARCHAR2(20),     -- 전화번호 (tel1 + tel2 + tel3)
    zipcode VARCHAR2(10),          -- 우편번호
    address VARCHAR2(300),         -- 주소 (add1 + add2)
    logtime DATE DEFAULT SYSDATE   -- 회원 가입 시간
);

-- 회원 PK 시퀀스
CREATE SEQUENCE seq_member_id START WITH 1 INCREMENT BY 1;