-- 테스트 게시글 등록
INSERT INTO board(seq, title, content, create_date, read_count) 
values(seq_board_no.NEXTVAL, '제목입니다1', '내용입니다1', sysdate, 0);

INSERT INTO board(seq, title, content, read_count) 
values(seq_board_no.NEXTVAL, '제목입니다2', '내용입니다2', 0);

INSERT INTO board(seq, title, content) 
values(seq_board_no.NEXTVAL, '제목입니다3', '내용입니다3');

SELECT * FROM board;
SELECT seq, title, content, create_date, read_count FROM board;