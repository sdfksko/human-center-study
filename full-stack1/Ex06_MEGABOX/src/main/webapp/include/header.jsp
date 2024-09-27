<%@page import="com.example.demo.service.MovieServiceImpl"%>
<%@page import="com.example.demo.dto.MovieDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link rel="icon" href="https://www.megabox.co.kr/static/pc/images/favicon.ico">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
 <script type="text/javascript" src="${pageContext.request.contextPath }/webjars/axios/1.7.2/dist/axios.min.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/header.css">
 <script defer src="${pageContext.request.contextPath }/static/js/header.js"></script>
<title>영화별 상영시간표</title>
</head>
<body>
<%
	List<MovieDTO> movie = MovieServiceImpl.getInstance().select();
	pageContext.setAttribute("movie", movie);
%>
<header>
    <input type="hidden" id="session_name" value="${sessionScope.name }" />
    <c:if test="${sessionScope.name!=null }">
        <div class="login-container">
            <div class="login-inner">
                <div class="box">
                    <div class="mbimg"><img src="https://img.megabox.co.kr/static/pc/images/2023/01/member_WELCOME_2.png" alt="WELCOME"></div>
                    <div class="name">${sessionScope.name}님</div>
                    <a href="/mypage" class="linkBtn" title="나의  메가박스">나의  메가박스</a>
                </div>
                <div class="box">
                    <div class="tit">
                        <span>스페셜 멤버십</span>
                    </div>
                    <ul class="membership"><li class="txt">특별한 멤버십 혜택을 만나보세요!</li></ul>
                </div>
                <div class="box point">
                    <div class="tit">
                        <a class="linkA" href="/mypage/point-list" title="멤버십 포인트"><span>포인트</span></a>
                    </div>
                    <div class="count"><span class="text">0</span></div>
                </div>
                <div class="box coupon">
                    <div class="tit">
                        <a class="linkA" href="/mypage/discount-coupon" title="쿠폰"><span>쿠폰</span></a>
                        <a class="linkA" href="/mypage/point-list" title="멤버십 포인트"></a>
                    </div>

                    <div title="쿠폰 수" class="count"><span class="text">1</span><span>장</span></div>
                </div>
                <div class="box movieTk">
                    <div class="tit">
                        <a class="linkA" href="/mypage/movie-coupon" title="관람권"><span>관람권</span></a>
                        <a class="linkA" href="/mypage/point-list" title="멤버십 포인트"></a>
                    </div>

                    <div title="관람권 수" class="count"><span class="text">1</span><span>장</span></div>
                </div>
                <div class="box reserve">
                    <div class="tit">
                        <a class="linkA" href="/mypage/bookinglist" title="예매내역"><span>예매</span></a>
                    </div>

                    <div title="예매 수" class="count"><div class="txt">예매내역이 없어요!</div></div>
                </div>
                <div class="box buy">
                    <div class="tit">
                        <a class="linkA" href="/mypage/bookinglist?tab=02" title="구매내역"><span>구매</span></a>
                    </div>

                    <div class="count"><span class="text">1</span><span>건</span></div>
                </div>
            </div>
        </div>
    </c:if>
     <c:if test="${sessionScope.name==null }">
    <div class="logout-container">
        <div class="login-inner">
            <div class="wrap">
                <div class="txt">영화를 사랑하는 당신을 위한 꼭 맞는 혜택까지 확인해 보세요!</div>
                <div class='a-wrap'><a href="javascript:void(0)" id="moveLogin" title="로그인">로그인</a><a href="/join" class="link" title="혹시 아직 회원이 아니신가요?">혹시 아직 회원이 아니신가요?</a></div>
            </div>
        </div>
    </div>
    </c:if>
        <div class="container">
            <div class="left">
                <div class="sup">
                    <ul class="sup-title">
                        <li><a href="#">VIP LOUNGE</a></li>
                        <li><a href="#">멤버십</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                </div>
                <div class="sub">
                    <ul class="sub-title">
                        <li class="menu-img"><img src="${pageContext.request.contextPath }/static/images/menu.svg" alt=""></li>
                        <li class="search-img"><img src="${pageContext.request.contextPath }/static/images/search.svg" alt=""></li>
                        <li>
                            <div class="sup-content">영화</div>
                            <ul class="sup-list-content">
                                <li><a href="allMovie.jsp">전체영화</a></li>
                                <li><a href="#">무비포스트</a></li>
                            </ul>
                        </li>
                        <li>
                            <div class="sup-content">예매</div>
                            <ul class="sup-list-content">
                                <li><a href="../main/ticketing.jsp">빠른예매</a></li>
                                <li><a href="../main/timetable.jsp">상영시간표</a></li>
                                <li><a href="#">더 부티크 프라이빗 예매</a></li>
                            </ul>
                        </li>
                        <li>
                            <div class="sup-content">극장</div>
                            <ul class="sup-list-content">
                                <li><a href="../main/totalTheater.jsp">전체극장</a></li>
                                <li><a href="../main/cinema.jsp">특별관</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="logo"><img src="https://img.megabox.co.kr/static/pc/images/common/ci/logo_new2.png" onclick="location.href='${pageContext.request.contextPath }/main/main.jsp'" alt=""></div>
            <div class="right">
                <div class="sup">
                    <ul class="sup-title">
                        <c:if test="${sessionScope.name==null }"><li id="login"><a href="javascript:void(0)" >로그인</a></li></c:if>
                        <c:if test="${sessionScope.name!=null }"><li id="logout"><a href="javascript:void(0)" >로그아웃</a></li></c:if>
                        <li><a href="#">회원가입</a></li>
                        <li><a href="ticketing.jsp">빠른예매</a></li>
                    </ul>
                    <div class="login-background"></div>
                    <div class="login-box">
                        <div class="title">로그인 <img src="${pageContext.request.contextPath }/static/images/close.svg" id="closeLogin"></div>
                        <div class="login-body">
                            <div class="left">
                                <input type="text" placeholder="아이디" id="id">
                                <input type="password" placeholder="비밀번호" id="pw">
                                <div><label><input type="checkbox" name="" id="chk"><span>아이디 저장</span></label></div>
                                <button onclick="login()">로그인</button>
                                <div class="link">
                                    <div class="id-find">ID/PW 찾기</div>
                                    <div class="sign-up">회원가입</div>
                                    <div class="non-member">비회원 예매확인</div>
                                </div>
                                <div class="other-login">
                                    <div class="naver"><img src="https://www.megabox.co.kr/static/pc/images/member/ico-naver.png" alt=""></div>
                                    <div class="kakao"><img src="https://www.megabox.co.kr/static/pc/images/member/ico-kakao.png" alt=""></div>
                                    <div class="pinterest"><img src="https://www.megabox.co.kr/static/pc/images/member/ico-payco.png" alt=""></div>
                                </div>
                            </div>
                            <div class="right"><img src="https://mlink-cdn.netinsight.co.kr/2024/07/03/47b6a937a2126044c280e3ff9d65c51f.jpg" alt=""></div>
                        </div>
                    </div>
                </div>
                <div class="sub">
                    <ul class="sub-title">
                        <li>
                            <div class="sup-content">이벤트</div>
                            <ul class="sup-list-content">
                                <li><a href="#">진행중 이벤트</a></li>
                                <li><a href="#">지난 이벤트</a></li>
                                <li><a href="#">당첨자 발표</a></li>
                            </ul>
                        </li>
                        <li>
                            <div class="sup-content">스토어</div>
                            <ul class="sup-list-content">
                            </ul>
                        </li>
                        <li>
                            <div class="sup-content">혜택</div>
                            <ul class="sup-list-content">
                                <li><a href="#">메가박스 멤버십</a></li>
                                <li><a href="#">제휴/할인</a></li>
                            </ul>
                        </li>
                        <li><img src="${pageContext.request.contextPath }/static/images/calendar.svg" onclick="location.href='${pageContext.request.contextPath}/main/timetable.jsp'" alt=""></li>
                        <li><img src="${pageContext.request.contextPath }/static/images/user.svg" id="userLogin" alt=""></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 헤더 검색 -->
        <div class="search-container">
            <div class="inner">
                <div class="left">
                    <div class="sup">
                        <div class="item">예매율 순</div>
                        <div class="item">메가박스 관객순</div>
                    </div>
                    <script>
                        const searchSup = document.querySelectorAll('.search-container .item');
                        searchSup.forEach(item=>{
                            item.addEventListener('click',function(){
                                searchSup.forEach(i=>i.style.border='none');
                                this.style.borderBottom = '1px solid white';
                            })
                        })
                    </script>
                    <div class="sub">
                        <div class="top-img"><img src="${movie[0].image }" alt="" onclick="location.href=`allMovieIdx.jsp?movieIdx=${movie[0].movieIdx}`"></div>
                        <div class="top-rank">
                        	<c:forEach  var="vo" items="${movie }" begin="0" end="4" step="1" varStatus="status">
                            	<div class="item"><em>${status.index+1 }</em><a href="allMovieIdx.jsp?movieIdx=${vo.movieIdx }">${vo.name }</a></div>                            	
                        	</c:forEach>
                        </div>
                    </div>
                </div>
                <div class="right">
                    <input type="text" placeholder="영화를 검색하세요">
                    <img src="${pageContext.request.contextPath }/static/images/search_white.svg" alt="">
                </div>
            </div>
        </div>
         <!-- 헤더 메뉴 -->
        <div class="menu-container">
            <div class="menu-header">SITEMAP</div>
            <div class="menu-wrapper">
                <div class="menu-main">
                    <div class="item">
                        <h2>영화</h2>
                        <ul>
                            <li>전체영화</li>
                            <li>무비포스트</li>
                        </ul>
                    </div>
                    <div class="item">
                        <h2>예매</h2>
                        <ul>
                            <li>빠른예매</li>
                            <li>상영시간표</li>
                            <li>더 부티크 프라이빗 예매</li>
                        </ul>
                    </div>
                    <div class="item">
                        <h2>극장</h2>
                        <ul>
                            <li>전체극장</li>
                            <li>특별관</li>
                        </ul>
                    </div>
                    <div class="item">
                        <h2>이벤트</h2>
                        <ul>
                            <li>진행중 이벤트</li>
                            <li>지난 이벤트</li>
                            <li>당첨자발표</li>
                        </ul>
                    </div>
                    <div class="item">
                        <h2>스토어</h2>
                        <ul>
                            <li>새로운 상품</li>
                            <li>메가티켓</li>
                            <li>팝콘/음료/굿즈</li>
                            <li>포인트몰</li>
                        </ul>
                    </div>
                    <div class="item">
                        <h2>나의 메가박스</h2>
                        <ul>
                            <li>나의 메가박스 홈</li>
                            <li>예매/구매내역</li>
                            <li>영화관람권</li>
                            <li>스토어교환권</li>
                            <li>할인/제휴쿠폰</li>
                            <li>멤버십포인트</li>
                            <li>나의 무비스토리</li>
                            <li>나의 이벤트 응모내역</li>
                        </ul>
                    </div>
                    <div class="item">
                        <h2>혜택</h2>
                        <ul>
                            <li>멤버십 안내</li>
                            <li>VIP LOUNGE</li>
                            <li>제휴/할인</li>
                        </ul>
                    </div>
                    <div class="item">
                        <h2>고객센터</h2>
                        <ul>
                            <li>고객센터 홈</li>
                            <li>자주묻는질문</li>
                            <li>공지사항</li>
                            <li>1:1문의</li>
                            <li>단체/대관문의</li>
                            <li>분실물문의</li>
                        </ul>
                    </div>
                    <div class="item">
                        <h2>회사소개</h2>
                        <ul>
                            <li>메가박스소개</li>
                            <li>사회공헌</li>
                            <li>홍보자료</li>
                            <li>제휴/부대사업문의</li>
                            <li>온라인제보센터</li>
                            <li>IR자료</li>
                        </ul>
                    </div>
                    <div class="item">
                        <h2>이용정책</h2>
                        <ul>
                            <li>이용약관</li>
                            <li>위치기반서비스 이용약관</li>
                            <li>개인정보처리방침</li>
                            <li>스크린수배정에관한기준</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>    
    <div class="header-wrapper"></div>
    <!-- 헤더 끝 -->
    
</body>
</html>