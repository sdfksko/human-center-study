<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<link rel="icon" href="https://www.megabox.co.kr/static/pc/images/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/timetable.css">
<script defer src="${pageContext.request.contextPath }/webjars/axios/1.7.2/dist/axios.min.js"></script>
<script defer src="${pageContext.request.contextPath }/webjars/jquery/3.7.1/dist/jquery.min.js"></script>
<script defer src="${pageContext.request.contextPath }/static/js/timetable.js"></script>
<script defer src="${pageContext.request.contextPath }/static/js/header.js"></script>
<title>영화별 상영시간표</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="main-top">
		<div class="inner-container">
			<div class="inner">
				<div class="left">
                    <div class="item selected">
                        <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-tab-movie.png" alt="">
                        <span>
                            <span class="category-title">영화별</span>
                            <div class="middle">

                                <div class="category-title">
                                    <span class="selected">전체영화</span>
                                    <span>큐레이션</span>
                                </div>
                                <div class="content">
                                    <ul class="movie-list-content">
                                        <c:forEach var="vo" items="${movieVO }" varStatus="index">
                                            <c:if test="${index.index==0 }">
                                                <li class="selected">${vo.name }
                                                    <input type="hidden" id="movieTitle" value="${vo.name}">
	                                    		<div class="right"><img src="${vo.image }"></div>
                                            </li>
                                    		</c:if>
                                    		<c:if test="${index.index!=0 }">
	                                    		<li>
                                                    <c:if test="${fn:length(vo.name)>15}">
                                                        ${fn:substring(vo.name,0,14)} ···
                                                    </c:if>
                                                    <c:if test="${fn:length(vo.name)<=15}">
                                                        ${vo.name }
                                                    </c:if>
                                                    <input type="hidden" id="movieTitle" value="${vo.name}">
	                                    		<div class="right"><img src="${vo.image }"></div></li>
                                    		</c:if>
                                    	</c:forEach>
                                    </ul>
                                </div>
                                
                            </div>
                        </span>
                    </div>
                    <div class="item">
                        <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-tab-theater.png" alt="">
                        <span>
                        	<span class="category-title">극장별</span>
                            <div class="middle">
                                <div class="category-title theater">
                                    <span class="selected">서울(20)
                                        <div class="theater-content">
                                            <ul class="theater-list-content">
                                                <li class="selected">강남</li>
                                                <li>강동</li>
                                                <li>군자</li>
                                                <li>더 부티크 목동현대백화점</li>
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
                                        </div>
                                    </span>
                                    <span>경기(33)
                                        <div class="theater-content">
                                            <ul class="theater-list-content">
                                                <li class="selected">고양스타필드</li>
                                                <li>광명AK플라자</li>
                                                <li>광명소하</li>
                                                <li>금정 광명AK플라자</li>
                                                <li>김포한강신도시</li>
                                                <li>남양주</li>
                                                <li>남양주현대아울렛 스페이스원</li>
                                                <li>동탄</li>
                                                <li>미사강변</li>
                                                <li>백석벨라시타</li>
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
                                                <li>용인테크노밸리</li>
                                                <li>의정부민락</li>
                                                <li>일산</li>
                                                <li>킨텍스</li>
                                                <li>파주금촌</li>
                                                <li>파주운정</li>
                                                <li>파주출판도시</li>
                                                <li>평택비전</li>
                                                <li>하남스타필드</li>
                                            </ul>
                                        </div>

                                    </span>
                                    <span>인천(6)</span>
                                    <span>대전/충청/세종(17)</span>
                                    <span>부산/대구/경상(26)</span>
                                    <span>광주/전라(9)</span>
                                    <span>강원(4)</span>
                                    <span>제주(3)</span>
                                </div>
                            </div>
                        </span>
                    </div>
                    <div class="item">
                        <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-tab-special.png" alt="">
                        <span>
                        	<span class="category-title">특별관</span>
                            <div class="middle">
                                <div class="category-title special">
                                    <span class="selected">DOLBYCINEMA(8)
                                        <div class="content special">
                                            <ul class="special-list-content">
                                                <li class="selected">남양주현대아울렛 스페이스원</li>
                                                <li>대구신세계(동대구)</li>
                                                <li>대전신세계 아트앤사이언스</li>
                                                <li>송도</li>
                                                <li>수원AK플라자안성스타필드</li>
                                                <li>안성스타필드</li>
                                                <li>코엑스</li>
                                                <li>하남스타필드</li>
                                            </ul>
                                        </div>

                                    </span>
                                    <span>MEGA | MX4D(2)</span>
                                    <span>THE BOUTIQUE(8)</span>
                                    <span>DOLBYATOMS(9)</span>
                                    <span>COMFORT(69)</span>
                                    <span>MEGABOXKIDS(2)</span>
                                </div>
                                <div class="right ">
                                    <img class="special-img" src="https://img.megabox.co.kr/static/pc/images/reserve/img-theater-dolby.png" alt="">
                                    <span class="special-img-content">
                                        <p class="special-img-title">DOLBY</p>
                                        <p>국내최초로 메가박스가</p>
                                        <p>선보이는 세계최고</p>
                                        <p>기술력의 몰입 시네마</p>
                                    </span>
                                </div>
                            </div>
                        </span>
                    </div>
                </div>                
			</div>
			<div class="title"><span class="movieTitle">데드풀과 울버린</span> <span>상영시간표</span></div>
			<div class="timetable">
				<c:forEach var="vo" items="${vo }">
					<div class="item">
						<c:choose>
							<c:when test="${vo.dayOfWeek=='토' }">
								<div class="top blue">${vo.month}.${vo.day}</div>
								<div class="bottom blue">${vo.dayOfWeek}</div>
							</c:when>
							<c:when test="${vo.dayOfWeek=='일' }">
								<div class="top red">${vo.month}.${vo.day}</div>
								<div class="bottom red">${vo.dayOfWeek}</div>
							</c:when>
							<c:otherwise>
								<div class="top">${vo.month}.${vo.day}</div>
								<div class="bottom">${vo.dayOfWeek}</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</div>
			<div class="movie-option">
				<div class="item">
					<img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-greeting-option01.png" alt="">
					<div class="text">무대인사</div>
				</div>
				<div class="item">
					<img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-greeting-option02.png" alt="">
					<div class="text">회원시사</div>
				</div>
				<div class="item">
					<img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-greeting-option03.png" alt="">
					<div class="text">오픈시사</div>
				</div>
				<div class="item">
					<img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-greeting-option04.png" alt="">
					<div class="text">굿즈패키지</div>
				</div>
				<div class="item">
					<img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-greeting-option05.png" alt="">
					<div class="text">싱어롱</div>
				</div>
				<div class="item">
					<img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-greeting-option06.png" alt="">
					<div class="text">GV</div>
				</div>
				<div class="item">
					<img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-greeting-option-sun.png" alt="">
					<div class="text">조조</div>
				</div>
				<div class="item">
					<img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-time-brunch.png" alt="">
					<div class="text">브런치</div>
				</div>
				<div class="item">
					<img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-greeting-option-moon.png" alt="">
					<div class="text">심야</div>
				</div>
			</div>

			<div class="city-theater">
				<div class="item selected">서울</div>
				<div class="item">경기</div>
				<div class="item">인천</div>
				<div class="item">대전/충청/세종</div>
				<div class="item">부산/대구/경상</div>
				<div class="item">광주/전라</div>
				<div class="item">강원</div>
				<div class="item">제주</div>
			</div>
			<div class="theater-location">
		        
		    </div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>