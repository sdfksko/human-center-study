<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "com.starbucks.utils.DBManager" %>
<%
	String searchKeyword = request.getParameter("search");
	int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
	int recordsPerPage = 10; // 한 페이지에 표시할 레코드 수
	int startRecord = (currentPage - 1) * recordsPerPage + 1;
	int endRecord = currentPage * recordsPerPage;
	//session.setAttribute("key1", "value1");	// 세션에 key1와 value1을 저장
	//session.setAttribute("key2", "value2");	// 세션에 key2와 value2을 저장
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks 공지사항 어드민 페이지</title>
    <link rel="shortcut icon" href="./favicon.ico" />
    <link rel="icon" href="./favicon.png" />
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
    <link re="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script> -->
    <script src="./js/jquery-3.7.1.js"></script>
    <!-- lodash -->
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
    
    <link href="./css/notice_admin.css" rel="stylesheet">
    <script defer src="./js/notice_admin.js"></script>
</head>
<body>
	<!-- 1. 공지사항 어드민 화면은 class="card"로 적용 -->
	<div class="card">
		<div class="card-header">
			<h1>스타벅스 공지사항 어드민</h1>	
		</div>
		
		<div class="card-body">
			<!-- 검색어 텍스트 박스 -->
			<input type="search" name="search-text" id="search-text" placeholder="검색어를 입력하세요" />
			<a href="javascript: searchNotice2();" class="btn">검색</a>
		</div>
		
		<div class="notice-reg-area">
			<a href="<%= request.getContextPath() %>/admin_notice_insert_form.jsp" class="btn">등록</a>
		</div>
		
		<div class="content-box">
			<div class="content-header">
				<div>번호</div>
				<div>제목</div>
				<div>작성자</div>
				<div></div>
			</div>
			<!-- 공지사항 어드민 게시글 제목 리스트 -->
			<%
			//DB접속 객체 가져오기
			Connection conn = DBManager.getDBConnection();
			
			// 3번 과정: 전체 레코드 수 가져오기
			int totalRecords = 0;
			PreparedStatement countPstmt = null;
			ResultSet countRs = null;
			
			try {
				String countSql;
				if (searchKeyword != null && searchKeyword != "") {
					countSql = "SELECT COUNT(*) FROM board WHERE title LIKE ?";
					countPstmt = conn.prepareStatement(countSql);
					countPstmt.setString(1, "%" + searchKeyword + "%");
				} else {
					countSql = "SELECT COUNT(*) FROM board";
					countPstmt = conn.prepareStatement(countSql);
				}
				
				countRs = countPstmt.executeQuery();
				if (countRs.next()) {
					totalRecords = countRs.getInt(1);
				}
			} catch (SQLException se) {
				System.out.println("전체 레코드 수 조회 오류: " + se.getMessage());
			} finally {
				DBManager.dbClose(null, countPstmt, countRs);
			}
			
			int totalPages = (int)Math.ceil((double)totalRecords / recordsPerPage);

			//DB조회쿼리 실행하여 DB에 있는 데이터 값 가져오기
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//String selectSql = "SELECT * FROM board ORDER BY seq DESC";
				String selectSql;
				if (searchKeyword != null & searchKeyword != "") {
					selectSql = "SELECT * FROM (" +
								" SELECT ROW_NUMBER() OVER (ORDER BY seq DESC) AS rnum, seq, title, writer FROM board WHERE title LIKE ?" +
								") WHERE rnum BETWEEN ? AND ?";
					pstmt = conn.prepareStatement(selectSql);
					pstmt.setString(1, "%" + searchKeyword + "%");
					pstmt.setInt(2, startRecord);
					pstmt.setInt(3, endRecord);
				} else {
					selectSql = "SELECT * FROM (" +
								" SELECT ROW_NUMBER() OVER (ORDER BY seq DESC) AS rnum, seq, title, writer FROM board" +
								") WHERE rnum BETWEEN ? AND ?";
					pstmt = conn.prepareStatement(selectSql);
					pstmt.setInt(1, startRecord);
					pstmt.setInt(2, endRecord);
				}
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
			%>
			<div class="content-items">
				<div><%= rs.getInt("SEQ") %></div>
                <div><%= rs.getString("TITLE") %></div>
                <div><%= rs.getString("WRITER") == null ? "" : rs.getString("WRITER") %></div>
                <div>
                	<button style="cursor: pointer;" onClick="javascript: moveUpdate(<%= rs.getInt("SEQ") %>); return false;">수정</button>
					<!-- get 방식으로 삭제 -->
                	<button style="cursor: pointer;" onClick="javascript: deleteNotice(<%= rs.getInt("SEQ") %>);">삭제</button>
               	</div>
			</div>
		<%
			}
		} catch (SQLException se) {
			System.out.println("게시판 조회 쿼리 실행 오류: " + se.getMessage());
		} finally {
			DBManager.dbClose(conn, pstmt, rs);
		}
		%>
		
		</div>
		 <!-- 4번 과정: 페이징 링크 생성 -->
        <div class="pagination">
            <%
                for (int i = 1; i <= totalPages; i++) {
                    if (i == currentPage) {
                        %><span><%= i %></span><%
                    } else {
                        %><a href="<%=request.getContextPath() %>/admin_notice_list.jsp?page=<%= i %>"><%= i %></a><%
                    }
                }
            %>
        </div>
	</div>
</body>
</html>