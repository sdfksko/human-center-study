-- 게시판 테이블
DROP TABLE board;

CREATE TABLE board(
	seq				NUMBER			PRIMARY KEY,		-- 게시판 번호 
	title			VARCHAR2(300)	NOT NULL, 			-- 게시판 제목
	content			CLOB			NOT NULL, 			-- 게시판 내용
	create_date		DATE 			DEFAULT sysdate, 	-- 게시판 등록일자(값이 없으면 현재날짜로 등록이 됨)
	read_count  	NUMBER								-- 게시판 조회수
);

-- comment 등록 sql
COMMENT ON COLUMN board.seq IS '게시판 번호';
COMMENT ON COLUMN board.title IS '게시판 제목';
COMMENT ON COLUMN board.content IS '게시판 내용';
COMMENT ON COLUMN board.create_date IS '게시판 등록일자';
COMMENT ON COLUMN board.read_count IS '게시판 조회수';

-- sequence 생성
CREATE SEQUENCE seq_board_no 
	INCREMENT BY 1 
	START WITH 1
;