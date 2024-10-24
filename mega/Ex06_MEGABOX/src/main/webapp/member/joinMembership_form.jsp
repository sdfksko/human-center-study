<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
    />
    <link rel="stylesheet" href="../static/css/member.css">
<meta charset="UTF-8">
<title>MEET PLAY SHARE, 메가박스</title>
</head>
<body>
	<div class="container">
        <h1 class="Ci">
            <a href="/Ex06_MEGABOX/main/main.jsp" title="메인 페이지로 이동">MEGABOX : Life Theater</a>
        </h1>
        <div class="box">
            <h1 class="hello"></h1>
            <h2 class="pleaseInput"></h2>
        </div>
       	<form id="form1" name="form1" action="joinMembership.jsp" method="post" onsubmit="return false;">
        	<div class="info">
	            <ol>
	                <li class="head">아이디</li>
	                <li class="content">
						<input name="userId" class="input-text w260px" maxlength="50" id="userId" type="text" placeholder="사용할 아이디">
						<!-- <button class="button" onClick="checkDuffID()" id="btnMbLoginIdDupCnfm">중복확인</button> -->
						
	                    <div class="notice id_check"></div>
	                </li> 
	            </ol>
	            <ol>
	                <li class="head">계정 비밀번호</li>
	                <li class="content">
	                    <input name="userPassword" class="input-text w260px" maxlength="50" id="userPassword" type="text" placeholder="비밀번호"> 
	                    <div class="notice password_check"></div>
	                </li>
	            </ol>
	            <ol>
	                <li class="head">이름</li>
	                <li class="content">
	                    <input name="userName" class="input-text w260px" maxlength="50" id="userName" type="text"> 
	                </li>
	            </ol>
	            <ol>
	                <li class="head">휴대전화 번호</li>
	                <li class="content">
	                    <input name="userPhonenumber" class="input-text w260px" maxlength="50" id="userPhonenumber" type="text" placeholder="숫자로만 작성"> 
	                	<div class="notice phonenumber_check"></div>
	                </li>
	            </ol>
	            <ol>
	                <li class="head">이메일 주소</li>
	                <li class="content">
	                    <input name="userEmail" class="input-text w260px" maxlength="50" id="userEmail" type="text" placeholder="이메일 주소">
	                	<div class="notice email_check"></div>
	                </li>
	            </ol>
	            <ol>
	                <li scope="row" class="head">무인발권기<br>기능 설정</li>
	                <li class="content radio_set">
	                    <input type="radio" id="kioskByymmddLoginSetY" name="kioskByymmddLoginSetAt" checked>
	                    <label for="kioskByymmddLoginSetY">사용</label>
	                    <input type="radio" id="kioskByymmddLoginSetN" name="kioskByymmddLoginSetAt" class="ml10">
	                    <label for="kioskByymmddLoginSetN">사용안함</label>
	
	                    <span class="font-size-14 ml15">※ '생년월일 + 휴대폰번호로' 티켓출력</span>
	                </li>
	            </ol>
	        </div>
	
	        <div class="marketing-agree mt40">
	            <p class="tit">마케팅 활용을 위한 개인정보 수집 이용 안내(선택)<!--마케팅 활용을 위한 개인정보 수집 이용 안내(선택)--></p>
	
	            <div class="cont">
	                <dl>
	                    <dt>수집목적</dt><dd>고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</dd><dt>수집항목</dt><dd>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그 </dd><dt>보유기간</dt><dd>회원 탈퇴 시 혹은 이용 목적 달성 시 까지</dd><!--<dt>수집목적</dt>
	                                                <dd>고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</dd>
	                                                <dt>수집항목</dt>
	                                                <dd>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그 </dd>
	                                                <dt>보유기간</dt>
	                                                <dd>회원 탈퇴 시 혹은 이용 목적 달성 시 까지</dd>-->
	                </dl>
	
	                <div class="radio-agree">
	                    <input type="radio" id="agree" name="marketing_agree">
	                    <label for="agree">동의<!--동의--></label>
	
	                    <input type="radio" id="notagree" name="marketing_agree" class="ml20">
	                    <label for="notagree">미동의<!--미동의--></label>
	                </div>
	
	                <p class="mt30">혜택 수신설정<!--혜택 수신설정--></p>
	
	                <div class="benefit-agree">
	                    <input type="checkbox" id="push">
	                    <label for="push">알림<!--알림--></label>
	
	                    <input type="checkbox" id="sms" class="ml20">
	                    <label for="sms">SMS</label>
	
	                    <input type="checkbox" id="email" class="ml20">
	                    <label for="email">이메일<!--이메일--></label>
	                </div>
	
	                <p class="mt20">
	                    ※  이벤트, 신규 서비스, 할인 혜택 등의 소식을 전해 드립니다.<br>(소멸포인트 및 공지성 안내 또는 거래정보와 관련된 내용은 수신 동의 여부와 상관없이 발송됩니다.)<!--※  이벤트, 신규 서비스, 할인 혜택 등의 소식을 전해 드립니다.<br />
	                                                (소멸포인트 및 공지성 안내 또는 거래정보와 관련된 내용은 수신 동의 여부와 상관없이 발송됩니다.)-->
	                </p>
	
	            </div>
	        </div>
	        <div class="btn-member-bottom">
	            <button id="btnJoinInfoRegButton" onClick="handleFormSubmit();" class="button" >회원가입<!--회원가입--></button>
	        </div>
        </form>
    </div>
    <script>
    
		function checkDuffID() {
			
			<%-- <%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String id = request.getParameter("userId");
				Boolean isDuffID = true;
				
				try {
					
					conn = DBManager.getDBConnection();
					
					String sqlQuery = "SELECT MEMBERID FROM MEMBER WHERE MEMBERID = ?";
					pstmt = conn.prepareStatement(sqlQuery);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();

					if (rs.next()){
						isDuffID = true;
						 
					} else {									
						isDuffID = false;
					}

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					DBManager.dbClose(conn, pstmt, rs);
				}
			%>
			
    	    var isDuffID = (<%= isDuffID ? "true" : "false" %>);
    	    
    	    var useid = document.getElementById('userId').value;
    	    alert(useid); --%>
    	    
    	  /*   if (isDuffID) {
    	        alert("중복 있음");
    	    } else {
    	    	alert("중복 없음");
    	    } */
    	}
    
	    function handleFormSubmit() {
			// userId userPassword userName userPhonenumber userEmail
			var id = document.getElementById('userId').value;
			var password = document.getElementById('userPassword').value;
			var name = document.getElementById('userName').value;
			var phonenumber = document.getElementById('userPhonenumber').value;
			var mail = document.getElementById('userEmail').value;


			if (id.trim() == '' || id == null) {
				alert('사용할 계정 ID를 입력해 주세요.');
				return; 
			} else if (password.trim() === '' || password === null) {
				alert('사용할 계정의 비밀번호를 입력해 주세요.');
				return;
			} else if (name.trim() === '' || name === null) {
				alert('이름 입력해 주세요.');
				return;
			} else if (mail.trim() === '' || mail === null) {
				alert('E-Mail을 입력해 주세요.');
				return;
			} <%-- else if(<%= isDuffID %>) {
				alert('아이디 중복 체크를 해주세요.');
				return;
			} --%>

			document.getElementById('form1').submit();
	    }
	</script>
</body>
</html>