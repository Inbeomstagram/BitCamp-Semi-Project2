CREATE TABLE board (
    seq_board NUMBER PRIMARY KEY,  -- 게시물 ID
    seq_member NUMBER NOT NULL, -- 멤버 ID
    image varchar2(500) NOT NULL, -- 이미지
    name varchar2(100) NOT NULL, -- 게시물 작성자
    imageSubject VARCHAR2(100) NOT NULL,  -- 제목
    imageContent VARCHAR2(4000),  -- 내용
    hit NUMBER DEFAULT 0, -- 조회수
    logtime DATE DEFAULT SYSDATE,  -- 게시물 작성 시간   
    CONSTRAINT fk_board_member
    FOREIGN KEY(seq_member)
    REFERENCES member(seq_member)
);
-- board PK 시퀀스
CREATE SEQUENCE seq_board_id START WITH 1 INCREMENT BY 1;