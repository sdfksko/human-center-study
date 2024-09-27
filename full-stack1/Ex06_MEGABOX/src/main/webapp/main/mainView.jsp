<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "jakarta.tags.core" %>
    <%@ taglib prefix="fmt" uri = "jakarta.tags.fmt" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="icon" href="https://www.megabox.co.kr/static/pc/images/favicon.ico">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/webjars/axios/1.7.2/dist/axios.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/main.css">
        <script defer src="${pageContext.request.contextPath }/static/js/main.js"></script>
        <script defer src="${pageContext.request.contextPath }/static/js/swiper.js"></script>
        <title>MEET PLAY SHARE, 메가박스</title>
    </head>
    <body>
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
                            <div class="count">0</div>
                        </div>
                        <div class="box coupon">
                            <div class="tit">
                                <a class="linkA" href="/mypage/discount-coupon" title="쿠폰"><span>쿠폰</span></a>
                                <a class="linkA" href="/mypage/point-list" title="멤버십 포인트"></a>
                            </div>
        
                            <div title="쿠폰 수" class="count"><em>1</em><span>장</span></div>
                        </div>
                        <div class="box movieTk">
                            <div class="tit">
                                <a class="linkA" href="/mypage/movie-coupon" title="관람권"><span>관람권</span></a>
                                <a class="linkA" href="/mypage/point-list" title="멤버십 포인트"></a>
                            </div>
        
                            <div title="관람권 수" class="count"><em>0</em><span>장</span></div>
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
        
                            <div class="count"><em>0</em><span>건</span></div>
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
                                    <li><a href="ticketing.jsp">빠른예매</a></li>
                                    <li><a href="timetable.jsp">상영시간표</a></li>
                                    <li><a href="#">더 부티크 프라이빗 예매</a></li>
                                </ul>
                            </li>
                            <li>
                                <div class="sup-content">극장</div>
                                <ul class="sup-list-content">
                                    <li><a href="cinema.jsp">전체극장</a></li>
                                    <li><a href="cinema.jsp">특별관</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="logo"><img src="https://img.megabox.co.kr/static/pc/images/common/ci/logo-white_new2.png" onclick="location.href='${pageContext.request.contextPath }/main/main.jsp'" alt=""></div>
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
                                    <input type="text" placeholder="아이디" id="id" value="${id }">
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
            <div class="menu-container">
                <div class="menu-header">SITEMAP</div>
                <div class="menu-wrapper">
                    <div class="menu-main">
                        <div class="item">
                            <h2>영화</h2>
                            <ul>
                                <li><a href="allMovie.jsp">전체영화</a></li>
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
        <section class="main">
            <div class="conainer">
                <div class="main-top">
                    <div class="main-title">박스오피스</div>
                    <div class="main-more">
                        <div class="more-text"><a href="allMovie.jsp">더 많은 영화보기</a></div>
                        <div class="more-img"><img src="${pageContext.request.contextPath}/static/images/add.svg" alt=""></div>
                    </div>
                </div>
                <div class="main-middle">
                    <div class="main-wrapper">
	                    <c:forEach var="vo" items="${movie }" begin="0" end="3" step="1">
	                    	<div class="main-item">
	                            <div class="main-img">
	                                <img src="${vo.image }" alt="">
	                                <div class="movie_hidden" onclick="location.href='allMovieIdx.jsp?movieIdx=${vo.movieIdx}'">
	                                    <div class="text"></div>
	                                    <div class="sub-text">${vo.content }</div>
	                                    <div class="rate">관람평 <span class="movieRate">
	                                    <c:if test="${vo.movieRate==0 }">0</c:if>
	                                    <c:if test="${vo.movieRate>0}"><fmt:formatNumber value="${vo.movieRate }" pattern=".0" /></c:if>  
	                                    </span></div>
	                                </div>
	                            </div>
	                            <div class="movie_button">
	                                <button type="button" class="btn btn-dark movie_like"><img src="${pageContext.request.contextPath }/static/images/favorite.svg" alt=""><span>${vo.movieLike }</span></button>
	                                <button class="movie_reserve btn2" onclick="location.href='ticketing.jsp'">예매</button>
	                            </div>
                       		</div>
	                    </c:forEach>
	                    
                    </div>
                </div>
                <script>
                    const data2 = document.querySelectorAll(".main-img");
                    data2.forEach(item=>{
                        item.addEventListener('mouseover',function(){
                            this.querySelector(".movie_hidden").style.display='block';
                            this.querySelector("img").style.borderRadius='5px';
                        })
                        item.addEventListener('mouseout',function(){
                            this.querySelector(".movie_hidden").style.display='none';
                        })
                    })
                </script>
                <div class="main-bottom">
                    <div class="bottom-container">
                        <div class="item">
                            <div class="line">
                                <input type="text" placeholder="영화명을 입력해주세요"> 
                                <img src="${pageContext.request.contextPath }/static/images/search_white.svg" alt="">
                            </div>
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath }/static/images/calendar.svg" alt="">
                            상영시간표
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath }/static/images/movie.svg" alt="">
                            박스오피스
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath }/static/images/movie.svg" alt="">
                            빠른예매
                        </div>
                    </div>
                </div>
            </div>
            <section class="ad">
                <div class="ad-container">
                    <div class="title">혜택</div>
                    <div class="benefit">
                        <div class="swiper-wrapper">
                            <!-- Slides -->
                            <div class="swiper-slide"><img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/07/16/hCgG4MJljnRoGAh6yMUNlSzr53U6aH2T.jpg" alt="">
                            <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/07/16/Pq7YxoWtb2OZn7oY5Xkq0OzILVYQxvWB.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/07/09/bhgggw0bRcNMwjR6mJ4x6EZXGFOoKWJT.jpg" alt="">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/07/09/7iV4nTp9kgrsCnaLRLMUV40oaAwF3YEU.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/05/30/tZAwMJ4JIHv7VfplSAdzaq5HvDzjBBm5.png" alt="">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/05/30/tPujcb9XMXGIJiUk4RAuMPFMkkADzfwW.png" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/07/01/YujSSxW1jNo6G9CTYFOJTwC3dV24yXZM.png" alt="">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/07/01/nKBA9issS1hLsqylqPOkX8fRLxvKjQML.png" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/06/28/twzo6BoVQ8c0jAaz6SBOzWXoPWRZLACl.png" alt="">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/06/28/DWEWOfUydY80qyfV4tgeRQFckHNOWt5W.png" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/06/24/OyZGjzfRfmLrDnjI7LR4G0oxp2xZLsS5.jpg" alt="">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/06/24/4LDtfbPO5xuxd0TTUWGrX30rTejL35Qa.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/06/24/jyEnQhsIIKZYM7FMoqnQqnY69PWXhUt3.png" alt="">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/06/24/GKcl0idCFEEEUzEEU2dFf3lnjsThnh4M.png" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/06/05/JMJyDloRX1jCWu6ZJ5jo5egHgjF22edn.jpg" alt="">
                                <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/06/05/PW6SukbtEyJlfLKEXIhBHR6tj19FKu7Z.jpg" alt="">
                            </div>
                            ...
                        </div>
                        
                        <div class="swiper-pagination"></div>
                        <div class="swiper-scrollbar"></div>
                    </div>
                        <!-- If we need pagination -->
                      
                        <!-- If we need navigation buttons -->
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    <div class="love-combo"><img src="https://img.megabox.co.kr/SharedImg/event/2024/04/12/qfioOXyBqkT6vw3KervMYAgsb7zOzeOu.jpg" alt=""></div>
                    <div class="promotion"><img src="https://img.megabox.co.kr/SharedImg/event/2024/07/12/By4ZrJnBHYvihg2VjIdpfvxlNwTtd54W.jpg" alt=""></div>
                    <div class="hyundai"><img src="https://mlink-cdn.netinsight.co.kr/2024/06/03/9f83e7249aa56d32e6533e644991d6fd.jpg" alt=""></div>
                </div>
            </section>
            <section class="ad2">
                <div class="ad2-wrapper">
                    <div class="ad2-item">
                        <img src="${pageContext.request.contextPath }/static/images/diamond.svg" alt="">
                        <div class="item-text">VIP LOUNGE</div>
                    </div>
                    <div class="ad2-item">
                        <img src="${pageContext.request.contextPath }/static/images/user_white.svg" alt="">
                        <div class="item-text">멤버십</div>
                    </div>
                    <div class="ad2-item">
                        <img src="${pageContext.request.contextPath }/static/images/card.svg" alt="">
                        <div class="item-text">할인카드안내</div>
                    </div>
                    <div class="ad2-item">
                        <img src="${pageContext.request.contextPath }/static/images/gift.svg" alt="">
                        <div class="item-text">이벤트</div>
                    </div>
                    <div class="ad2-item">
                        <img src="${pageContext.request.contextPath }/static/images/store.svg" alt="">
                        <div class="item-text">스토어</div>
                    </div>
                </div>
            </section>
            <section class="curation">
                <div class="curation-container">
                    <div class="curation-top">
                        <div class="title">큐레이션</div>
                        <div class="more"><a href="#">큐레이션 더보기</a> <img src="${pageContext.request.contextPath }/static/images/add.svg" alt=""></div>
                    </div>
                    <div class="curation-body">
                        <div class="megabox-film-society">
                            <div class="head"><img src="https://www.megabox.co.kr/static/pc/images/main/bg-bage-curation-film.png" alt=""></div>
                            <div class="main-img"><img src="https://img.megabox.co.kr/SharedImg/2022/06/17/mclVT1DbPWwAJtmr0YkIx0PNmr8ActLU_420.jpg" alt=""></div>
                            <button class="btn-more">상세정보</button>
                            <button class="btn-reserve">예매</button>
                        </div>
                        <div class="more-text">
                            <div class="more-text-top">
                                <div class="text1">#필름소사이어티</div>
                                <div class="text2">큐어</div>
                            </div>
                            <div class="more-text-body">
                                도쿄 지역에서 동일한 방식의 엽기적인 연쇄 살인사건이 발생한다. <p></p>
        놀라운 것은 체포된 범인들이 하나같이 회사원, 교사, 경찰, 의사 등 평범한 사람들이라는 것.
        평소 아무 문제가 없던 사람들이 똑같은 방식으로 살인을 저지른 것에 의문을 품은 다카베 형사(야쿠쇼 고지)는
        이들이 모두 한 남자를 만난 후 범행을 저질렀다는 사실을 알게 된다.
                            </div>
                            <div class="img-container">
                                <div class="sub-container">
                                    <div class="f-logo"><img src="https://www.megabox.co.kr/static/pc/images/main/bg-bage-curation-film-m.png" alt=""></div>
                                    <div class="item-img"><img src="https://img.megabox.co.kr/SharedImg/2024/07/04/goxs29ReDIHd4uJDUTQOlU9beNPDPLBM_230.jpg" alt=""></div>
                                    <div class="sub-text">퍼펙트 데이즈</div>
                                </div>
                                <div class="sub-container">
                                    <div class="f-logo"><img src="https://www.megabox.co.kr/static/pc/images/main/bg-bage-curation-film-m.png" alt=""></div>
                                    <div class="item-img"><img src="https://img.megabox.co.kr/SharedImg/2024/06/10/SphlDg6wm2MYj6rWVuvBM5slvV6ZT7bD_230.jpg" alt=""></div>
                                    <div class="sub-text">존 오브 인터레스트</div>
                                </div>
                                <div class="sub-container">
                                    <div class="f-logo"><img src="https://www.megabox.co.kr/static/pc/images/main/bg-bage-curation-film-m.png" alt=""></div>
                                    <div class="item-img"><img src="https://img.megabox.co.kr/SharedImg/2024/07/15/cLauvIZk1TjuRz9jrXpufeIhaC8cGzwM_230.jpg" alt=""></div>
                                    <div class="sub-text">[로열오페라] 안드레아 세***</div>
                                </div>
                                <div class="sub-container">
                                    <div class="f-logo"><img src="https://www.megabox.co.kr/static/pc/images/main/bg-bage-curation-film-m.png" alt=""></div>
                                    <div class="item-img"><img src="https://img.megabox.co.kr/SharedImg/2024/06/20/HdYPMQq44DdTiuzSW3Uz2KprIWUGaO1o_230.jpg" alt=""></div>
                                    <div class="sub-text">프렌스 수프</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="alarm">
                <div class="alarm-container">
                    <div class="alarm-top">
                        <div class="sup-title">메가박스 안내</div>
                    </div>
                    <div class="alarm-body">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide"><img src="https://img.megabox.co.kr/static/pc/images/main/bg-main-megainfo-dolby.png" alt=""></div>
                            <div class="swiper-slide"><img src="https://img.megabox.co.kr/static/pc/images/main/bg-main-megainfo-mx4d2.png" alt=""></div>
                            <div class="swiper-slide"><img src="https://img.megabox.co.kr/static/pc/images/main/bg-main-megainfo-private.png" alt=""></div>
                            <div class="swiper-slide"><img src="https://img.megabox.co.kr/static/pc/images/main/bg-main-megainfo-boutique3.png" alt=""></div>
                            <div class="swiper-slide"><img src="https://img.megabox.co.kr/static/pc/images/main/bg-main-megainfo-atmos2.png" alt=""></div>
                            <div class="swiper-slide"><img src="https://img.megabox.co.kr/static/pc/images/main/bg-main-megainfo-comfort.png" alt=""></div>
                            <div class="swiper-slide"><img src="https://img.megabox.co.kr/static/pc/images/main/bg-main-megainfo-kids.png" alt=""></div>
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="alarm-footer">
                        <div class="first item">메가박스</div>
                        <div class="second item"><a href="${pageContext.request.contextPath}/notice/noticeDetail.jsp?idx=${vo.idx}">${vo.title}</a></div>
                        <div class="third item"><a href="${pageContext.request.contextPath }/notice/notice.jsp">더보기 </a>></div>
                    </div>
                    <div class="alarm-bottom">
                        <div class="item">
                            <div class="img"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-main-customer.png" alt=""></div>
                            <div class="text">고객센터</div>
                        </div>
                        <div class="item">
                            <div class="img"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-main-faq.png" alt=""></div>
                            <div class="text">자주 묻는 질문</div>
                        </div>
                        <div class="item">
                            <div class="img"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-main-qna.png" alt=""></div>
                            <div class="text">1:1 문의</div>
                        </div>
                        <div class="item">
                            <div class="img"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-main-group.png" alt=""></div>
                            <div class="text">단체/대관 문의</div>
                        </div>
                        <div class="item">
                            <div class="img"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-main-lost.png" alt=""></div>
                            <div class="text">분실물 문의/접수</div>
                        </div>
                        <div class="item">
                            <div class="img"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-main-boutique.png" alt=""></div>
                            <div class="text">더 부티크 프라이빗 대관예매</div>
                        </div>
                    </div>
                </div>
            </section>
            <jsp:include page="../include/footer.jsp"/>
        </section>
    </body>
    </html>