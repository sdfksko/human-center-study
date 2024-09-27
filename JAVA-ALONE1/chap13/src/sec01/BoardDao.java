package sec01;

import java.util.*;

public class BoardDao {
	public List<Board> getBoardList() {
		List<Board> boardList = new ArrayList<>();
		Board board1 = new Board("제목1", "내용1");
		boardList.add(board1);
		Board board2 = new Board("제목2", "내용2");
		boardList.add(board2);
		Board board3 = new Board("제목3", "내용3");
		boardList.add(board3);
		//실행결과
		//제목1-내용1
		//제목2-내용2
		//제목3-내용3
		return boardList;
	}
}
