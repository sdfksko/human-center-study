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
    <link rel="stylesheet" href="../static/css/cinema.css">
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script defer src="../static/js/cinema.js"></script>
</head>
<body>
    <%@ include file="../include/header.jsp" %>
    <main style="margin: 45px 0 100px 0">
        <div class="container">
            <div class="container-box">
                <div class="name-tag">
                    <img src="https://www.megabox.co.kr/static/pc/images/theater/sp-text-tit2.png" alt="MEET PLAY SHARE">
                    <h1>메가박스</h1>
                    <h1>특별관을</h1>
                    <h1>소개합니다.</h1>
                </div>
                <div class="imagebox">
                    <a href="#" title="THE BOUTIQUE 페이지로 이동">
                        <img src="https://img.megabox.co.kr/static/pc/images/theater/bg-bou.png" alt="">
                        <div class="imagebox-text">
                            <h1>THE BOUTIQUE</h1>
                            <p>부티크 호텔의 개성을 더한</p>
                            <p>메가박스만의 프리미엄 시네마</p>
                        </div>
                        <div class="imagebox-shadow">
                            <div class="imagebox-shadow-text">
                                <div class="text">
                                    <h1>THE BOUTIQUE</h1>
                                </div>
                            </div>
                        </div>
                        <div class="arrow"></div>
                    </a>
                </div>
                <div class="imagebox">
                    <a href="#" title="THE BOUTIQUE PRIVATE 페이지로 이동">
                        <img src="https://img.megabox.co.kr/static/pc/images/theater/bg-private.png" alt="">
                        <div class="imagebox-text">
                            <h1>THE BOUTIQUE</h1>
                            <h1>PRIVATE</h1>
                            <p>당신의 특별한 순간을 빛나게 해줄</p>
                            <p>프리미엄 어메니티와 룸서비스</p>
                        </div>
                        <div class="imagebox-shadow">
                            <div class="imagebox-shadow-text">
                                <div class="text">
                                    <h1>P R I V A T E</h1>
                                    <p>THE BOUTIQUE</p>
                                </div>
                            </div>
                        </div>
                        <div class="arrow"></div>
                    </a>
                </div>
                <div class="imagebox">
                    <a href="#">
                        <img src="https://img.megabox.co.kr/static/pc/images/theater/bg-db.png" alt="">
                        <div class="imagebox-text">
                            <h1>DOLBY CINEMA</h1>
                            <p>국내 최초로 메가박스가 선보이는</p>
                            <p>세계 최고 기술력의 몰입 시네마</p>
                        </div>
                        <div class="imagebox-shadow">
                            <div class="imagebox-shadow-text">
                                <div class="text">
                                    <img src="https://image.cnet.co.kr/2023/07/25/af348b90a2524c293d730cdab3c4da81-770xAAA.png" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="arrow"></div>
                    </a>
                </div>
                <div class="imagebox">
                    <a href="#" title="COMFORT 페이지로 이동">
                        <img src="https://img.megabox.co.kr/static/pc/images/theater/bg-comfort.png" alt="">
                        <div class="imagebox-text">
                            <h1>COMFORT</h1>
                            <p>더욱 편안한 영화 관람을 위한</p>
                            <p>다양한 여유 공간</p>
                        </div>
                        <div class="imagebox-shadow">
                            <div class="imagebox-shadow-text">
                                <div class="text">
                                    <div class="comfortText">
                                        <h1>COMFORT</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="arrow"></div>
                    </a>
                </div>
                <div class="imagebox">
                    <a href="#" title="MEGA | MX4D 페이지로 이동">
                        <img src="https://img.megabox.co.kr/static/pc/images/theater/bg-mx4d2.png" alt="">
                        <div class="imagebox-text">
                            <h1>MEGA | MX4D</h1>
                            <p>DIVE INTO THE MOVIE</p>
                            <p>다이나믹 오감 체험 특별관</p>
                        </div>
                        <div class="imagebox-shadow">
                            <div class="imagebox-shadow-text">
                                <div class="text">
                                    <div class="meaga4DText">
                                        <div class="meaga4DText1">
                                            <h1>MEGA</h1>
                                        </div>
                                        <div class="meaga4DText2">
                                            <h1>MX4D</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="arrow"></div>
                    </a>
                </div>
                <div class="imagebox">
                    <a href="#" title="DOLBYATMOS 페이지로 이동">
                        <img src="https://img.megabox.co.kr/static/pc/images/theater/bg-dbatmos.png" alt="">
                        <div class="imagebox-text">
                            <h1>DOLBY ATMOS</h1>
                            <p>몰입감 넘치는 사운드 특별관</p>
                        </div>
                        <div class="imagebox-shadow">
                            <div class="imagebox-shadow-text">
                                <div class="text">
                                    <img src="https://i.namu.wiki/i/n1ZOGGEhF9BRqUNlz4tYjAi7CF3SWUkkU7FUxXqJYkcHv0yFSM52RXmC2L0Bssjn41ZTvYET_A7j4i9LuCWLOjchDBtPUuzaJP3fUf4-f8YwPtazlD-pyU6cCVAV38veY2JsobtCSuzkBc1x51xGcw.svg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="arrow"></div>
                    </a>
                </div>
                <div class="imagebox">
                    <a href="#" title="MEGABOX KIDS 페이지로 이동">
                        <img src="https://img.megabox.co.kr/static/pc/images/theater/bg-kids.png" alt="">
                        <div class="imagebox-text">
                            <h1>MEGABOX KIDS</h1>
                            <p>아이와 가족이 함께 머물며</p>
                            <p>삶의 소중한 가치를 배우는</p>
                            <p>더 행복한 놀이공간</p>
                        </div>
                        <div class="imagebox-shadow">
                            <div class="imagebox-shadow-text">
                                <div class="text">
                                    <div class="kids">
                                        <div class="kids-item">
                                            <h1>M</h1>
                                        </div>
                                        <div class="kids-item">
                                            <h1>E</h1>
                                        </div>
                                        <div class="kids-item">
                                            <h1>G</h1>
                                        </div>
                                        <div class="kids-item">
                                            <h1>A</h1>
                                        </div>
                                        <div class="kids-item">
                                            <h1>B</h1>
                                        </div>
                                        <div class="kids-item">
                                            <h1>O</h1>
                                        </div>
                                        <div class="kids-item">
                                            <h1>X</h1>
                                        </div>
                                        <div class="kids-item">
                                            <h1>K</h1>
                                        </div>
                                        <div class="kids-item">
                                            <h1>I</h1>
                                        </div>
                                        <div class="kids-item">
                                            <h1>D</h1>
                                        </div>
                                        <div class="kids-item">
                                            <h1>S</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="arrow"></div>
                    </a>
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
                        <p>극장</p>
                    </a>
                </div>
                <div class="select2">
                    <a href="#">
                        <div class="material-symbols-outlined">
                            chevron_right
                        </div>
                        <p>특별관</p>
                    </a>
                </div>
            </div>
        </div>
    </main>
    <%@ include file="../include/footer.jsp" %>
</body>
</html>