<%@page import="com.example.demo.calendar.Calendar"%>
<%@page import="com.example.demo.calendar.CalendarDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page import="java.sql.*"%>
<%@page import="com.dbManager.dbManager"%>
<%
List<CalendarDTO> calendar = Calendar.prn(2024, 8, 7);
pageContext.setAttribute("calendar", calendar);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"
	href="https://www.megabox.co.kr/static/pc/images/favicon.ico">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script defer
	src="${pageContext.request.contextPath }/static/js/boutique.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/css/boutique.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<section class="boutique">
		<div class="boutique-title">코엑스 더 부티크 프라이빗 대관예매</div>
		<div class="main-img">
			<img
				src="https://img.megabox.co.kr/static/pc/images/reserve/private_01.png"
				alt="">
		</div>
		<div class="swiper boutiqueSwiper">
			<div class="swiper-wrapper">
				<c:forEach var="vo" items="${calendar }">
					<div class="swiper-slide calendar">
						<div>${vo.day }</div>
						<c:choose>
							<c:when test="${vo.dayOfWeek=='토' }">
								<div class="boutique-dayOfWeek blue">${vo.dayOfWeek }</div>
							</c:when>
							<c:when test="${vo.dayOfWeek=='일' }">
								<div class="boutique-dayOfWeek red">${vo.dayOfWeek }</div>
							</c:when>
							<c:otherwise>
								<div class="boutique-dayOfWeek">${vo.dayOfWeek }</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</div>
			<div class="swiper-button-next calendar"></div>
			<div class="swiper-button-prev calendar"></div>
		</div>
		<div class="reserve-box">
			<div class="reserve-location">
				<div class="reserve-location-title">상영관</div>
				<div onclick="firstShow()" class="room1">
					<p>프라이빗 2호</p>
					(10석)
				</div>
				<div onclick="secondShow()" class="room2">
					<p>프라이빗 1호</p>
					(8석)
				</div>
			</div>
			<div class="reserve-date">
				<div class="reserve-date-title">시간</div>
				<div class="reserve-date-box">
					<div class="item">10:00</div>
					<div class="item">14:00</div>
					<div class="item">18:00</div>
					<div class="item">22:00</div>
				</div>
			</div>
			<div class="reserve-movie">
				<div class="reserve-movie-title">영화</div>
				<div class="swiper movieSwiper">
					<div class="swiper-wrapper">
					<%
				Connection conn = dbManager.getDBConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String selectSql = "SELECT NAME, IMAGE FROM MOVIE WHERE MOVIEIDX < 7";
					pstmt = conn.prepareStatement(selectSql);
					
					rs = pstmt.executeQuery();
				
				while (rs.next()) {
					  String movieName = rs.getString("NAME");
                      String movieImage = rs.getString("IMAGE");
			%>
						<div class="swiper-slide">
							 <img src="<%= movieImage %>" alt="<%= movieName %>">
							<div class="movie-title"><%= movieName %></div>
							<input type="hidden" class="movie-name" value="<%= movieName %>">
                            <input type="hidden" class="movie-image" value="<%= movieImage %>">
							<button class="reserve-movie-button">
								선택
							</button>
						</div>
			<%
				}
			}	catch (Exception e) {
				System.out.println("자료 조회 오류: " + e.getMessage());
			}	finally {
				dbManager.dbClose(conn, pstmt, rs);
			}
			%>
					</div>
					<div class="swiper-button-next movie"></div>
					<div class="swiper-button-prev movie"></div>
				</div>
			</div>
		</div>
		<div class="rental-info">
			<div class="rental-info-title">대관요금</div>
			<div class="rental-box-header">
				<div class="item">상영관</div>
				<div class="item">주중(월,화,수,목)</div>
				<div class="item">주말(금,토,일)</div>
				<div class="item">최대 이용인원</div>
				<div class="item">최대 이용시간</div>
			</div>
			<div class="rental-box-content">
				<div class="item">프라이빗 1호</div>
				<div class="item">500,000원</div>
				<div class="item">600,000원</div>
				<div class="item">8</div>
				<div class="item">3시간</div>
				<div class="item">프라이빗 2호</div>
				<div class="item">600,000원</div>
				<div class="item">700,000원</div>
				<div class="item">10</div>
			</div>
			<ul class="rental-text">
				<li>더 부티크 프라이빗 총 이용시간은 3시간 입니다.(라운지 이용 +영화관람)</li>
				<li>[더 부티크 프라이빗 1호 전용관람권]으로2호 관람시 추가금액 10만원이 발생되며, 일반결제 예약 후
					ARS문의 부탁드립니다. (*2호전용관람권으로 1호 관람시 일반결제 예약 후 ARS 문의)</li>
			</ul>
		</div>
		<div class="package-area">
			<div class="package-area-title">패키지 신청</div>
			<div class="package-sup-title">더 부티크 프라이빗에서는 영화 관람과 함께 다양한 패키지를
				이용해보실 수 있습니다. 이용 원하시는 패키지를 클릭해주세요! (당일 신청 불가)</div>
			<div class="package-wrap">
				<div class="item">
					<img
						src="https://img.megabox.co.kr//SharedImg/prvatePackagePcImg/2024/04/09/IQQeLhT1BxitrotEeehiY8TO7cubNDXA.png"
						alt="">
					<div class="food-info">
						<div class="name-area">
							<p class="name" id="PPKC0" price="150000" prdtnm="크래프트비어 세트">크래프트비어
								세트</p>
							<p class="price">
								<em>150,000</em> <span>원</span>
							</p>
						</div>
						<ul class="dot_list">
							<li>크레프트 비어 8잔</li>
							<li>크루아상 샌드위치 2개</li>
							<li>쉬림프피쉬&amp;칩스 1개</li>
							<li>소시지&amp;프렌치빈 2개</li>
							<li>소시지&amp;칩스 1개</li>
							<li>치즈살사 나쵸 2개</li>
							<li>치킨&amp;칩스 1개</li>
						</ul>
					</div>
				</div>
				<div class="item">
					<img
						src="https://img.megabox.co.kr//SharedImg/prvatePackagePcImg/2024/04/12/ZbQ4TD8yeIGkIW92DBogYRElNAILIotB.png"
						alt="">
					<div class="food-info">
						<div class="name-area">
							<p class="name" id="PPKC0" price="150000" prdtnm="크래프트비어 세트">프리미엄
								와인 세트 세트</p>
							<p class="price">
								<em>150,000</em> <span>원</span>
							</p>
						</div>
						<ul class="dot_list">
							<li>프리미엄 와인(750ml) 1병</li>
							<li>치킨&칩스 1개</li>
							<li>쉬림프피쉬&amp;칩스 1개</li>
							<li>치즈살사 나쵸 1개</li>
							<li>소시지&amp;칩스 1개</li>
						</ul>
					</div>
				</div>
				<div class="item">
					<img
						src="https://img.megabox.co.kr//SharedImg/prvatePackagePcImg/2024/04/12/zpgR7LQMLa7Qim22HLjydD5ilKizgtTR.png"
						alt="">
					<div class="food-info">
						<div class="name-area">
							<p class="name" id="PPKC0" price="150000" prdtnm="플레이팅 세트">플레이팅
								세트</p>
							<p class="price">
								<em>100,000</em> <span>원</span>
							</p>
						</div>
						<ul class="dot_list">
							<li>쉬림프피시&칩스 1병</li>
							<li>크루아상 샌드위치 2개</li>
							<li>소시지&amp;칩스 1개</li>
							<li>팝콘R 3개</li>
							<li>소시지&프렌치빈 2개</li>
							<li>츄러스 2개</li>
						</ul>
					</div>
				</div>
				<div class="item">
					<img
						src="https://img.megabox.co.kr//SharedImg/prvatePackagePcImg/2024/04/23/GcmMEMeQxJq02s6yd4o1cxjagYV2zrc3.jpg"
						alt="">
					<div class="food-info">
						<div class="name-area">
							<p class="name" id="PPKC0" price="150000" prdtnm="플레이팅 세트">쉐이크쉑
								패키지(10인)</p>
							<p class="price">
								<em>195,000</em> <span>원</span>
							</p>
						</div>
						<ul class="dot_list">
							<li>쉑버거 5개</li>
							<li>스모크쉑 3개</li>
							<li>치킨쉑 2개</li>
							<li>프라이 3개</li>
							<li>치킨바이트(10조각) 3개</li>
							<li>쉐이크 10개(바닐라,초코,딸기 중 선택, 미 선택시 바닐라 기본제공)</li>
						</ul>
					</div>
				</div>
				<div class="item">
					<img
						src="https://img.megabox.co.kr//SharedImg/prvatePackagePcImg/2024/04/12/DM5DZMKXPDP8pdww3zkKsHAlBvEsxy41.jpg"
						alt="">
					<div class="food-info">
						<div class="name-area">
							<p class="name" id="PPKC0" price="150000" prdtnm="플레이팅 세트">쉐이크쉑
								패키지(8인)</p>
							<p class="price">
								<em>150,000</em> <span>원</span>
							</p>
						</div>
						<ul class="dot_list">
							<li>쉑버거 4개</li>
							<li>치킨바이트(10조각) 2개</li>
							<li>스모크쉑 4개</li>
							<li>레몬에이드 4개</li>
							<li>프라이 3개</li>
							<li>쉐이크 4개 (바닐라,초코, 딸기 중 선택, 미선택시 바닐라 기본제공)</li>
						</ul>
					</div>
				</div>

				<div class="item">
					<img
						src="https://img.megabox.co.kr//SharedImg/prvatePackagePcImg/2024/04/12/sFPP4556r6TLwvC6KDkNnvdFsmsv1n43.jpg"
						alt="">
					<div class="food-info">
						<div class="name-area">
							<p class="name" id="PPKC0" price="150000" prdtnm="플레이팅 세트">쉐이크쉑
								패키지(4인)</p>
							<p class="price">
								<em>100,000</em> <span>원</span>
							</p>
						</div>
						<ul class="dot_list">
							<li>쉑버거(더블) 2개</li>
							<li>치킨바이트(6조각) 2개</li>
							<li>스모크쉑(더블) 2개</li>
							<li>레몬에이드 2개</li>
							<li>프라이 2개</li>
							<li>쉐이크 2개 (바닐라,초코, 딸기 중 선택, 미선택시 바닐라 기본제공)</li>
						</ul>
					</div>
				</div>
				<div class="item">
					<img
						src="https://img.megabox.co.kr//SharedImg/prvatePackagePcImg/2024/04/12/yIAnH0ZMAIhn5NCSopVn5PAlJ6Fm3vyx.png"
						alt="">
					<div class="food-info">
						<div class="name-area">
							<p class="name" id="PPKC0" price="150000" prdtnm="플레이팅 세트">더
								플레이스 패키지(8인)</p>
							<p class="price">
								<em>220,000</em> <span>원</span>
							</p>
						</div>
						<ul class="dot_list">
							<li>딸리아따 디 만조</li>
							<li>트러플 풍기 피자</li>
							<li>페스카토레 리조또</li>
							<li>프레시 마르게리따 피자</li>
							<li>크랩 로제 리조또</li>
							<li>리코타 프루타 샐러드</li>
							<li>트러플 프라이즈</li>
							<li>치킨 시저 샐러드</li>
						</ul>
					</div>
				</div>
				<div class="item">
					<img
						src="https://img.megabox.co.kr//SharedImg/prvatePackagePcImg/2024/04/12/WStYKJuV3m6OMPVLa8E7d02ev0HaxiKo.png"
						alt="">
					<div class="food-info">
						<div class="name-area">
							<p class="name" id="PPKC0" price="150000" prdtnm="플레이팅 세트">프러포즈
								베이직</p>
							<p class="price">
								<em>400,000</em> <span>원</span>
							</p>
						</div>
						<ul class="dot_list">
							<li>꽃다발(화이트)</li>
							<li>홀 케이크</li>
							<li>센터피스장식(2ea)</li>
							<li>샴페인 375ml</li>
						</ul>
					</div>
				</div>
				<div class="item">
					<img
						src="https://img.megabox.co.kr//SharedImg/prvatePackagePcImg/2024/04/12/skZnSqnUR58dr6TsPpqNyaJIhgXhw8OH.png"
						alt="">
					<div class="food-info">
						<div class="name-area">
							<p class="name" id="PPKC0" price="150000" prdtnm="플레이팅 세트">프러포즈
								스페셜</p>
							<p class="price">
								<em>550,000</em> <span>원</span>
							</p>
						</div>
						<ul class="dot_list">
							<li>꽃다발(유색)</li>
							<li>홀 케이크</li>
							<li>센터피스장식(3ea)</li>
							<li>샴페인 375ml</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="package-text">
				<p>이해를 돕기 위한 이미지로 실제와 다를 수 있습니다.</p>
				<p>구성 메뉴는 시즌이나 업체 사정에 따라 변경될 수 있습니다.</p>
			</div>
			<button class="package-button">상품 더보기</button>
		</div>
		<div class="payment-box">
			<div class="payment-title">결제</div>
			<div class="paymentArea">
				<div class="info">
					<div class="img">
						<img id="smallImage" src="" alt="">
					</div>
					<ul class="dot_list">
						<li id="selectTheabNo"><span>극장 </span><span>코엑스 더 부티크 프라이빗 2호</span></li>
						<li id="selectTime"><span>일시 </span><span>원하시는 시간을 선택해 주세요</span></li>
						<li id="selectMovie"><span>영화 </span><span id="movieTitle">원하시는 영화를 선택해주세요.</span></li>
					</ul>
				</div>

				<div class="payment">
					<div class="top">
						<div class="tit">결제수단</div>
						<ul class="pay" id="payDcMeanSelect">
							<li><input type="radio" id="rdoPayjoongang-display"
								name="rdo_pay" value="joongang-display" checked="checked">
								<label for="rdoPayjoongang-display">JoongAng PAY</label>

								<div id="joongAngPayDiv" style="display: none;">
									<select id="joongAngPay" class="x-small" style="display: none;"
										disabled="disabled">
									</select>
								</div>
								<div id="joongAngPayDivNo" style=""
									onclick="gfn_alertMsgBox(&quot;로그인 후 등록 가능합니다.&quot;);">
									<div class="plusInput">
										<input id="inp_reg" type="text" value="결제수단 등록"
											style="cursor: pointer;" readonly=""> <label
											for="inp_reg"></label>
									</div>
								</div> <a href="javascript:void(0);" class="btn" id="btnMng" style=""
								onclick="gfn_alertMsgBox(&quot;로그인 후 이용 가능합니다.&quot;);">설정</a></li>

							<li><input type="radio" id="rdoPaycredit" name="rdo_pay"
								value="credit"> <label for="rdoPaycredit">신용/체크카드</label>
							</li>
							<li><input type="radio" id="rdoPaycmbnd" name="rdo_pay"
								value="cmbnd"> <label for="rdoPaycmbnd">관람/상품권</label> <select
								id="cmbndPayMean" class="x-small" disabled="disabled">
									<option value="00">관람권/상품권 선택</option>
									<option value="mcoupon">더 부티크 프라이빗 관람권</option>
									<option value="scoupon">스토어 교환권</option>
									<option value="m-cpon-display">모바일 상품권</option>
							</select></li>
							<li><input type="radio" id="rdoPayannusgift" name="rdo_pay"
								value="annusgift"> <label for="rdoPayannusgift">아너스카드</label>
							</li>
						</ul>
					</div>
					<div class="total">
						최종 결제금액<span><em>0</em>원</span>
					</div>

				</div>
				<div class="noti">
					<dl class="dot_list_dl">
						<dt>이용안내</dt>
						<dd id="payInfo">선택하신 상영관은 프라이빗 2호입니다. 수용 인원은 라운지 이용 및 관람 인원
							포함하여 총 10명입니다.</dd>
						<dt>환불 및 배상 규정</dt>
						<dd>프라이빗은 당일 예매는 불가능하며, 환불은 티켓 시간 기준 48시간 이전까지 가능합니다.</dd>
						<dd>프라이빗 이용 중 고객 부주의로 인해 스크린을 포함한 시설물 파손이 발생할 경우 손해 배상이 청구될 수
							있습니다.</dd>
					</dl>
					<div class="ck">
						<input type="checkbox" id="privPayChk"><label
							for="privPayChk">위의 유의사항 및 환불, 배상 규정 확인하였으며, 이에 동의합니다.</label>
					</div>
				</div>
			</div>
			<button class="payment-button">결제하기</button>
		</div>
	</section>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>