<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri = "jakarta.tags.fmt" %>
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
    <link rel="stylesheet" href="../static/css/pay.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script defer src="../static/js/pay.js"></script>
</head>
<body>
<%
	Gson gson = new Gson();
	HashMap<String,Object> map = gson.fromJson(gson.toJson(session.getAttribute("map")), new TypeToken<HashMap<String,Object>>(){}.getType());
	List<MovieDTO> vo = MovieServiceImpl.getInstance().selectMovieName(map.get("movieName").toString());
	request.setAttribute("mv", vo);
%>
    <%@ include file="../include/header.jsp" %>
    <main>
        <div class="container">
            <h1>결제하기</h1>
            <div class="ticket-info">
                <div class="ticket-container">
                    <h1>예매정보</h1>
                    <img src="${mv[0].image }" alt="영화이미지">
                    <p>${mv[0].name }</p>
                    <div class="movie-date">
                        <p><fmt:formatDate value="${mv[0].openingDate }" pattern="yyyy.MM.dd"/> </p>
                        <p>10:00~12:01</p>
                    </div>
                    <div class="movie-area">
                        <p>군자/9관&bullet;2D</p>
                    </div>
                    <div class="select-people">
                    	<c:if test="${map['adultNumber']>0 }">
                    		성인  <fmt:formatNumber value=" ${map['adultNumber'] }" pattern="#" />  &nbsp;
                    	</c:if>
                    	<c:if test="${map['teenagerNumber']>0 }">
                    		청소년 <fmt:formatNumber value="${map['teenagerNumber'] }"/>  &nbsp;
                    	</c:if>
                    	<c:if test="${map['routeNumber']>0 }">
                    		경로 <fmt:formatNumber value="${map['routeNumber'] }" />
                    	</c:if>
                    </div>
                </div>
            </div>
            <div class="discount">
                <div class="dicount-container">
                    <h1>할인적용</h1>
                    <div class="reset">
                        <p>초기화</p>
                    </div>
                    <div class="discount-select-menu">
                        <div class="select-main">
                            <div class="first-main">
                                <p onclick="firstShow()">쿠폰/관람권/기타</p>
                            </div>
                            <div class="second-main">
                                <p onclick="secondShow()">포인트</p>
                            </div>
                        </div>
                        <div class="select-sub">
                            <div class="first-sub">
                                <div class="first-sub-container">
                                    <div class="first-sub-item">
                                        <p>할인쿠폰</p>
                                    </div>
                                    <div class="first-sub-item">
                                        <p>VIP 영화쿠폰</p>
                                    </div>
                                    <div class="first-sub-item">
                                        <p>메가박스 관람권</p>
                                    </div>
                                    <div class="first-sub-item">
                                        <p>스토어 교환권</p>
                                    </div>
                                    <div class="first-sub-item">
                                        <p>모바일 관람권</p>
                                    </div>
                                    <div class="first-sub-item">
                                        <p>페이즈 금액권</p>
                                    </div>
                                    <div class="first-sub-item">
                                        <p>중앙패밀리</p>
                                    </div>
                                </div>
                                <p>&bullet;기프트콘, 기프티쇼, 아이넘버, 도넛북, 스마트콘, 스마일콘, G마켓 예매권은 [모바일관람권]에서 사용하실 수 있습니다.</p>
                            </div>
                            <div class="second-sub">
                                <div class="second-sub-container">
                                    <div class="second-sub-item">
                                        <p>멤버십 포인트</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>U+ 멤버십</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>OK캐시백</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>L.POINT</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>GS&POINT</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>HD현대오일뱅크</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>해피포인트</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>블루멤버스 포인트</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>기아멤버스포인트</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>현대M포인트</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>북앤라이프캐시</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>컬쳐캐쉬</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>문화누리카드</p>
                                    </div>
                                    <div class="second-sub-item">
                                        <p>중앙멤버십</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="payment-method">
                            <h1>결제수단</h1>
                            <div class="pay-menu">
                                <div class="top">
                                    <p>JoongAng PAY</p>
                                </div>
                                <div class="bottom">
                                    <p>+</p>
                                    <p>자주 사용하는 카드 등록하고</p>
                                    <p>더욱 빠르게 결제하세요!</p>
                                </div>
                            </div>
                            <div class="settlement-method">
                                <div onclick="cardPay()" class="set-item">
                                    <p>신용/체크카드</p>
                                </div>
                                <div onclick="easyPay()" class="set-item">
                                    <p>간편결제</p>
                                </div>
                                <div onclick="phonePay()" class="set-item">
                                    <p>휴대폰결제</p>
                                </div>
                                <div onclick="bankPay()" class="set-item">
                                    <p>내통장결제</p>
                                </div>
                            </div>
                            <div class="bottom-menu">
                                <div class="card-select">
                                    <p>카드사 선택</p>
                                    <select name="" id="">
                                        <option value="">선택</option>
                                        <option value="">비씨카드</option>
                                        <option value="">국민카드</option>
                                        <option value="">신한카드</option>
                                        <option value="">삼성카드</option>
                                        <option value="">롯데카드</option>
                                        <option value="">농협카드</option>
                                        <option value="">하나카드</option>
                                        <option value="">현대카드</option>
                                        <option value="">씨티카드</option>
                                        <option value="">제주카드</option>
                                        <option value="">우리카드</option>
                                        <option value="">수협카드</option>
                                        <option value="">전북카드</option>
                                        <option value="">광주카드</option>
                                        <option value="">신협카드</option>
                                        <option value="">카카오뱅크</option>
                                        <option value="">케이뱅크</option>
                                        <option value="">우체국카드</option>
                                        <option value="">토스카드</option>
                                        <option value="">SC제일은행 비씨카드</option>
                                        <option value="">SC제일은행 삼성카드</option>
                                        <option value="">IBK기업은행 카드</option>
                                    </select>
                                    <label>
                                        <input type="radio" name="payment" value="ISP" checked>
                                        ISP
                                    </label>
                                    <label>
                                        <input type="radio" name="payment" value="일반결제">
                                        일반결제
                                    </label>
                                </div>
                                <div class="easy-select">
                                    <label>
                                        <input type="radio" name="payment" value="네이버페이" checked>
                                        네이버페이
                                    </label>
                                    <label>
                                        <input type="radio" name="payment" value="카카오페이">
                                        카카오페이
                                    </label>
                                    <label>
                                        <input type="radio" name="payment" value="페이코" checked>
                                        페이코
                                    </label>
                                    <label>
                                        <input type="radio" name="payment" value="KB-PAY">
                                        KB PAY
                                    </label>
                                </div>
                                <div class="phone-select">
                                    <p>&bullet;결제하신 금액은 익월 휴대폰 요금에 합산되어 청구되며, 휴대폰 결제한도는 통산사별 월 누적 이용 제한에 따라 적용됩니다.</p>
                                    <p>&bullet;매월 말일 23시30분 ~ 익월 00시 10분까지(40분간)는 시스템 점검시간으로 이용이 어려울 수 있습니다.</p>
                                    <p>&bullet;휴대폰 결제와 관련된 추가 안내는 FAQ를 참조해주세요.</p>
                                </div>
                                <div class="bank-select">
                                    <p>&bullet;내통장결제는 본인명의의 계좌를 최초 1회 등록 후 비밀번호 입력만으로 가편하게 이용할 수 있는 현금결제 서비스 입니다.</p>
                                    <p>&bullet;은행 점검시간의 경우 내통장결제서비스 이용이 불가합니다.</p>
                                </div>
                                <div class="pop-up">
                                    <h1>결제 프로모션</h1>
                                    <img src="https://img.megabox.co.kr/SharedImg/payPromt/2024/08/01/2JDSeyX2akPAxnrVQ5la7si7t4ESsESX.png" alt="pay">
                                    <p>네이버페이 1만원 이상 결제 시 500원 적립!</p>
                                    <img src="https://img.megabox.co.kr/SharedImg/payPromt/2024/07/05/z9Amz4ohMGa2jOgT6zJZtcchh0qcWAr6.png" alt="toss">
                                    <p>토스페이 첫 결제 시 2천원 토스포인트 적립</p>
                                </div>
                                <div class="agreement">
                                    <label class="custom-checkbox">
                                        <input type="checkbox" name="payment" value="agree">
                                        결제대행 서비스 약관 필수 동의
                                    </label>
                                    <div class="first-content">
                                        <p>전자금융거래 기본약관</p>
                                        <p>내용보기</p>
                                    </div>
                                    <div class="second-content">
                                        <p>개인정보 수집 및 이용에 대한 동의</p>
                                        <p>내용보기</p>
                                    </div>
                                    <div class="third-content">
                                        <p>개인정보의 제 3자 제공 동의</p>
                                        <p>내용보기</p>
                                    </div>
                                    <div class="fourth-content">
                                        <p>개인정보의 처리 위탁 동의</p>
                                        <p>내용보기</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pay-info">
                <h1>결제금액</h1>
                <div class="money-info">
                    <div class="people-type">
                    	<c:if test="${map['adultNumber']>0 }">
	                        <p>성인</p>
	                        <p> <fmt:formatNumber value="${map['adultNumber']*12000 }" pattern="#,###" />  </p>
                    	</c:if>
                    </div>
                    <div class="people-type">
                    	<c:if test="${map['teenagerNumber']>0 }">
	                        <p>청소년</p>
	                        <p><fmt:formatNumber value="${map['teenagerNumber']*9000 }" pattern="#,###" /></p>
                    	</c:if>
                    </div>
                    <div class="people-type">
                    	<c:if test="${map['routeNumber']>0 }">
	                        <p>경로</p>
	                        <p><fmt:formatNumber value="${map['routeNumber']*5000 }" pattern="#,###" /></p>
                    	</c:if>
                    </div>
                    <div class="people-type">
                        
                    </div>
                    <div class="line"></div>
                    <div class="money">
                        <p>금액</p>
                        <p><fmt:formatNumber value="${map['adultNumber']*12000+map['teenagerNumber']*9000+map['routeNumber']*3000 }" pattern="#,###" /></p>
                    </div>
                </div>
                <div class="subtract">
                    <p>-</p>
                </div>
                <div class="apply-discount">
                    <p>할인적용</p>
                    <p>0원</p>
                </div>
                <div class="difference">
                    <p>추가 차액</p>
                    <p>0</p>
                </div>
                <div class="final-payment">
                    <p>최종결제금액</p>
                    <p><fmt:formatNumber value="${map['adultNumber']*12000+map['teenagerNumber']*9000+map['routeNumber']*3000 }" pattern="#,###" />원</p>
                </div>
                <div class="line"></div>
                <div class="pay-method">
                    <p>결제수단</p>
                    <p>신용/체크카드</p>
                </div>
                <div class="prev-next">
                    <div class="prev" onclick="javascript:history.back()">
                        <a href="javascript:void(0)">이전</a>
                    </div>
                    <div class="next">
                        <a href="javascript:void(0)" onclick="payment()">결제</a>
                    </div>
                </div>
            </div>
            <a href="#">
                <img src="https://img.megabox.co.kr/SharedImg/cpBanner/2024/07/31/or8CL8PK3znFeIJP6xfivIxyxaT8baWv.png" alt="광고">
            </a>
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