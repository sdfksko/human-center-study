<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<link rel="icon" href="https://www.megabox.co.kr/static/pc/images/favicon.ico">
<script defer src="${pageContext.request.contextPath }/webjars/axios/1.7.2/dist/axios.min.js"></script>
<script defer src="${pageContext.request.contextPath }/webjars/jquery/3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/allMovieIdx.css">
<script defer src="${pageContext.request.contextPath }/static/js/header.js"></script>
<script defer src="${pageContext.request.contextPath }/static/js/allMovieIdx.js"></script>
<script defer src="${pageContext.request.contextPath }/static/js/youtube.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="allMovieContainer">
		<div class="hidden-inner"></div>
		<div class="inner">
		</div>
		<div class="outer">
			<div class="title-box">
				<div class="title">${vo.name }</div>
				<div class="sub-title">DEADPOOL & WOLVERIN</div>
				<div class="button-group">
					<button><img alt="" src="${pageContext.request.contextPath }/static/images/like.svg"> <span>${vo.movieLike }</span> </button><button>공유하기</button>
				</div>
			</div>
			<div class="movie-rate">
				<div class="score">
					<p>실관람 평점</p>
					<div class="number gt" id="mainMegaScore">7.7</div>
				</div>
				<div class="reserve">
					<p>예매율</p>
					<div class="number gt" id="mainMegaReserve">2 위</div>
				</div>
				<div class="audience">
					<p>누적관객수</p>
					<div class="number gt" id="mainMegaAudience">1,407,460</div>
				</div>
			</div>
			<div class="img-box">
				<img src="${vo.image }" alt="">
				<div class="button-group2">
					<button class="button-reserve">예매</button>
					<button class="button-reserve2">Dolby <br>CINEMA</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="background" value="${vo.background }"/>
	<script type="text/javascript">
		document.querySelector(".allMovieContainer").style.backgroundImage="url("+document.querySelector("#background").value+")";
	</script>
	<div class="movie-main">
		<div class="inner">
			<div class="title">
				<div class="title-list">
					<div class="item">주요정보</div>
					<div class="overview">
						<div class="movie-content">
							${vo.content}
						</div>
						<div class="movie-type">
							<div class="type-title">상영타입 : 2D</div>
							<div class="type-wrap">
								<div class="type-item">감독:김한결</div>
								<div class="type-item">장르:코미디/111분</div>
								<div class="type-item">등급 : 12세이상관람가</div>
								<div class="type-item">개봉일:<fmt:formatDate value="${vo.openingDate }" pattern="yyyy.MM.dd" /></div>
							</div>
							<div class="actor">출연진:조정석,이주명,한선화,신승호</div>
						</div>
						<div class="review-canvas">
							<img src="${pageContext.request.contextPath }/static/images/review-canvas.png" alt="">
						</div>
					</div>
				</div>
				<div class="title-list">
					<div class="item">실관람평</div>
					<div class="review">
						<div class="review-header">
							<div class="review-content">
								${vo.name}에 대한 <span>2,912</span>개의 이야기가 있어요.
							</div>
							<button>본 영화 등록</button>
						</div>
						<div class="review-menuBar">
							<div class="review-total">전체 <span>2,912</span>건</div>
							<div class="review-rank">
								<div class="review-item">최신순</div>
								<div class="review-item">공감순</div>
								<div class="review-item">평점순</div>
							</div>
						</div>
						<div class="review-info">
							<div class="info-img"><img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-mega-profile.png" alt=""><p>MEGABOX</p></div>
							<div class="info-text">
								<p><span>${vo.name}</span> 재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.</p>
								<p>관람일 기준 7일 이내 등록 시 50P 가 적립됩니다.</p>
								<p>포인트는 관람평 최대 10편 지급가능합니다.</p>
							</div>
							<div class="info-btn"><a>관람평쓰기</a></div>
						</div>
						<div class="review-main">
							<div class="review-img"><img src="https://img.megabox.co.kr/static/pc/images/mypage/bg-profile.png" alt=""><p>MEGABOX</p></div>
							<div class="review-rate">관람평</div>
							<div class="review-rate number">10</div>
							<div class="review-content">대박이에요</div>
						</div>
					</div>
				</div>
				<div class="title-list">
					<div class="item">무비포스트</div>
					<div class="movie-post"></div>
				</div>
				<div class="title-list">
					<div class="item">예고편/스틸컷</div>
					<div id="player"></div>
					<div class="forecast"></div>
				</div>
			</div>
		</div>
	</div>		
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>