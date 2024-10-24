<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MEET PLAY SHARE, 메가박스</title>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../static/css/mypage.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script defer src="../static/js/mypage.js"></script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<main>
        <div class="container">
            <div class="select-box">
                <div class="first-select">
                    <p>나의 메가박스</p>
                </div>
                <div class="second-select">
                    <p>예매/구매내역</p>
                </div>
                <div class="third-select">
                    <div class="third-top">
                        <p>영화/스토어관람권</p>
                    </div>
                    <div class="third-bottom">
                        <p>&bullet;영화관람권</p>
                        <p>&bullet;스토어 교환권</p>
                    </div>
                </div>
                <div class="fourth-select">
                    <p>메가박스/제휴쿠폰</p>
                </div>
                <div class="fifth-select">
                    <div class="fifth-top">
                        <p>멤버십 포인트</p>
                    </div>
                    <div class="fifth-bottom">
                        <p>&bullet;포인트 이용내역</p>
                        <p>&bullet;멤버십 카드관리</p>
                        <p>&bullet;MiL.k포인트</p>
                    </div>
                </div>
                <div class="sixth-select">
                    <p>나의 무비스토리</p>
                </div>
                <div class="seventh-select">
                    <p>나의 이벤트 응모내역</p>
                </div>
                <div class="eighth-select">
                    <p>나의 문의내역</p>
                </div>
                <div class="nineth-select">
                    <p>중앙페이 결제수단 관리</p>
                </div>
                <div class="tenth-select">
                    <p>자주쓰는 카드 관리</p>
                </div>
                <div class="eleventh-select">
                    <div class="eleventh-top">
                        <p>회원정보수정</p>
                    </div>
                    <div class="eleventh-bottom">
                        <p>&bullet;개인정보 수정</p>
                        <p>&bullet;선택정보 수정</p>
                    </div>
                </div>
            </div>
            <div class="my-info">
                <div class="main-info">
                    <div class="top">
                        <img src="https://img.megabox.co.kr/static/pc/images/2023/01/member_WELCOME_2.png" alt="welcome">
                        <div class="welcome">
                            <h1>안녕하세요!</h1>
                            <h1>OOO님</h1>
                        </div>
                        <div class="show-info">
                            <a href="#" title="개인정보수정 페이지로 이동">개인정보수정</a>
                            <div class="line"></div>
                            <a href="#" title="지난등급 상세보기">지난등급조회</a>
                        </div>
                        <div class="point-info">
                            <p>0</p>
                            <p>P</p>
                        </div>
                        <div class="rank-info">
                            <p>현재등급</p>
                            <p>WELCOME</p>
                        </div>
                        <div class="rank-message">
                            <p>다음 Friends 등급까지 6,000 P 남았어요!</p>
                        </div>
                        <div class="rank-graph">
                            <div class="first-circle">
                                <div class="second-circle">

                                </div>
                            </div>
                            <div class="line">

                            </div>
                            <div class="first-circle">
                                <div class="second-circle">
                                    
                                </div>
                            </div>
                            <div class="line">

                            </div>
                            <div class="first-circle">
                                <div class="second-circle">
                                    
                                </div>
                            </div>
                            <div class="line">
                                
                            </div>
                            <div class="first-circle">
                                <div class="second-circle">
                                    
                                </div>
                            </div>
                            <div class="line">
                                
                            </div>
                            <div class="first-circle">
                                <div class="second-circle">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="rank-list">
                            <p>Welcome</p>
                            <p>Friends</p>
                            <p>VIP</p>
                            <p>VVIP</p>
                            <p>MVIP</p>
                        </div>
                    </div>
                    <div class="bottom">
                        <div class="point-menu">
                            <div class="top">
                                <p>포인트 이용내역</p>
                                <a href="#" class="material-symbols-outlined">
                                    arrow_forward_ios
                                </a>
                            </div>
                            <div class="first-item">
                                <p>적립예정</p>
                                <div class="point">
                                    <p>0</p>
                                    <p>P</p>
                                </div>
                            </div>
                            <div class="second-item">
                                <p>당월소멸예정</p>
                                <div class="point">
                                    <p>0</p>
                                    <p>P</p>
                                </div>
                            </div>
                        </div>
                        <div class="favorite-theater-menu">
                            <div class="top">
                                <p>선호하는 극장</p>
                                <a href="#" class="material-symbols-outlined">
                                    arrow_forward_ios
                                </a>
                            </div>
                            <p>선호극장</p>
                            <p>을 설정하세요.</p>
                        </div>
                        <div class="ticket-coupon-menu">
                            <div class="top">
                                <p>관람권/쿠폰</p>
                                <a href="#" class="material-symbols-outlined">
                                    arrow_forward_ios
                                </a>
                            </div>
                            <div class="first-item">
                                <p>영화관람권</p>
                                <div class="ticket">
                                    <p>0</p>
                                    <p>매</p>
                                </div>
                            </div>
                            <div class="second-item">
                                <p>스토어교환권</p>
                                <div class="ticket">
                                    <p>0</p>
                                    <p>매</p>
                                </div>
                            </div>
                            <div class="third-item">
                                <p>할인/제휴쿠폰</p>
                                <div class="ticket">
                                    <p>1</p>
                                    <p>매</p>
                                </div>
                            </div>
                        </div>
                        <div class="special-membership">
                            <div class="top">
                                <p>스페셜 멤버십</p>
                                <a href="#" class="material-symbols-outlined">
                                    arrow_forward_ios
                                </a>
                            </div>
                            <p>특별한 멤버십 혜택을 만나보세</p>
                            <p>요!</p>
                        </div>
                    </div>
                </div>
                <div class="middle-info">
                    <div class="first">
                        <div class="top">
                            <p>나의 무비 스토리</p>
                            <button>본 영화 등록</button>
                        </div>
                        <div class="bottom">
                            <div class="movie">
                                <p>0</p>
                                <p>본 영화</p>
                            </div>
                            <div class="movie-score">
                                <p>0</p>
                                <p>관람평</p>
                            </div>
                            <div class="want-movie">
                                <p>0</p>
                                <p>보고싶어</p>
                            </div>
                            <div class="movie-post">
                                <p>0</p>
                                <p>무비포스트</p>
                            </div>
                        </div>
                    </div>
                    <div class="second">
                        <div class="top">
                            <p>선호관람정보</p>
                            <button>설정</button>
                        </div>
                        <div class="bottom">
                            <p>&bullet;내 선호장르</p>
                            <p>&bullet;내 선호시간</p>
                        </div>
                    </div>
                </div>
                <div class="ticketing-history">
                    <div class="top">
                        <p>나의 예매내역</p>
                        <a href="#">
                            <p>더보기</p>
                            <div class="material-symbols-outlined">
                                arrow_forward_ios
                            </div>
                        </a>
                    </div>
                    <div class="bottom">
                        <p>예매 내역이 없습니다.</p>
                    </div>
                </div>
                <div class="pay-history">
                    <div class="top">
                        <p>나의 구매내역</p>
                        <a href="#">
                            <p>더보기</p>
                            <div class="material-symbols-outlined">
                                arrow_forward_ios
                            </div>
                        </a>
                    </div>
                    <div class="bottom">
                        <p>구매내역이 없습니다.</p>
                    </div>
                </div>
                <div class="sub-menu">
                    <div class="play-event">
                        <div class="top">
                            <p>참여이벤트</p>
                            <a href="#">
                                <p>더보기</p>
                                <div class="material-symbols-outlined">
                                    arrow_forward_ios
                                </div>
                            </a>
                        </div>
                        <div class="bottom">
                            <p>참여한 이벤트가 없습니다.</p>
                        </div>
                    </div>
                    <div class="call-history">
                        <div class="top">
                            <p>문의내역</p>
                            <a href="#">
                                <p>더보기</p>
                                <div class="material-symbols-outlined">
                                    arrow_forward_ios
                                </div>
                            </a>
                        </div>
                        <div class="bottom">
                            <p>문의내역이 없습니다.</p>
                        </div>
                    </div>
                </div>
            </div>
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
    </main>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>