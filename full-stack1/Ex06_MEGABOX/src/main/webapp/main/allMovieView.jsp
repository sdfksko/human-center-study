<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri ="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri ="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MEET PLAY SHARE, 메가박스</title>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/webjars/axios/1.7.2/dist/axios.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/webjars/jquery/3.7.1/dist/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/allMovie.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/footer.css">
    <script defer src="${pageContext.request.contextPath }/static/js/allMovie.js"></script>
    <script defer src="${pageContext.request.contextPath }/static/js/header.js"></script>
    <script defer src="${pageContext.request.contextPath }/static/js/footer.js"></script>
</head>
<body>
    <div class="search-container">
        <div class="inner">
            <div class="left">
                <div class="sup">
                    <div class="item">예매율 순</div>
                    <div class="item">메가박스 관객순</div>
                </div>
                <div class="sub">
                    <div class="top-img"><img src="${vo[0].image }" alt="" onclick="location.href=`allMovieIdx.jsp?movieIdx=${vo[0].movieIdx}`"></div>
                    <div class="top-rank">
                    	<c:forEach  var="vo" items="${vo }" begin="0" end="4" step="1" varStatus="status">
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
    <header>
    <jsp:include page="../include/header.jsp"/>
        <div class="login-background"></div>
            <div class="login-box">
                <div class="title">로그인 <img src="${pageContext.request.contextPath }/static/images/close.svg" id="closeLogin"></div>
                <div class="login-body">
                    <div class="left">
                        <input type="text" placeholder="아이디">
                        <input type="password" placeholder="비밀번호">
                        <div><label><input type="checkbox" name="" id="chk"><span>아이디 저장</span></label></div>
                        <button>로그인</button>
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
        <div class="main-bar">
            <div class="sub-bar">
                <div class="material-symbols-outlined">
                    home
                </div>
                <a href="#">
                    <div class="material-symbols-outlined">
                        chevron_right
                    </div>
                    <p>영화</p>
                </a>
                <a href="#">
                    <div class="material-symbols-outlined">
                        chevron_right
                    </div>
                    <p>전체영화</p>
                </a>
            </div>
        </div>
    </header>
    <div class="header-wrapper"></div>
    <main>
        <div class="inner">
            <div class="tag">
                <h1>전체영화</h1>   
            </div>
            <div class="movie-container">
                <div class="movie-select">
                    <div class="item">
                        <a href="">박스오피스</a>
                    </div>
                    <div class="item">
                        <a href="">상영예정작</a>
                    </div>
                    <div class="item">
                        <a href="">단독</a>
                    </div>
                    <div class="item">
                        <a href="">필름소사이어티</a>
                    </div>
                    <div class="item">
                        <a href="">클래식소사이어티</a>
                    </div>
                </div>
                <div class="search2">
                    <div class="search-texture">
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider"></span>
                        </label>
                        <span>개봉작만</span>
                    </div>
                    <div class="search-box">
                        <input type="text" placeholder="영화명 검색">
                        <a href="javascript:void(0)">
                            <div class="material-symbols-outlined search">
                                search
                            </div>
                        </a>
                    </div>
                </div>
                <div class="movie-box">
	                <c:forEach var="vo" items="${vo }">
	                    <div class="movie">
	                        <a href="${pageContext.request.contextPath }/main/allMovieIdx.jsp?movieIdx=${vo.movieIdx}">
	                            <div class="movie-img">
	                                <img src="${vo.image }" alt="">
	                                <div class="img-shadow">
	                                    <div class="img-text">
	                                        <p>${vo.content }</p>
	                                    </div>
	                                </div>
	                            </div>
	                        </a>
	                        <div class="movie-name">
	                            <p class="movie-age-19">19</p>
	                            <p class="title">
	                            <c:if test="${fn:length(vo.name)>10 }">${fn:substring(vo.name,0,10) } ···</c:if>
	                            <c:if test="${fn:length(vo.name)<10 }">${vo.name }</c:if>
	                            </p>
	                        </div>
	                        <div class="movie-information">
	                            <p class="rate">예매율 22%</p>
	                            <div class="and"></div>
	                            <p class="date">개봉일 <fmt:formatDate value="${vo.openingDate }" pattern="yyyy-MM-dd"/></p>
	                        </div>
	                        <div class="movie-util">
	                            <button> <img alt="" src="${pageContext.request.contextPath }/static/images/like.svg"><span class="movieLike">${vo.movieLike }</span> </button>
	                            <a href="">
	                                <div class="movie-ticketing">예매</div>
	                            </a>
	                        </div>
	                    </div>
	                </c:forEach>
                </div>
            </div>
            <div class="show">
                <p>더보기</p>
                <span class="material-symbols-outlined">
                    keyboard_arrow_down
                </span>
            </div>
            <div onclick="sTo()" class="top">
                <div class="top-show">
                    <div class="material-symbols-outlined">
                        arrow_drop_up
                    </div>
                    <div class="top-text">
                        TOP
                    </div>
                </div>
            </div>
        </div>
        <div class="home-menu">
            <div class="select-menu">
                <div class="material-symbols-outlined">
                    home
                </div>
                <div class="select1">
                    <a href="#">
                        <div class="material-symbols-outlined">
                            chevron_right
                        </div>
                        <p>영화</p>
                    </a>
                </div>
                <div class="select2">
                    <a href="#">
                        <div class="material-symbols-outlined">
                            chevron_right
                        </div>
                        <p>전체영화</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="menu-top">
            <div class="select-menu">
                <a href="#">박스오피스</a>
                <a href="#">상영예정작</a>
                <a href="#">단독</a>
                <a href="#">필름소사이어티</a>
                <a href="#">클래식소사이어티</a>
            </div>
        </div>
    </main>
    <jsp:include page="../include/footer.jsp"/>
</body>
</html>