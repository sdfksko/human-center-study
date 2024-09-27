<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "com.starbucks.utils.DBManager" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 1. 탭 타이틀 세팅 -->
    <title>Starbucks Coffee Korea</title>
    <!-- 2. favicon(favorite icon) 세팅 -->
    <link rel="shortcut icon" href="./favicon.ico" />
    <link rel="icon" href="./favicon.png" />
    <!-- 3. reset.css 세팅(cdn) -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <!-- 4. 커스템 css파일 세팅(local) -->
    <link href="./css/main.css" rel="stylesheet">
    <!-- 5. 폰트 설정 -->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
    <!-- 6. 아이콘 설정 --> 
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- 7. 오픈 그래프 설정(더 많은 속성을 보고 싶으면 https://ogp.me) -->
    <meta property="og:type" content="website" />
    <meta property="og:site_name" content="Starbucks" />
    <meta property="og:title" content="Starbucks Coffee Korea" />
    <meta property="og:description" content="스타벅스는 세계에서 가장 큰 다국적 커피 전문점으로, 64개국에서 총 23,187개의 매점을 운영하고 있습니다." />
    <meta property="og:image" content="./images/starbucks_seo.jpg" />
    <meta property="og:url" content="https://starbucks.co.kr" /> 
    <!-- 8. 자바 스크립트 설정 -->
    <!-- <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script> -->
    <script src="./js/jquery-3.7.1.js"></script>
    <!-- lodash -->
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
    <!-- gsap js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- swiper 6.8.4 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js" integrity="sha512-BABFxitBmYt44N6n1NIJkGOsNaVaCs/GpaJwDktrfkWIBFnMD6p5l9m+Kc/4SLJSJ4mYf+cstX98NYrsG/M9ag==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.css" integrity="sha512-aMup4I6BUl0dG4IBb0/f32270a5XP7H1xplAJ80uVKP6ejYCgZWcBudljdsointfHxn5o302Jbnq1FXsBaMuoQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script defer src="./js/youtube.js"></script>
    <script defer src="./js/main.js"></script>
</head>
<body>
    <%@ include file="./header.jsp" %>

    <!-- visual section -->
    <section class="visual1">
        <div class="inner">
            <div class="title fade-in">
                <img src="./images/visual_title.png" alt="starbucks visual title" />
                <a href="javascript:void(0);" class="btn btn--brown">자세히 보기</a>
            </div>
            <div class="fade-in">
                <img src="./images/visual_cup1.png" alt="starbucks cup1" class="cup1 image" />
                <img src="./images/visual_cup1_text.png" alt="starbucks cup1 text" class="cup1 text" />
            </div>
            <div class="fade-in">
                <img src="./images/visual_cup2.png" alt="starbucks cup2" class="cup2 image" />
                <img src="./images/visual_cup2_text.png" alt="starbucks cup2 text" class="cup2 text" />
            </div>
            <div class="fade-in">
                <img src="./images/visual_spoon.png" alt="starbucks spoon" class="spoon" />
            </div>
        </div>        
    </section>

    <!-- notice section -->
    <section class="notice">
        <div class="notice-line">
            <div class="bg-left"></div>
            <div class="bg-right"></div>
            <div class="inner">
                <div class="inner__left">
                    <h2>공지사항</h2>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
  <%
	System.out.println("Hello JSP");

	// DB접속 객체 가져오기
	Connection conn = DBManager.getDBConnection();
 	
	// DB조회쿼리 실행하여 DB에 있는 데이터 값 가져오기
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		String selectSql = "SELECT * FROM board WHERE ROWNUM <= 3 ORDER BY seq DESC";
		pstmt = conn.prepareStatement(selectSql);
		rs = pstmt.executeQuery();	// sql실행

		while (rs.next()) { 		// 1개의 row씩 가져오기
%>
		<div class="swiper-slide">
            <a href="notice_detail.jsp?seq=<%= rs.getString("SEQ") %>&title=<%= rs.getString("TITLE") %>"><%= rs.getString("TITLE") %></a>
        </div>
<%
			System.out.println("게시글 제목: " +  rs.getString("TITLE"));
		}
	} catch(SQLException se) {
		System.out.println("게시판 조회 쿼리 실행 오류: " + se.getMessage());
	} finally {
		if (rs != null) try { rs.close(); } catch (SQLException ex) {}
	  	if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
	  	if (conn != null) try { conn.close(); } catch (SQLException ex) {}
	}
%>
                            
                        </div>
                    </div>
                    <div class="notice-line__more" onclick="javascript: window.location.href='notice_list.jsp'">
                        <span class="material-symbols-outlined">
                            add_circle
                        </span>
                    </div>
                </div>
                <div class="inner__right">
                    <h2>스타벅스 프로모션</h2>
                    <div class="toggle-promotion">
                        <span class="material-symbols-outlined">
                            upload
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="promotion">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="./images/promotion_slide1.jpg" />
                        <a href="javascript:void(0);" class="btn">자세히 보기</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./images/promotion_slide2.jpg" />
                        <a href="javascript:void(0);" class="btn">자세히 보기</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./images/promotion_slide3.jpg" />
                        <a href="javascript:void(0);" class="btn">자세히 보기</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./images/promotion_slide4.jpg" />
                        <a href="javascript:void(0);" class="btn">자세히 보기</a>
                    </div>
                    <div class="swiper-slide">
                        <img src="./images/promotion_slide5.jpg" />
                        <a href="javascript:void(0);" class="btn">자세히 보기</a>
                    </div>
                </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-prev">
                <span class="material-symbols-outlined">
                    <!-- arrow_circle_left -->
                    arrow_back
                </span>
            </div>
            <div class="swiper-next">
                <span class="material-symbols-outlined">
                    <!-- arrow_circle_right -->
                    arrow_forward
                </span>
            </div>
        </div>
    </section>

    <!-- rewards -->
    <section class="rewards">
        <div class="bg-left"></div>
        <div class="bg-right"></div>
        <div class="inner">
            <div class="btn-group">
                <div class="btn sign-up">회원가입</div>
                <div class="btn sign-in">로그인</div>
                <div class="btn gift">e-Gift 선물하기</div>
            </div>
        </div>
    </section>
    
    <!-- youtube와 함께하는 starbucks -->
    <section class="youtube">
        <div class="youtube__area">
            <div id="player">

            </div>
        </div>
        <div class="youtube__cover"></div>
        <div class="inner">
            <img src="./images/floating1.png" class="floating floating1" />
            <img src="./images/floating2.png" class="floating floating2" />
        </div>
    </section>

    <!-- 시즌 제품 starbucks -->
    <section class="season-product">
        <div class="inner">
            <img src="./images/floating3.png" class="floating floating3" />
            <img src="./images/season_product_image.png" alt="season product image" class="product" />
            <div class="text-group">
                <img src="./images/season_product_text1.png" alt="season product title" class="title" />
                <img src="./images/season_product_text2.png" alt="season product description" class="description" />
                <div class="more">
                    <a href="javascript:void(0);" class="btn">자세히 보기</a>
                </div>
            </div>
        </div>
    </section>

    <!-- reserve starbucks -->
    <section class="reserve-coffee">
        <div class="inner">
            <img src="./images/reserve_logo.png" class="reserve-logo"/>
            <div class="text-group">
                <img src="./images/reserve_text.png" alt="season product description" class="description" />
                <div class="more">
                    <a href="javascript:void(0);" class="btn btn--gold">자세히 보기</a>
                </div>
            </div>
            <img src="./images/reserve_image.png" class="product"/>
        </div>
    </section>

    <!-- pick your favorite -->
    <section class="pick-your-favorite">
        <div class="inner">
            <div class="text-group">
                <img src="./images/favorite_text1.png" alt="" class="title" />
                <img src="./images/favorite_text2.png" alt="" class="description" />
                <div class="more">
                    <a href="javascript:void(0);" class="btn btn--white">자세히 보기</a>
                </div>
            </div>
        </div>
    </section>

    <!-- reserve store -->
    <section class="reserve-store">
        <div class="inner">
            <div class="container">
                <div class="item front">
                    <img src="./images/reserve_store_medal_front.png" alt="reserve store1 front" />
                </div>
                <div class="item back">
                    <img src="./images/reserve_store_medal_back.png" alt="reserve store1 back" />
                    <a href="javascript:void(0)" class="btn">
                        매장안내
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- find store -->
     <section class="find-store">
        <div class="inner">
            <img src="./images/find_store_texture1.png" alt="find store texture1" class="texture1" />
            <img src="./images/find_store_texture2.png" alt="find store texture2" class="texture2" />
            <img src="./images/find_store_picture1.jpg" alt="find store image1" class="picture picture1" />
            <img src="./images/find_store_picture2.jpg" alt="find store image2" class="picture picture2" />
            <div class="text-group">
                <img src="./images/find_store_text1.png" alt="" class="title" />
                <img src="./images/find_store_text2.png" alt="" class="description" />
                <div class="more">
                    <a href="javascript:void(0);" class="btn">매장찾기</a>
                </div>
            </div>
        </div>
    </section>

    <!-- awards slide -->
    <section class="awards">
        <div class="inner">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="javascript:void(0);"><img src="./images/awards_slide1.jpg" alt="대통령 표창1" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:void(0);"><img src="./images/awards_slide2.jpg" alt="대통령 표창2" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:void(0);"><img src="./images/awards_slide3.jpg" alt="대통령 표창3" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:void(0);"><img src="./images/awards_slide4.jpg" alt="대통령 표창4" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:void(0);"><img src="./images/awards_slide5.jpg" alt="대통령 표창5" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:void(0);"><img src="./images/awards_slide6.jpg" alt="대통령 표창6" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:void(0);"><img src="./images/awards_slide7.jpg" alt="대통령 표창7" /></a>
                    </div>
                </div>
            </div>
            <!-- 슬라이드 이동 네비게이션 -->
            <div class="swiper-prev">
                <span class="material-symbols-outlined">
                    <!-- arrow_circle_left -->
                    arrow_back
                </span>
            </div>
            <div class="swiper-next">
                <span class="material-symbols-outlined">
                    <!-- arrow_circle_right -->
                    arrow_forward
                </span>
            </div>            
        </div>
    </section>

    <%@ include file="./footer.jsp" %>
    
    <!-- 위로 가기 버튼 -->
    <div id="to-top">
        <div class="material-symbols-outlined">
            arrow_upward
        </div>
    </div>
</body>
</html>