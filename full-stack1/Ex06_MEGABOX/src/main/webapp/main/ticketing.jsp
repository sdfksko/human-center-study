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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../static/css/ticketing.css">
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js" integrity="sha512-BABFxitBmYt44N6n1NIJkGOsNaVaCs/GpaJwDktrfkWIBFnMD6p5l9m+Kc/4SLJSJ4mYf+cstX98NYrsG/M9ag==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.css" integrity="sha512-aMup4I6BUl0dG4IBb0/f32270a5XP7H1xplAJ80uVKP6ejYCgZWcBudljdsointfHxn5o302Jbnq1FXsBaMuoQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script defer src="../static/js/ticketing.js"></script>
</head>
<body>
    <%@ include file="../include/header.jsp" %>
   <main>
        <div class="box">
            <h1>빠른예매</h1>
            <div class="ticketing-container">
                <div class="ticketing-select">
                    <div class="swiper-prev">
                        <div class="material-symbols-outlined">
                            arrow_back_ios
                        </div>
                    </div>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <p>1&bull;월</p>
                            </div>
                            <div class="swiper-slide">
                                <p>2&bull;화</p>
                            </div>
                            <div class="swiper-slide">
                                <p>3&bull;수</p>
                            </div>
                            <div class="swiper-slide">
                                <p>4&bull;목</p>
                            </div>
                            <div class="swiper-slide">
                                <p>5&bull;금</p>
                            </div>
                            <div class="swiper-slide">
                                <p>6&bull;토</p>
                            </div>
                            <div class="swiper-slide">
                                <p>7&bull;일</p>
                            </div>
                            <div class="swiper-slide">
                                <p>8&bull;월</p>
                            </div>
                            <div class="swiper-slide">
                                <p>9&bull;화</p>
                            </div>
                            <div class="swiper-slide">
                                <p>10&bull;수</p>
                            </div>
                            <div class="swiper-slide">
                                <p>11&bull;목</p>
                            </div>
                            <div class="swiper-slide">
                                <p>12&bull;금</p>
                            </div>
                            <div class="swiper-slide">
                                <p>13&bull;토</p>
                            </div>
                            <div class="swiper-slide">
                                <p>14&bull;일</p>
                            </div>
                            <div class="swiper-slide">
                                <p>15&bull;월</p>
                            </div>
                            <div class="swiper-slide">
                                <p>16&bull;화</p>
                            </div>
                            <div class="swiper-slide">
                                <p>17&bull;수</p>
                            </div>
                            <div class="swiper-slide">
                                <p>18&bull;목</p>
                            </div>
                            <div class="swiper-slide">
                                <p>19&bull;금</p>
                            </div>
                            <div class="swiper-slide">
                                <p>20&bull;토</p>
                            </div>
                            <div class="swiper-slide">
                                <p>21&bull;일</p>
                            </div>
                            <div class="swiper-slide">
                                <p>22&bull;월</p>
                            </div>
                            <div class="swiper-slide">
                                <p>23&bull;화</p>
                            </div>
                            <div class="swiper-slide">
                                <p>24&bull;수</p>
                            </div>
                            <div class="swiper-slide">
                                <p>25&bull;목</p>
                            </div>
                            <div class="swiper-slide">
                                <p>26&bull;금</p>
                            </div>
                            <div class="swiper-slide">
                                <p>27&bull;토</p>
                            </div>
                        </div>
                        <!-- <div class="swiper-pagination"></div> -->
                    </div>
                    <div class="swiper-next">
                        <div class="material-symbols-outlined">
                            arrow_forward_ios
                        </div>
                    </div>
                    <div class="date-image">
                        <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-calendar-w20.png" alt="">
                    </div>    
                </div>
                <div class="menu">
                    <div class="movie-menu">
                        <h1>영화</h1>
                        <div class="movie-sub-menu">
                            <div class="sub-top-menu">
                                <div onclick="movieFrist()" class="top-first-menu">
                                    <p>전체</p>
                                </div>
                                <div onclick="movieSecond()" class="top-second-menu">
                                    <p>큐레이션</p>
                                </div>
                            </div>
                            <div class="sub-middle-menu">
                                <div class="middle-first-menu">
                                    <div class="first-menu-item">
                                        <p>파일럿</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>데드풀과 울버린</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>리볼버</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>슈퍼배드 4</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>사랑의 하츄핑</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>인사이드 아웃2</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>탈주</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>명탐정 코난: 100만 달러의 펜타그램</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>하이퍼포커스: 투모로우바이투게더 브이알 콘서트</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>행복의 나라</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>빅토리</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>우마무스메 PRETTY DERBY 새로운 시대의 문</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>극장판 프리큐어 올스타즈 F</p>
                                    </div>
                                    <div class="first-menu-item">
                                        <p>핸섬가이즈</p>
                                    </div>
                                </div>
                                <div class="middle-second-menu">
                                    <div class="second-menu-item">
                                        <p>수카바티: 극락축구단</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>데드풀과 울버린</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>리볼버</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>슈퍼배드 4</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>사랑의 하츄핑</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>인사이드 아웃2</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>탈주</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>명탐정 코난: 100만 달러의 펜타그램</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>하이퍼포커스: 투모로우바이투게더 브이알 콘서트</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>행복의 나라</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>빅토리</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>우마무스메 PRETTY DERBY 새로운 시대의 문</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>극장판 프리큐어 올스타즈 F</p>
                                    </div>
                                    <div class="second-menu-item">
                                        <p>핸섬가이즈</p>
                                    </div>
                                </div>
                            </div>
                            <div class="sub-bottom-menu">
                                <div class="bottom-menu">
                                    <p>모든영화</p>
                                    <p>목록에서 영화를 선택하세요.</p>    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="theater-menu">
                        <h1>극장</h1>
                        <div class="theater-sub-menu">
                            <div class="sub-top-menu">
                                <div onclick="theaterFirst()" class="top-first-menu">
                                    <p>전체</p>
                                </div>
                                <div onclick="theaterSecond()" class="top-second-menu">
                                    <p>특별관</p>
                                </div>
                            </div>
                            <div class="sub-middle-menu">
                                <div class="middle-first-menu">
                                    <div onclick="theaterSeoul()" class="first-menu-item">
                                        <p>서울</p>
                                        <p>(20)</p>
                                    </div>
                                    <div onclick="theaterGyeonggi()" class="first-menu-item">
                                        <p>경기</p>
                                        <p>(33)</p>
                                    </div>
                                    <div onclick="theaterIncheon()" class="first-menu-item">
                                        <p>인천</p>
                                        <p>(6)</p>
                                    </div>
                                    <div onclick="theaterDaejeon()" class="first-menu-item">
                                        <p>대전/충청/세종</p>
                                        <p>(17)</p>
                                    </div>
                                    <div onclick="theaterBusan()" class="first-menu-item">
                                        <p>부산/대구/경상</p>
                                        <p>(26)</p>
                                    </div>
                                    <div onclick="theaterGwangju()" class="first-menu-item">
                                        <p>광주/전라</p>
                                        <p>(9)</p>
                                    </div>
                                    <div onclick="theaterGangwon()" class="first-menu-item">
                                        <p>강원</p>
                                        <p>(4)</p>
                                    </div>
                                    <div onclick="theaterJeju()" class="first-menu-item">
                                        <p>제주</p>
                                        <p>(3)</p>
                                    </div>
                                </div>
                                <div class="middle-second-menu">
                                    <div class="seoul-area">
                                        <div class="second-menu-item">
                                            <p>강남</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>강동</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>군자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>더 부티크 목동 현대백화점</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>동대문</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>마곡</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>목동</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>브로드웨이(신사)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>상봉</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>상암월드컵경기장</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>성수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>센트럴</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>송파파크하비오</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>신촌</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>이수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>창동</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>코엑스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>홍대</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>화곡</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>artnine</p>
                                        </div>
                                    </div>
                                    <div class="gyeonggi-area">
                                        <div class="second-menu-item">
                                            <p>고양스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광명ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광명소하</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>금정ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>김포한강신도시</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>남양주</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>남양주현대아울렛 스페이스원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>동탄</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>미사강변</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>백석벨라시타</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>별내</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>부천스타필드시티</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>분당</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원남문</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원인계</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원호매실</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>시흥배곧</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>안산중앙</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>안성스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>양주</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>용인기흥</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>용인테크노밸리</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>의정부민락</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>일산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>킨텍스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>파주금촌</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>파주운정</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>파주출판도시</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>평택비전</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>하남스타필드</p>
                                        </div>
                                    </div>
                                    <div class="incheon-area">
                                        <div class="second-menu-item">
                                            <p>검단</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>송도</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>영종</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>영종하늘도시</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>인천논현</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>청라지젤</p>
                                        </div>
                                    </div>
                                    <div class="daejeon-area">
                                        <div class="second-menu-item">
                                            <p>공주</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>논산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전신세계 아트앤사이언스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전유성</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전중앙로</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전현대아울렛</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>세종(조치원)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>세종나성</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>세종청사</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>오창</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>진천</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>천안</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>청주사창</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>청주성안길</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>충주연수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>홍성내포</p>
                                        </div>
                                    </div>
                                    <div class="busan-area">
                                        <div class="second-menu-item">
                                            <p>경북도청</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>경산하양</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>구미강동</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>김천</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>남포항</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구세븐밸리(칠곡)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구신세계(동대구)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구이시아</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구프리미엄만경관</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>덕천</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>마산(경남대)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>문경</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>부산극장</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>부산대</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>북대구(칠곡)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>사상</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>삼천포</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>양산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>양산증산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>울산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>정관</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>진주(중안)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>창원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>창원내서</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>포항</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>해운대(장산)</p>
                                        </div>
                                    </div>
                                    <div class="gwangju-area">
                                        <div class="second-menu-item">
                                            <p>광주상무</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광주하남</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>목포하당(포르모)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>순천</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>여수웅천</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>전대(광주)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>전주객사</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>전주혁신</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>첨단</p>
                                        </div>
                                    </div>
                                    <div class="gangwon-area">
                                        <div class="second-menu-item">
                                            <p>남춘천</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>속초</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>원주혁신</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>춘천석사</p>
                                        </div>
                                    </div>
                                    <div class="jeju-area">
                                        <div class="second-menu-item">
                                            <p>제주삼화</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>제주서귀포</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>제주아라</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="sub-middleSecond-menu">
                                <div class="middle-first-menu">
                                    <div onclick="theaterDolbyCinema()" class="first-menu-item">
                                        <p>DOLBY CINEMA</p>
                                        <P>(8)</P>
                                    </div>
                                    <div onclick="theaterMega()" class="first-menu-item">
                                        <p>MEGA | MX4D</p>
                                        <P>(2)</P>
                                    </div>
                                    <div onclick="theaterBoutique()" class="first-menu-item">
                                        <p>THE BOUTIQUE</p>
                                        <p>(8)</p>
                                    </div>
                                    <div onclick="theaterDolbyAtmos()" class="first-menu-item">
                                        <p>DOLBY ATMOS</p>
                                        <p>(9)</p>
                                    </div>
                                    <div onclick="theaterComfort()" class="first-menu-item">
                                        <p>COMFORT</p>
                                        <p>(69)</p>
                                    </div>
                                    <div onclick="theaterMegaBoxKids()" class="first-menu-item">
                                        <p>MEGABOX KIDS</p>
                                        <p>(2)</p>
                                    </div>
                                </div>
                                <div class="middle-second-menu">
                                    <div class="dolby-cinema-area">
                                        <div class="second-menu-item">
                                            <p>남양주현대아울렛 스페이스원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구신세계(동대구)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전신세계 아트앤사이언스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>송도</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>안성스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>코엑스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>하남스타필드</p>
                                        </div>
                                    </div>
                                    <div class="mega-mx4d-area">
                                        <div class="second-menu-item">
                                            <p>코엑스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>하남스타필드</p>
                                        </div>
                                    </div>
                                    <div class="the-boutique-area">
                                        <div class="second-menu-item">
                                            <p>대전신세계 아트앤사이언스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>더 부티크 목동현대백화점</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>분당</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>성수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>센트럴</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>코엑스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>킨텍스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>하남스타필드</p>
                                        </div>
                                    </div>
                                    <div class="dolby-atmos-area">
                                        <div class="second-menu-item">
                                            <p>고양스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전현대아울렛</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>목동</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>상암월드컵경기장</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>성수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>원주혁신</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>충주연수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>포항</p>
                                        </div>
                                    </div>
                                    <div class="comfort-area">
                                        <div class="second-menu-item">
                                            <p>검단</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>경산하양</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광명ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광명소하</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광주상무</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>광주하남</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>금정ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>남양주</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>남양주현대아울렛 스페이스원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구세븐밸리(칠곡)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구이시아</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대구프리미엄만 경관</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>대전신세계 아트맨사이언스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>더 부티크 목동현대백화점</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>덕천</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>동대문</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>동탄</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>마산(경남대)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>목동</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>목포하당(포르모)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>백석벨라시타</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>별내</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>부산대</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>북대구(칠곡)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>사상</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>삼천포</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>상봉</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>상암월드컵경기장</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>세종청사</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>송도</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원ak플라자</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원남문</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원스타필드</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원인계</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>수원호매실</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>시흥배곧</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>신촌</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>양산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>양산증산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>양주</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>용인기흥</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>용인테크노밸리</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>울산</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>원주혁신</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>의정부민락</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>인천논현</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>전주객사</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>전주혁신</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>정관</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>제주삼화</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>제주서귀포</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>제주아라</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>진주(중안)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>창원</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>창원내서</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>천안</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>청라지젤</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>청주사창</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>청주성안길</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>춘천석사</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>충주연수</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>코엑스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>킨텍스</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>파주금촌</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>평택비전</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>포항</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>해운대(장산)</p>
                                        </div>
                                    </div>
                                    <div class="megabox-kids-area">
                                        <div class="second-menu-item">
                                            <p>마산(경남대)</p>
                                        </div>
                                        <div class="second-menu-item">
                                            <p>하남스타필드</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="sub-bottom-menu">
                                <div class="bottom-menu">
                                    <p>전체극장</p>
                                    <p>목록에서 극장을 선택하세요.</p>    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="time-menu">
                        <div class="time-menu-top">
                            <h1>시간</h1>
                            <img src="./images/movie-ticketing.png" alt="">
                        </div>                        
                        <div class="time-menu-middle">
                            <div class="swiper-prev">
                                <div class="material-symbols-outlined">
                                    arrow_back_ios
                                </div>
                            </div>
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <p>00</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>01</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>02</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>03</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>04</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>05</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>06</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>07</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>08</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>09</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>10</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>11</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>12</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>13</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>14</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>15</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>16</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>17</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>18</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>19</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>20</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>21</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>22</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>23</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>24</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>25</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>26</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>27</p>
                                    </div>
                                    <div class="swiper-slide">
                                        <p>28</p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-next">
                                <div class="material-symbols-outlined">
                                    arrow_forward_ios
                                </div>
                            </div>
                        </div>
                        <div class="time-menu-bottom">
                            <div class="movie-time">
                                <div class="time-show">
                                    <div class="time">
                                        <p>18:20</p>
                                        <p>~20:37</p>
                                    </div>
                                    <div class="info" onclick="location.href='select.jsp'">
                                        <p>파일럿</p>
                                        <p>2D</p>
                                    </div>
                                    <div class="area">
                                        <p>강동</p>
                                        <p>1관</p>
                                        <p>236/249</p>
                                    </div>
                                </div>
                            </div>
                            <div class="bottom-menu">
                                <div class="bottom-main">
                                    <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-movie-time.png" alt="">
                                    <p>영화와 극장을 선택하시면</p>
                                    <p>상영시간표를 비교하여 볼 수 있습니다.</p>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="advertisement">
                <a href="#">
                    <img src="https://mlink-cdn.netinsight.co.kr/2024/07/03/3d602d6e3e576b49a83ece31dacf5b13.jpg" alt="">    
                </a>
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
                        <p>예매</p>
                    </a>
                </div>
                <div class="select2">
                    <a href="#">
                        <div class="material-symbols-outlined">
                            chevron_right
                        </div>
                        <p>빠른예매</p>
                    </a>
                </div>
            </div>
        </div>
    </main>
    <%@ include file="../include/footer.jsp" %>
</body>
</html>