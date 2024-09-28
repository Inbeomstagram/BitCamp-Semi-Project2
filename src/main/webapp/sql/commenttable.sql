CREATE TABLE CommentTable (
    seq_comment NUMBER PRIMARY KEY,  -- 댓글 ID
    seq_board NUMBER NOT NULL,  -- 연관된 게시물 ID (외래키)
    name VARCHAR2(50) NOT NULL,  -- 댓글 작성자
    commentContent VARCHAR2(1000) NOT NULL,  -- 댓글 내용
    logtime DATE DEFAULT SYSDATE,  -- 댓글 작성 시간
    CONSTRAINT fk_comment_board
        FOREIGN KEY (seq_board)
        REFERENCES board(seq_board)
        ON DELETE CASCADE  -- 게시물 삭제 시 댓글도 삭제
);
-- comment PK 시퀀스
CREATE SEQUENCE seq_comment_id START WITH 1 INCREMENT BY 1;