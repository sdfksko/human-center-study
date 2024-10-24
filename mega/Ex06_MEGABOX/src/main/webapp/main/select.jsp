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
    <link rel="stylesheet" href="../static/css/select.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/webjars/axios/1.7.2/dist/axios.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/webjars/jquery/3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script defer src="../static/js/select.js"></script>
</head>
<body>
    <%@ include file="../include/header.jsp" %>
    <main>
        <div class="container">
            <h1>빠른예매</h1>
            <div class="select-people">
                <div class="top-menu">
                    <p>관람인원선택</p>
                    <button onclick="reset()">
                        <div class="material-symbols-outlined">
                            cached
                        </div>
                        <p>초기화</p>
                    </button>
                </div>
                <div class="bottom-menu">
                    <div onclick="closeScreen()" class="screen">
                        <div class="material-symbols-outlined">
                            keyboard_double_arrow_up
                        </div>
                        <p>관람인원을 선택하십시요</p>
                    </div>
                    <div class="top">
                        <div class="item">
                            <p>성인</p>
                            <div class="math">
                                <div class="subtract">
                                    <P>-</P>
                                </div>
                                <div class="number">
                                    <p>0</p>
                                </div>
                                <div class="add">
                                    <p>+</p>
                                </div>
                            </div>
                        </div>
                        <div class="item2">
                            <p>청소년</p>
                            <div class="math">
                                <div class="subtract">
                                    <P>-</P>
                                </div>
                                <div class="number">
                                    <p>0</p>
                                </div>
                                <div class="add">
                                    <p>+</p>
                                </div>
                            </div>
                        </div>
                        <div class="item3">
                            <p>경로</p>
                            <div class="math">
                                <div class="subtract">
                                    <P>-</P>
                                </div>
                                <div class="number">
                                    <p>0</p>
                                </div>
                                <div class="add">
                                    <p>+</p>
                                </div>
                            </div>
                        </div>
                        <div class="item4">
                            <p>우대</p>
                            <div class="math">
                                <div class="subtract">
                                    <P>-</P>
                                </div>
                                <div class="number">
                                    <p>0</p>
                                </div>
                                <div class="add">
                                    <p>+</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom">
                        <div class="line">
                            <img src="https://www.megabox.co.kr/static/pc/images/reserve/img-theater-screen.png" alt="screen">    
                        </div>
                        <div class="left">
                            <img src="https://www.megabox.co.kr/static/pc/images/reserve/img-door-left.png" alt="left">
                        </div>
                        <div class="seat-main-area">
                            <div class="area-number">
                                <p>A</p>
                            </div>
                            <div class="area-number">
                                <p>B</p>
                            </div>
                            <div class="area-number">
                                <p>C</p>
                            </div>
                            <div class="area-number">
                                <p>D</p>
                            </div>
                            <div class="area-number">
                                <p>E</p>
                            </div>
                            <div class="area-number">
                                <p>F</p>
                            </div>
                            <div class="area-number">
                                <p>G</p>
                            </div>
                        </div>
                        <div class="seat-sub-area">
                            <div class="area-number number1">
                                <p>1</p>
                            </div>
                            <div class="area-number number2">
                                <p>2</p>
                            </div>
                            <div class="area-number number3">
                                <p>3</p>
                            </div>
                            <div class="area-number number4">
                                <p>4</p>
                            </div>
                            <div class="area-number number5">
                                <p>5</p>
                            </div>
                            <div class="area-number number6">
                                <p>6</p>
                            </div>
                            <div class="area-number number7">
                                <p>7</p>
                            </div>
                            <div class="area-number number8">
                                <p>8</p>
                            </div>
                            <div class="area-number number9">
                                <p>9</p>
                            </div>
                            <div class="area-number number10">
                                <p>10</p>
                            </div>
                            <div class="area-number number11">
                                <p>11</p>
                            </div>
                            <div class="area-number number12">
                                <p>12</p>
                            </div>
                            <div class="area-number number13">
                                <p>13</p>
                            </div>
                            <div class="area-number number14">
                                <p>14</p>
                            </div>
                            <div class="area-number number15">
                                <p>15</p>
                            </div>
                            <div class="area-number number16">
                                <p>16</p>
                            </div>
                            <div class="area-number number17">
                                <p>17</p>
                            </div>
                            <div class="area-number number18">
                                <p>18</p>
                            </div>
                            <div class="area-number number19">
                                <p>19</p>
                            </div>
                            <div class="area-number number20">
                                <p>20</p>
                            </div>
                            <div class="area-number number21">
                                <p>21</p>
                            </div>
                            <div class="area-number number22">
                                <p>22</p>
                            </div>
                            <div class="area-number number23">
                                <p>23</p>
                            </div>
                            <div class="area-number number24">
                                <p>24</p>
                            </div>
                            <div class="area-number number25">
                                <p>25</p>
                            </div>
                            <div class="area-number number26">
                                <p>26</p>
                            </div>
                            <div class="area-number number27">
                                <p>27</p>
                            </div>
                            <div class="area-number number28">
                                <p>28</p>
                            </div>
                            <div class="area-number number29">
                                <p>29</p>
                            </div>
                            <div class="area-number number30">
                                <p>30</p>
                            </div>
                            <div class="area-number number31">
                                <p>31</p>
                            </div>
                            <div class="area-number number32">
                                <p>32</p>
                            </div>
                            <div class="area-number number33">
                                <p>33</p>
                            </div>
                            <div class="area-number number34">
                                <p>34</p>
                            </div>
                            <div class="area-number number35">
                                <p>35</p>
                            </div>
                        </div>
                        <div class="up">
                            <img src="https://www.megabox.co.kr/static/pc/images/reserve/img-door-top.png" alt="up">
                        </div>
                    </div>
                </div>
            </div>
            <div class="info">
                <div class="title">
                    <p>박정희:경제대국을 꿈꾼 남자</p>
                    <p>2D</p>
                </div>
                <div class="area">
                    <div class="main-area">
                        <p>강동</p>
                        <p>9관</p>
                        <p>2024.08.01(목)</p>
                    </div>
                    <select name="" id="">
                        <option value="">11:40~14:14</option>
                        <option value="">14:50~16:30</option>
                        <option value="">17:00~18:30</option>
                    </select>
                    <div class="movie-image">
                        <img src="https://www.megabox.co.kr/SharedImg/2024/06/10/DnGUkUegvQKoodvnWYS1dXBSbH5bHZWu_150.jpg" alt="영화">
                    </div>
                </div>
                <div class="select-menu">
                    <div class="select-info">
                        <div class="select-option">
                            <div class="select">
                                <div class="shape">

                                </div>
                                <p>선택</p>
                            </div>
                            <div class="ticket-complete">
                                <div class="shape">

                                </div>
                                <p>예매완료</p>
                            </div>
                            <div class="select-impossible">
                                <div class="shape">

                                </div>
                                <p>선택불가</p>
                            </div>
                            <div class="normal">
                                <div class="shape">

                                </div>
                                <p>일반</p>
                            </div>
                            <div class="disabled-seat">
                                <div class="shape">

                                </div>
                                <p>장애인석</p>
                            </div>
                        </div>
                    </div>
                    <div class="select-seat">
                        <div class="select-seat-top">
                            <p>선택좌석</p>    
                        </div>
                        <div class="seat-menu">
                            <div class="seat-item">
                                <p>-</p>
                            </div>
                            <div class="seat-item">
                                <p>-</p>
                            </div>
                            <div class="seat-item">
                                <p>-</p>
                            </div>
                            <div class="seat-item">
                                <p>-</p>
                            </div>
                            <div class="seat-item">
                                <p>-</p>
                            </div>
                            <div class="seat-item">
                                <p>-</p>
                            </div>
                            <div class="seat-item">
                                <p>-</p>
                            </div>
                            <div class="seat-item">
                                <p>-</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="people-menu">
                    <div class="people-type">
                        <p></p>
                    </div>
                    <div class="people-type">
                        <p></p>
                    </div>
                    <div class="people-type">
                        <p></p>
                    </div>
                    <div class="people-type">
                        <p></p>
                    </div>
                </div>
                <div class="payment-money">
                    <p>최종결제금액</p>
                    <div class="money">
                        <p>0</p>
                        <p>원</p>
                    </div>
                </div>
                <div class="prev-next-menu">
                    <div class="prev" onclick="javacript:history.back()">
                        <p>이전</p>
                    </div>
                    <div class="next">
                        <p>다음</p>
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
        <div class="select-pop-up">
        </div>
        <div class="sub-pop">
            <div class="pop-up">
                <div class="top">
                    <p>알림</p>
                    <div onclick="closeSubPop()" class="material-symbols-outlined">
                        close
                    </div>
                </div>
                <div class="bottom">
                    <p>관람하실 인원을 먼저 선택해주세요.</p>
                    <div onclick="closeSubPop()" class="check">
                        <p>확인</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="seat-pop">
            <div class="pop-up">
                <div class="top">
                    <p>알림</p>
                    <div onclick="closeSeatPop()" class="material-symbols-outlined">
                        close
                    </div>
                </div>
                <div class="bottom">
                    <p>좌석 선택이 완료되었습니다.</p>
                    <div onclick="closeSeatPop()" class="check">
                        <p>확인</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="cancel-pop">
            <div class="pop-up">
                <div class="top">
                    <p>알림</p>
                    <div onclick="closeCancelPop()" class="material-symbols-outlined">
                        close
                    </div>
                </div>
                <div class="bottom">
                    <p>선택하신 좌석을 모두 취소하고 다시 선택하시겠습니까?</p>
                    <div onclick="closeCancelPop()" class="cancel">
                        <p>취소</p>
                    </div>
                    <div onclick="reset()" class="check">
                        <p>확인</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="complete-pop">
            <div class="pop-up">
                <div class="top">
                    <p>알림</p>
                    <div onclick="closeCompletePop()" class="material-symbols-outlined">
                        close
                    </div>
                </div>
                <div class="bottom">
                    <p>인원선택은 총 8명까지 가능합니다.</p>
                    <div onclick="closeCompletePop()" class="check">
                        <p>확인</p>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <%@ include file="../include/footer.jsp" %>
</body>
</html>