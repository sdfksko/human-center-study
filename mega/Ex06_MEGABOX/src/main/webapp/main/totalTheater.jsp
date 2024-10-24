<%@page import="com.example.demo.service.NoticeServiceImpl"%>
<%@page import="com.example.demo.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri = "jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/totalTheater.css">
<script defer src="${pageContext.request.contextPath }/static/js/totalTheater.js"></script>
<%
	List<NoticeDTO> vo = NoticeServiceImpl.getInstance().selectTheaterNotice();
	pageContext.setAttribute("vo", vo);
%>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<main>
        <div class="inner">
            <div class="title">전체극장</div>
            <div class="theater-container">
                <ul class="city-container">
                    <li class="selected">
                        <div class="sub-title">서울</div>
                        <ul class="sub-city-container">
                            <li>강남</li>
                            <li>강동</li>
                            <li>군자</li>
                            <li>더부티크 목동현대백화점</li>
                            <li>동대문</li>
                            <li>마곡</li>
                            <li>목동</li>
                            <li>브로드웨이(신사)</li>
                            <li>상봉</li>
                            <li>상암월드컵경기장</li>
                            <li>성수</li>
                            <li>센트럴</li>
                            <li>송파파크하비오</li>
                            <li>신촌</li>
                            <li>이수</li>
                            <li>창동</li>
                            <li>코엑스</li>
                            <li>홍대</li>
                            <li>화곡</li>
                            <li>ARTNINE</li>
                        </ul>
                    </li>
                    <li>
                        <div class="sub-title">경기</div>
                        <ul class="sub-city-container kyungki">
                            <li>고양스타필드</li>
                            <li>광명AK플라자</li>
                            <li>광명소하</li>
                            <li>금정AK플라자</li>
                            <li>김포한강신도시</li>
                            <li>남양주</li>
                            <li>남양주현대아울렛 스페이스원</li>
                            <li>동탄</li>
                            <li>미사강변</li>
                            <li>색석벨라시타</li>
                            <li>별내</li>
                            <li>부천스타필드시티</li>
                            <li>분당</li>
                            <li>수원</li>
                            <li>수원AK플라자</li>
                            <li>수원남문</li>
                            <li>수원스타필드</li>
                            <li>수원인계</li>
                            <li>수원호매실</li>
                            <li>시흥배곧</li>
                            <li>안산중앙</li>
                            <li>안성스타필드</li>
                            <li>양주</li>
                            <li>용인기흥</li>
                            <li>용인테크노벨리</li>
                            <li>의정부민락</li>
                            <li>일산</li>
                            <li>킨텍스</li>
                            <li>파주금촌</li>
                            <li>파주운정</li>
                            <li>평택비전</li>
                            <li>하남스타필드</li>
                        </ul>
                    </li>
                    <li>
                        <div class="sub-title">인천</div>
                        <ul class="sub-city-container incheon">
                            <li>검단</li>
                            <li>송도</li>
                            <li>영종</li>
                            <li>영종하늘도시</li>
                            <li>인천논현</li>
                            <li>청라지젤</li>
                        </ul>
                    </li>
                    <li>
                        <div class="sub-title">대전/충청/세종</div>
                        <ul class="sub-city-container daejeon">
                            <li>공주</li>
                            <li>논산</li>
                            <li>대전</li>
                            <li>대전신세계 아트앤사이언스</li>
                            <li>대전유성</li>
                            <li>대전중앙로</li>
                            <li>대전현대아울렛</li>
                            <li>세종(조치원)</li>
                            <li>세종나성</li>
                            <li>세종청사</li>
                            <li>오창</li>
                            <li>진천</li>
                            <li>천안</li>
                            <li>청주사창</li>
                            <li>청주성안길</li>
                            <li>충주연수</li>
                            <li>홍성내포</li>
                        </ul>
                    </li>
                    <li>
                        <div class="sub-title">부산/대구/경상</div>
                        <ul class="sub-city-container busan">
                            <li>경북도청</li>
                            <li>경산하양</li>
                            <li>구미강동</li>
                            <li>김천</li>
                            <li>남포항</li>
                            <li>대구세븐벨리(칠곡)</li>
                            <li>대구신세계(동대구)</li>
                            <li>대구이시아</li>
                            <li>대구프리미엄만경관</li>
                            <li>덕천</li>
                            <li>마산(경남대)</li>
                            <li>문경</li>
                            <li>부산극장</li>
                            <li>부산대</li>
                            <li>북대구(칠곡)</li>
                            <li>사상</li>
                            <li>삼천포</li>
                            <li>양산</li>
                            <li>양산증산</li>
                            <li>울산</li>
                            <li>정관</li>
                            <li>진주(중안)</li>
                            <li>창원</li>
                            <li>창원내서</li>
                            <li>정관</li>
                            <li>해운대(장산)</li>
                        </ul>
                    </li>
                    <li>
                        <div class="sub-title">광주/전라</div>
                        <ul class="sub-city-container">
                            <li>광주상무</li>
                            <li>광주하남</li>
                            <li>목포하당(포르모)</li>
                            <li>순천</li>
                            <li>여수웅천</li>
                            <li>전대(광주)</li>
                            <li>전주객사</li>
                            <li>전주혁신</li>
                            <li>첨단</li>
                        </ul>
                    </li>
                    <li>
                        <div class="sub-title">강원</div>
                        <ul class="sub-city-container">
                            <li>남춘천</li>
                            <li>속초</li>
                            <li>원주혁신</li>
                            <li>춘천석사</li>
                        </ul>
                    </li>
                    <li>
                        <div class="sub-title">제주</div>
                        <ul class="sub-city-container">
                            <li>제주삼화</li>
                            <li>제주서귀포</li>
                            <li>제주아라</li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="theater-event">
                <div class="event-title">극장 이벤트</div>
                <div class="event-box">
                    <img src="https://img.megabox.co.kr/SharedImg/event/2024/07/24/DzQ35J735Ge18j4cFCuUIAfU0nl6oTXG.jpg" alt="">
                    <img src="https://img.megabox.co.kr/SharedImg/event/2024/08/01/CwlehWnPHbuvo1uuyw1ZxUwDR387Hh0O.jpg" alt="">
                </div>
            </div>
            <div class="theater-notice">
                <div class="notice-title">극장 공지사항</div>
                <a class="notice-more" href="${pageContext.request.contextPath}/notice/notice.jsp">더보기 ></a>
                <div class="notice-list">
                    <div class="item">극장</div>
                    <div class="item">제목</div>
                    <div class="item">지역</div>
                    <div class="item">등록일</div>
                </div>
                <c:forEach var="vo" items="${vo }">
                	<div class="notice-board">
                        <div class="item">${vo.name}</div>
                        <div class="item"><a href="${pageContext.request.contextPath }/notice/noticeDetail.jsp?idx=${vo.idx}">${vo.title}</a></div>
                        <div class="item">경기</div>
                        <div class="item"><fmt:formatDate value="${vo.regDate }" pattern="yyyy.MM.dd"/> </div>
                    </div>
                </c:forEach>
            </div>
        </div>
	</main>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>