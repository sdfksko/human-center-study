package com.student1;

import java.sql.*;

import java.util.*;

import com.student1.utils.DBManager;

public class Board1Service {
	Scanner scanner = new Scanner(System.in); // 키보드입력 받는 객체
	
	/**
	 * 설명: 게시글 작성
	 */
	public int insertBoard() {
		// 1. 게시글 제목 받기
		System.out.print("글제목(취소: quit): ");
		String title = scanner.nextLine();	// 키보드로 '글제목'받기
		if (title.equals("quit")) {
			System.out.println("작성이 취소되었습니다.");
			return -1;
		}
		
		// 2. 게시글 내용 받기
		System.out.print("글내용(취소: quit): ");
		String content = scanner.nextLine();// 키보드로 '글내용'받기
		if (content.equals("quit")) {
			System.out.println("작성이 취소되었습니다.");
			return -1;
		}
		
		// 3. 위의 입력된 게시글의 제목과 내용을 받아서 Oracle DB에 저장할 수 있도록 DB접속준비
		Connection conn = DBManager.getDBConnection();
		
		// 4. Oracle DB에 데이터를 삽입하기 위해 insert sql문을 작성
		String insertSql = """
				INSERT INTO board(seq, title, content, read_count) 
				VALUES(seq_board_no.NEXTVAL, ?, ?, 0)
		""";
		
		int resultRows = 0;		// insert문을 실행한 뒤에 테이블 영향을 받은 행 개수
		PreparedStatement pstmt = null;
		
		try {
			// 5. Oracle DB에 데이터를 삽입 코드를 실행할 준비
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setString(1, title);	 // 위 insertSql에 첫번째?에 키보드로 입력받은 제목을 세팅 
			pstmt.setString(2, content); // 위 insertSql에 두번째?에 키보드로 입력받은 내용을 세팅
			
			// 6. 실제로 sql코드를 실행
			resultRows = pstmt.executeUpdate();	// executeUpdate로 insert, update, delete sql코드를 실행
			
			System.out.println("글 성공적으로 등록됨~");
		} catch(SQLException se) {
			System.out.println("게시글 삽입하는 도중 에러가 발생 -> " + se.getMessage());
		} finally {
			// 7. Oracle DB 접속 관련 객체들 정리
			DBManager.dbclose(conn, pstmt, null);
		}
		
		return resultRows;
	}
	
	/**
	 * 설명: 게시글 목록조회
	 */
	public void selectAllBoard() {
		// 게시판 목록조회 화면구성
		System.out.println("--------------------------------------------------------------------------------------------");
		System.out.println("번호       제목                                   작성일               수정일              조회수");
		System.out.println("---------------------------------------------------------------------------------------------");
		
		// Oracle DB의 Board테이블에서 위의 4가지 항목(번호, 제목, 작성일자, 조회)가 나오도록 출력
		// 1. 게시글의 데이터를 받기 위해 Oracle DB접속준비
		Connection conn = DBManager.getDBConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectSql = "SELECT seq, title, create_date, update_date, read_count FROM board ORDER BY seq DESC";
		int countRows = 0; // 행의 번호
		
		try {
			pstmt = conn.prepareStatement(selectSql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) { // sql실행한 데이터들의 1행을 가져옴(데이터가 있으면 true, 없으면 false)
				countRows++;
//				System.out.println(
//					rs.getString("seq") + "          " + rs.getString("title") + "               " + rs.getString("create_date") + "    " + rs.getString("read_count") 
//				);
//				// printf -> %-3s -> '-'는 오른쪽에서부터 공백 문자열 채워줌.
//				System.out.printf(
//					" %-6s  %-30s  %-20s  %-5s\n"
//					, rs.getString("seq")
//					, rs.getString("title")
//					, rs.getString("create_date")
//					, rs.getString("read_count") == null ? "0" : rs.getString("read_count")
//				);
				System.out.println(
					String.format("%-10s", rs.getString("seq")) +	
					String.format("%-30s", rs.getString("title")) +
					String.format("%-15s", rs.getDate("create_date")) + 	//getString 년/월/시/분/초  getDate 년/월/일
					String.format("%-15s", rs.getDate("update_date") == null ? "" : rs.getDate("update_date")) +
					String.format("%10s", rs.getString("read_count"))
				);			
			}
			if (countRows == 0) {		// board테이블에 데이터가 없을 경우
				System.out.println("게시글이 존재하지 않습니다.");
			}			
		} catch(SQLException se) {
			System.out.println("게시글 목록 조회하는 도중 에러가 발생 -> " + se.getMessage());
		} finally {
			// Oracle DB 접속 관련 객체들 정리
			DBManager.dbclose(conn, pstmt, rs);
		}
	}
	
	/**
	 * 설명: 콘솔에서 사용자의 키보드 입력받은 값을 리턴
	 * @return 게시판 번호
	 */
	
	private int getBoardNo() {
		int boardNo = 0;
		while(true) {
			System.out.println("게시판 번호를 입력하세요.> ");
			
			try {
				boardNo = Integer.parseInt(scanner.nextLine());
				break;
			} catch(InputMismatchException | NumberFormatException e) {
				System.out.println("잘못된 값을 입력하셨습니다. 다시 입력을 해주세요.");
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("알 수 없는 오류 -> " + e.getMessage());
			}	
		}
		
		return boardNo;
	}
	
	/**
	 * 설명: 게시글 상세조회
	 */
	  public void selectOneBoard() {
		// 게시판 상세조회
		  int boardNo = getBoardNo();
			
		// 1. 게시글의 상세 데이터를 받기 위해 Oracle DB접속준비
		Connection conn = DBManager.getDBConnection();
		
		String countSql = "SELECT COUNT(*) FROM board WHere seq =? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int resultRow = 0;
		String sql2 = "SELECT seq, title, content, create_date, read_count From board where seq = ?"; 
		
		
		try {
			pstmt = conn.prepareStatement(countSql);
			pstmt.setInt(1,boardNo);
			rs = pstmt.executeQuery();	// select 실행(count)
			
			if (rs.next()) {
				int rowCount = rs.getInt(1);	// count(*)값 가져오기
				
				if (rowCount == 0) {
					System.out.println("상세 조회할 게시글 번호가 없습니다.");
					return;
				}
			}
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1,boardNo);
			rs = pstmt.executeQuery();	// select 실행(detail)
			
			// 게시판 상세조회 출력 화면
			while(rs.next()) {	// sql실행한 데이터들의 1행을 가져옴(데이터가 있으면 true, 없으면 false)
				System.out.println("------------------------------------------");
				System.out.println("게시글 번호: " +  rs.getString("seq"));
				System.out.println("게시글 제목: " +  rs.getString("title"));
				System.out.println("게시글 내용: " +  rs.getString("content"));
				System.out.println("게시글 작성일: "+  rs.getString("create_date"));
				System.out.println("------------------------------------------");
			}
			
			// 조회수 1증가
			String updateQuery = "UPDATE board SET read_count = NVL(read_count, 0) + 1 WHERE seq = ?";
			pstmt = conn.prepareStatement(updateQuery);
			pstmt.setInt(1,boardNo);
			pstmt.executeUpdate();	// update 실행
			
		} catch(SQLException se){
			System.out.println("게시글 상세조회에 실패하였습니다");
		} finally {
			DBManager.dbclose(conn, pstmt, rs);
		}
		
	}
	/**
	 * 설명: 게시글 수정
	 */
	public void updateBoard() {
		int boardNo = getBoardNo();

		Connection conn = DBManager.getDBConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		ResultSet rs = null;
		
		String countSql = "SELECT COUNT(*) FROM board WHERE seq = ?";
		
		try{
			pstmt = conn.prepareStatement(countSql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery(); // select실행
			if (rs.next()) {
				resultRow = rs.getInt(1); // count(*)값 가져오기
				
				if (resultRow == 0) {
					System.out.println("수정할 게시글 번호가 없습니다.");
					return;
				}
			}									
		} catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		} 
		
		System.out.println("수정할 게시판의 제목을 입력하십시오. ->");
		String title1= scanner.nextLine();
		
		System.out.println("수정할 게시판의 내용을 입력하십시오. ->");
		String content1 = scanner.nextLine();
		
		System.out.println("수정한 날짜를 입력하십시오. ->");
		String date1 = scanner.nextLine();
		
		String sql5 
			= "Update board set title = ?, content = ?, update_date = ? where seq = ?";
		
		try{
			pstmt = conn.prepareStatement(sql5);
			pstmt.setString(1, title1);
			pstmt.setString(2, content1);
			pstmt.setString(3, date1);
			pstmt.setInt(4, boardNo);
			
			resultRow = pstmt.executeUpdate();	// Update 실행
			
			System.out.println("게시글 수정에 성공하였습니다.");
		} catch(SQLException se) {
			System.out.println("게시글 수정에 실패하였습니다");
		} finally {
			DBManager.dbclose(conn, pstmt, null);
		}
		
	}
	/**
	 * 설명: 게시글 삭제
	 */
	public void deleteBoard() {
		Connection conn = DBManager.getDBConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		ResultSet rs = null;
		int boardNo = getBoardNo();
		
		String countSql = "SELECT COUNT(*) FROM board WHERE seq =? ";
		
		String sql3 = "Delete From board where  seq = ?";
		
		try{
			pstmt = conn.prepareStatement(countSql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery(); // select실행
			if (rs.next()) {
				resultRow = rs.getInt(1); // count(*)값 가져오기
				
				if (resultRow == 0) {
					System.out.println("삭제할 게시글 번호가 없습니다.");
					return;
				}
			}									
		} catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
		
		try{
			// 삭제 더블체크
			System.out.println("정말 " + boardNo + "번 게시글을 삭제하시겠습니까? (Y/N)");
			String confirmYN = scanner.nextLine();
			if (!confirmYN.equals("Y"))
				return;
			
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, boardNo);
			
			resultRow = pstmt.executeUpdate();	// delete 실행
			
			System.out.println("게시글 삭제에 성공하였습니다.");
		} catch(SQLException se) {
			System.out.println("게시글 삭제에 실패하였습니다");
		} finally {
			DBManager.dbclose(conn, pstmt, null);
		}
		
		
	}
	
}
