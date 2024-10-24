<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MEET PLAY SHARE, 메가박스</title>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="../static/css/footer.css">
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script defer src="../static/js/footer.js"></script>
</head>
<body>
    <footer>
        <div class="footer-container">
            <div class="footer-top">
                <div class="item"><a href="#">회사소개</a></div>
                <div class="item"><a href="#">인재채용</a></div>
                <div class="item"><a href="#">사회공헌</a></div>
                <div class="item"><a href="#">제휴/광고/부대사업문의</a></div>
                <div class="item"><a href="#">이용약관</a></div>
                <div class="item"><a href="#">위치기반서비스 이용약관</a></div>
                <div class="item"><a href="#">개인정보처리방침</a></div>
                <div class="item"><a href="#">윤리경영</a></div>
            </div>
            <div class="movie-search">
                <div class="material-symbols-outlined">
                    search
                </div>
                <div onclick="showMenu()" class="search3">
                    극장찾기
                </div>
            </div>
            <div class="footer-bottom">
                <div class="footer-bottom-img"><img src="https://img.megabox.co.kr/static/pc/images/common/ci/logo-opacity_new2.png" alt=""></div>
                <div class="footer-bottom-text">
                    서울특별시 성동구 왕십리로 50, 6층 (성수동1가, 메가박스 스퀘어) ARS 1544-0070 대표이메일 m.dreamcenter@partner.megabox.co.kr <br>
대표자명 홍정인 · 개인정보보호책임자 강병철 · 사업자등록번호 211-86-59478 · 통신판매업신고번호 2023-서울성동-0177 <br>
COPYRIGHT © MegaboxJoongAng, Inc. All rights reserved
                </div>
                <div class="footer-bottom-sns">
                    <a href="#"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-youtubeN.png" alt=""></a>
                    <a href="#"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-instagramN.png" alt=""></a>
                    <a href="#"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-facebookN.png" alt=""></a>
                    <a href="#"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-twitterN.png" alt=""></a>
                </div>
            </div>
        </div>
        <div class="sub-menu">
                <div class="sub-menu-container">
                    <div class="top-bar">
                        <h1>메가박스 극장 찾기</h1>
                        <div onclick="closeMenu()" class="close">
                            <div class="close-menu">
                                <div class="material-symbols-outlined">
                                    close
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom-bar">
                        <div class="area">
                            <div class="main-area">
                                <p>서울</p>
                            </div>
                            <div class="sub-area">
                                <a href="#">강남</a>
                                <a href="#">강동</a>
                                <a href="#">군자</a>
                                <a href="#">더 부티크 목동현대백화점</a>
                                <a href="#">동대문</a>
                                <a href="#">마곡</a>
                                <a href="#">목동</a>
                                <a href="#">브로드웨이(신사)</a>
                                <a href="#">상봉</a>
                                <a href="#">상암월드컵경기장</a>
                                <a href="#">성수</a>
                                <a href="#">센트럴</a>
                                <a href="#">송파파크하비오</a>
                                <a href="#">신촌</a>
                                <a href="#">이수</a>
                                <a href="#">창동</a>
                                <a href="#">코엑스</a>
                                <a href="#">홍대</a>
                                <a href="#">화곡</a>
                                <a href="#">ARTNINE</a>
                            </div>
                        </div>
                        <div class="area">
                            <div class="main-area">
                                <p>경기</p>
                            </div>
                            <div class="sub-area">
                                <a href="#">고양스타필드</a>
                                <a href="#">광명AK플라자</a>
                                <a href="#">광명소하</a>
                                <a href="#">금정AK플라자</a>
                                <a href="#">김포한강신도시</a>
                                <a href="#">남양주</a>
                                <a href="#">남양주현대아울렛 스페이스원</a>
                                <a href="#">동탄</a>
                                <a href="#">미사강변</a>
                                <a href="#">백석벨라시타</a>
                                <a href="#">별내</a>
                                <a href="#">부천스타필드시티</a>
                                <a href="#">분당</a>
                                <a href="#">수원</a>
                                <a href="#">수원AK플라자</a>
                                <a href="#">수원남문</a>
                                <a href="#">수원스타필드</a>
                                <a href="#">수원인계</a>
                                <a href="#">수원호매실</a>
                                <a href="#">시흥배곧</a>
                                <a href="#">안산중앙</a>
                                <a href="#">안성스타필드</a>
                                <a href="#">양주</a>
                                <a href="#">용인 기흥</a>
                                <a href="#">용인 테크노밸리</a>
                                <a href="#">의정부민락</a>
                                <a href="#">일산</a>
                                <a href="#">킨텍스</a>
                                <a href="#">파주금촌</a>
                                <a href="#">파주운정</a>
                                <a href="#">파주출판도시</a>
                                <a href="#">평택비전</a>
                                <a href="#">하남스타필드</a>
                            </div>
                        </div>
                        <div class="area">
                            <div class="main-area">
                                <p>인천</p>
                            </div>
                            <div class="sub-area">
                                <a href="#">검단</a>
                                <a href="#">송도</a>
                                <a href="#">영종</a>
                                <a href="#">영종하늘도시</a>
                                <a href="#">인천논현</a>
                                <a href="#">청라지젤</a>
                            </div>
                        </div>
                        <div class="area">
                            <div class="main-area">
                                <p>대전/충청/세종</p>
                            </div>
                            <div class="sub-area">
                                <a href="#">공주</a>
                                <a href="#">논산</a>
                                <a href="#">대전</a>
                                <a href="#">대전신세계 아트앤사이언스</a>
                                <a href="#">대전유성</a>
                                <a href="#">대전중앙로</a>
                                <a href="#">대전현대아울렛</a>
                                <a href="#">세종(조치원)</a>
                                <a href="#">세종나성</a>
                                <a href="#">세종청사</a>
                                <a href="#">오창</a>
                                <a href="#">진천</a>
                                <a href="#">천안</a>
                                <a href="#">청주사창</a>
                                <a href="#">청주성안길</a>
                                <a href="#">충주연수</a>
                                <a href="#">홍성내포</a>
                            </div>
                        </div>
                        <div class="area">
                            <div class="main-area">
                                <p>부산/대구/경상</p>
                            </div>
                            <div class="sub-area">
                                <a href="#">경북도청</a>
                                <a href="#">경산하양</a>
                                <a href="#">구미강동</a>
                                <a href="#">김천</a>
                                <a href="#">남포항</a>
                                <a href="#">대구세븐밸리(칠곡)</a>
                                <a href="#">대구신세계(동대구)</a>
                                <a href="#">대구이시아</a>
                                <a href="#">대구프리미엄만경관</a>
                                <a href="#">덕천</a>
                                <a href="#">마산(경남대)</a>
                                <a href="#">문경</a>
                                <a href="#">부산극장</a>
                                <a href="#">부산대</a>
                                <a href="#">북대구(칠곡)</a>
                                <a href="#">사상</a>
                                <a href="#">삼천포</a>
                                <a href="#">양산</a>
                                <a href="#">양산증산</a>
                                <a href="#">울산</a>
                                <a href="#">정관</a>
                                <a href="#">진주(중안)</a>
                                <a href="#">창원</a>
                                <a href="#">창원내서</a>
                                <a href="#">포항</a>
                                <a href="#">해운대(장산)</a>
                            </div>
                        </div>
                        <div class="area">
                            <div class="main-area">
                                <p>광주/전라</p>
                            </div>
                            <div class="sub-area">
                                <a href="#">광주상무</a>
                                <a href="#">광주하남</a>
                                <a href="#">목포하당(포르모)</a>
                                <a href="#">순천</a>
                                <a href="#">여수웅천</a>
                                <a href="#">전대(광주)</a>
                                <a href="#">전주객사</a>
                                <a href="#">전주혁신</a>
                                <a href="#">첨단</a>
                            </div>
                        </div>
                        <div class="area">
                            <div class="main-area">
                                <p>강원</p>
                            </div>
                            <div class="sub-area">
                                <a href="#">남춘천</a>
                                <a href="#">속초</a>
                                <a href="#">원주혁신</a>
                                <a href="#">춘천석사</a>
                            </div>
                        </div>
                        <div class="area">
                            <div class="main-area">
                                <p>제주</p>
                            </div>
                            <div class="sub-area">
                                <a href="#">제주삼화</a>
                                <a href="#">제주서귀포</a>
                                <a href="#">제주아라</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </footer>    
</body>
</html>