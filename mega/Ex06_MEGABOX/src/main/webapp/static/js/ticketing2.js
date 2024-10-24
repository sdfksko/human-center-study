$(document).ready(function() {
    $(".contry_location").click(function() {
        getMovieList();
    });
    $(".movie_title").click(function() {
        getMovieList();
    });
});

const homeMenuEl = document.querySelector('main .home-menu');
window.addEventListener('scroll', _.throttle(() => {
    console.log('scrollY:', window.scrollY);

    if (window.scrollY < 100) {
        gsap.to(homeMenuEl, {duration: 0, opacity: 0, display: 'none'});
    } else {
        gsap.to(homeMenuEl, {duration: 0, opacity: 1, display: 'block'});
    }
}));


const swiperTicketing = new Swiper('.ticketing-select .swiper-container', {
    slidesPerView: 14,
    spaceBetween: 0,
    centeredSlides: false,
    loop: false,
    navigation: {
        prevEl: '.ticketing-select .swiper-prev',
        nextEl: '.ticketing-select .swiper-next',
    },
    pagination: false, // pagination 비활성화
});


const swiperTime = new Swiper('.time-menu .swiper-container', {
    slidesPerView: 11,
    spaceBetween: 0,
    centeredSlides: false,
    loop: false,
    navigation: {
        prevEl: '.time-menu .swiper-prev',
        nextEl: '.time-menu .swiper-next',
    },
    pagination: false, // pagination 비활성화
});

document.addEventListener('DOMContentLoaded', function() {
    // 이 메소드가 문서가 완전히 로드된 후 자동으로 실행됩니다.
    movieFrist();
});

function movieFrist() {
    const firstEl = document.querySelector('.movie-menu .top-first-menu')
    firstEl.style.borderWidth = '1px 1px 0 1px';
    firstEl.style.borderStyle = 'solid';
    firstEl.style.borderColor = '#222';

    const secondEl = document.querySelector('.movie-menu .top-second-menu')
    secondEl.style.borderWidth = '0 0 1px 0';
    secondEl.style.borderStyle = 'solid';
    secondEl.style.borderColor = '#222';
    
    /* 이성근 작업ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
    $.ajax({
            url: 'getMovieTitleList.jsp',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',       
            type: 'POST',
            success: function(response) {
                console.log('movieList response', response);
                
                // response가 이미 JSON 객체로 파싱된 상태일 수 있습니다.
                // 확인 후 JSON 파싱을 시도합니다.
                var jsonResponse;
                if (typeof response === 'string') {
                    try {
                        jsonResponse = JSON.parse(response);
                    } catch (e) {
                        console.error('Failed to parse JSON:', e);
                        return;
                    }
                } else {
                    jsonResponse = response;
                }

                // "locations" 키에서 데이터 추출
                var data = jsonResponse.movies;

                if (!Array.isArray(data)) {
                    console.error('Expected an array but received:', data);
                    console.log("test : is not Array")
                    return;
                }
                console.log("test : it is Array")
                
                var container = document.querySelector('.movie-title-list'); // HTML을 삽입할 대상 클래스
                
                // 기존 내용 제거
                container.innerHTML = '';
    
                // 데이터 배열을 반복하여 HTML 생성
                data.forEach(function(item) {
                    var divElement = document.createElement('div'); // 새로운 div 요소 생성
    				divElement.classList.add('first-menu-item');
    
                    var pElement = document.createElement('p'); // 새로운 p 요소 생성
                    pElement.textContent = item; // p 태그의 텍스트 설정
    
                    // div 요소에 p 태그 추가
                    divElement.appendChild(pElement);
    
                    // container에 div 요소 추가
                    container.appendChild(divElement);
                console.log("Server response:", item);
                });
                
            },
            error: function(error) {
                // 요청 실패 시 처리할 로직을 작성합니다.
                console.log("Error:", error);
            }
        });
        /* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */

    const firstMenuEl = document.querySelector('.movie-menu .middle-first-menu')
    firstMenuEl.style.display = 'block'

    const secondMenuEl = document.querySelector('.movie-menu .middle-second-menu')
    secondMenuEl.style.display = 'none'
};

function movieSecond() {
    const firstEl = document.querySelector('.movie-menu .top-first-menu')
    firstEl.style.borderWidth = '0 0 1px 0';
    firstEl.style.borderStyle = 'solid';
    firstEl.style.borderColor = '#222';

    const secondEl = document.querySelector('.movie-menu .top-second-menu')
    secondEl.style.borderWidth = '1px 1px 0 1px';
    secondEl.style.borderStyle = 'solid';
    secondEl.style.borderColor = '#222';

    const firstMenuEl = document.querySelector('.movie-menu .middle-first-menu')
    firstMenuEl.style.display = 'none'

    const secondMenuEl = document.querySelector('.movie-menu .middle-second-menu')
    secondMenuEl.style.display = 'block'
};

function theaterFirst() {
    const firstEl = document.querySelector('.theater-menu .top-first-menu')
    firstEl.style.borderWidth = '1px 1px 0 1px';
    firstEl.style.borderStyle = 'solid';
    firstEl.style.borderColor = '#222';

    const secondEl = document.querySelector('.theater-menu .top-second-menu')
    secondEl.style.borderWidth = '0 0 1px 0';
    secondEl.style.borderStyle = 'solid';
    secondEl.style.borderColor = '#222';

    const firstMenuEl = document.querySelector('.theater-menu .sub-middle-menu')
    firstMenuEl.style.display = 'block'
    firstMenuEl.style.display = 'flex'

    const secondMenuEl = document.querySelector('.theater-menu .sub-middleSecond-menu')
    secondMenuEl.style.display = 'none'
};

function theaterSecond() {
    const firstEl = document.querySelector('.theater-menu .top-first-menu')
    firstEl.style.borderWidth = '0 0 1px 0';
    firstEl.style.borderStyle = 'solid';
    firstEl.style.borderColor = '#222';

    const secondEl = document.querySelector('.theater-menu .top-second-menu')
    secondEl.style.borderWidth = '1px 1px 0 1px';
    secondEl.style.borderStyle = 'solid';
    secondEl.style.borderColor = '#222';

    const firstMenuEl = document.querySelector('.theater-menu .sub-middle-menu')
    firstMenuEl.style.display = 'none'

    const secondMenuEl = document.querySelector('.theater-menu .sub-middleSecond-menu')
    secondMenuEl.style.display = 'block'
    secondMenuEl.style.display = 'flex'
};



function theaterSeoul() {
    const firstEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .seoul-area')
    firstEl.style.display = 'block'
    const secondEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .gyeonggi-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .incheon-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .daejeon-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .busan-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .gwangju-area')
    sixthEl.style.display = 'none'
    const seventhEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .gangwon-area')
    seventhEl.style.display = 'none'
    const eighthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .jeju-area')
    eighthEl.style.display = 'none'
}

function theaterGyeonggi() {
    const firstEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .seoul-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .gyeonggi-area')
    secondEl.style.display = 'block'
    const thirdEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .incheon-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .daejeon-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .busan-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .gwangju-area')
    sixthEl.style.display = 'none'
    const seventhEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .gangwon-area')
    seventhEl.style.display = 'none'
    const eighthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu.locationList .jeju-area')
    eighthEl.style.display = 'none'
}

function theaterIncheon() {
    const firstEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .seoul-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gyeonggi-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .incheon-area')
    thirdEl.style.display = 'block'
    const fourthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .daejeon-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .busan-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gwangju-area')
    sixthEl.style.display = 'none'
    const seventhEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gangwon-area')
    seventhEl.style.display = 'none'
    const eighthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .jeju-area')
    eighthEl.style.display = 'none'
}

function theaterDaejeon() {
    const firstEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .seoul-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gyeonggi-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .incheon-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .daejeon-area')
    fourthEl.style.display = 'block'
    const fifthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .busan-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gwangju-area')
    sixthEl.style.display = 'none'
    const seventhEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gangwon-area')
    seventhEl.style.display = 'none'
    const eighthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .jeju-area')
    eighthEl.style.display = 'none'
}

function theaterBusan() {
    const firstEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .seoul-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gyeonggi-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .incheon-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .daejeon-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .busan-area')
    fifthEl.style.display = 'block'
    const sixthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gwangju-area')
    sixthEl.style.display = 'none'
    const seventhEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gangwon-area')
    seventhEl.style.display = 'none'
    const eighthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .jeju-area')
    eighthEl.style.display = 'none'
}

function theaterGwangju() {
    const firstEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .seoul-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gyeonggi-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .incheon-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .daejeon-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .busan-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gwangju-area')
    sixthEl.style.display = 'block'
    const seventhEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gangwon-area')
    seventhEl.style.display = 'none'
    const eighthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .jeju-area')
    eighthEl.style.display = 'none'
}

function theaterGangwon() {
    const firstEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .seoul-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gyeonggi-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .incheon-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .daejeon-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .busan-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gwangju-area')
    sixthEl.style.display = 'none'
    const seventhEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gangwon-area')
    seventhEl.style.display = 'block'
    const eighthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .jeju-area')
    eighthEl.style.display = 'none'
}

function theaterJeju() {
    const firstEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .seoul-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gyeonggi-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .incheon-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .daejeon-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .busan-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gwangju-area')
    sixthEl.style.display = 'none'
    const seventhEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .gangwon-area')
    seventhEl.style.display = 'none'
    const eighthEl = document.querySelector('.theater-menu .sub-middle-menu .middle-second-menu .jeju-area')
    eighthEl.style.display = 'block'
}


function theaterDolbyCinema() {
    const firstEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-cinema-area')
    firstEl.style.display = 'block'
    const secondEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .mega-mx4d-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .the-boutique-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-atmos-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .comfort-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .megabox-kids-area')
    sixthEl.style.display = 'none'
}

function theaterMega() {    
    const firstEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-cinema-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .mega-mx4d-area')
    secondEl.style.display = 'block'
    const thirdEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .the-boutique-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-atmos-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .comfort-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .megabox-kids-area')
    sixthEl.style.display = 'none'
}

function theaterBoutique() {
    const firstEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-cinema-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .mega-mx4d-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .the-boutique-area')
    thirdEl.style.display = 'block'
    const fourthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-atmos-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .comfort-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .megabox-kids-area')
    sixthEl.style.display = 'none'
}

function theaterDolbyAtmos() {
    const firstEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-cinema-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .mega-mx4d-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .the-boutique-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-atmos-area')
    fourthEl.style.display = 'block'
    const fifthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .comfort-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .megabox-kids-area')
    sixthEl.style.display = 'none'
}

function theaterComfort() {
    const firstEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-cinema-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .mega-mx4d-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .the-boutique-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-atmos-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .comfort-area')
    fifthEl.style.display = 'block'
    const sixthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .megabox-kids-area')
    sixthEl.style.display = 'none'
}

function theaterMegaBoxKids() {
    const firstEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-cinema-area')
    firstEl.style.display = 'none'
    const secondEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .mega-mx4d-area')
    secondEl.style.display = 'none'
    const thirdEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .the-boutique-area')
    thirdEl.style.display = 'none'
    const fourthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .dolby-atmos-area')
    fourthEl.style.display = 'none'
    const fifthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .comfort-area')
    fifthEl.style.display = 'none'
    const sixthEl = document.querySelector('.theater-menu .sub-middleSecond-menu .middle-second-menu .megabox-kids-area')
    sixthEl.style.display = 'block'
}


function makeMovieTimeTable () {
	$.ajax({
	        url: 'getMovieTimeTable.jsp',
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',       
	        type: 'POST',
	        dataType: 'json',  // 응답 데이터 형식을 JSON으로 설정
	        data: {
		        locationList: JSON.stringify(Array.from(selectedLocationItems)),
		        movieList: JSON.stringify(Array.from(selectedMovieItems))
			},
	        success: function(response) {
				console.log(response); //받아온 데이터 체크용
										
				const container = document.querySelector('.movie-time');
				//새로 받아온 리스트 표기를 위하여 기존 내용들 삭제
  				container.innerHTML = '';
  				
  				if(response.length != 0){
					response.forEach(function(item) {
	                    var divElement0 = document.createElement('div'); // 새로운 div 요소 생성
	    				divElement0.classList.add('time-show');
	                    var divElement1 = document.createElement('div'); // 새로운 div 요소 생성
	    				divElement1.classList.add('time');
	                    var pElement1 = document.createElement('p'); // 새로운 p 요소 생성
	                    pElement1.style.fontSize = 18;
	                    pElement1.style.fontWeight = 'bold';
	                   	var stDate = item.startTime;
	                   	var stTime = stDate.substring(11,16);
	                    pElement1.textContent = stTime;
	                    var pElement2 = document.createElement('p'); // 새로운 p 요소 생성
	                    pElement2.style.fontSize = 15;
	                    pElement2.style.color = '#808080';
	                   	var edDate = item.endTime;
	                   	var edTime = edDate.substring(11,16);
	                    pElement2.textContent = '~' + edTime;
	                    divElement1.appendChild(pElement1);
	                    divElement1.appendChild(pElement2);
	    
	                    var divElement2 = document.createElement('div'); // 새로운 div 요소 생성
	    				divElement2.classList.add('info');
	                    var pElement3 = document.createElement('p'); // 새로운 p 요소 생성
	                    pElement3.style.fontWeight = 'bold';
	                    pElement3.textContent = item.movieName;
	                    var pElement4 = document.createElement('p'); // 새로운 p 요소 생성
	                    pElement4.style.fontSize = 13;
	                    pElement4.textContent = '2D';
	                    divElement2.appendChild(pElement3);
	                    divElement2.appendChild(pElement4);
	                    
	                    var divElement3 = document.createElement('div'); // 새로운 div 요소 생성
	    				divElement3.classList.add('area');
	                    var pElement5 = document.createElement('p'); // 새로운 p 요소 생성
	                    pElement5.textContent = item.locationName;
	                    var pElement6 = document.createElement('p'); // 새로운 p 요소 생성
	                    pElement6.textContent = item.roomLocation + '관';
	                    var pElement7 = document.createElement('p'); // 새로운 p 요소 생성
	                    pElement7.textContent = '예약가능';
	                    divElement3.appendChild(pElement5);
	                    divElement3.appendChild(pElement6);
	                    divElement3.appendChild(pElement7);
	                    
						divElement0.appendChild(divElement1);
						divElement0.appendChild(divElement2);
						divElement0.appendChild(divElement3);
						container.appendChild(divElement0);
	                    
					    console.log(item.startTime);
					    console.log("processed");
					    
				        const timeEl = document.querySelector('.time-menu .bottom-main')
				        timeEl.style.display = 'none';
				        const movieEl = document.querySelector('.time-menu .movie-time')
				        movieEl.style.display = 'flex';
				        movieEl.style.flexDirection = 'column';
				        
				        const pickDayEl = document.querySelectorAll('.swiper-container .swiper-wrapper.day .swiper-slide p');
                     	pickDayEl.forEach(startDay => {
						    // p 태그의 텍스트 가져오기
						    const text = startDay.textContent;
						    // 정규 표현식으로 숫자 부분 추출
						    const numberMatch = text.match(/^\d+/);
						    if (numberMatch) {
						   		const number = numberMatch[0]; // 추출된 숫자 부분
						   		
						   		// 날짜 비교 부분
								console.log('day : ' + number);
								console.log('to day : ' + stDate.substring(0,2));
						   		
								if(number == stDate.substring(0,2)){
									startDay.style.color = '#000000';
									startDay.style.fontWeight = 'bold';
								}
						    }
						});
				        
                     	const pickHourEl = document.querySelectorAll('.swiper-container .swiper-wrapper.hour .swiper-slide p');
                     	pickHourEl.forEach(startHour => {
							const hourEl = startHour.textContent;
							
//							console.log('hourEl : ' + hourEl);
//							console.log('text : ' + stDate.substring(11,13));
							if(hourEl == stDate.substring(11,13)){
								console.log(hourEl);
								startHour.style.color = '#000000';
								startHour.style.fontWeight = 'bold';
						}
					});
				        
				});
			} else {
				const timeEl = document.querySelector('.time-menu .bottom-main')
		        timeEl.style.display = 'block';
		        const movieEl = document.querySelector('.time-menu .movie-time')
		        movieEl.style.display = 'none';
			}
        },
        error: function(jqXHR, textStatus, errorThrown) {
			
        console.error("AJAX error:", textStatus, errorThrown);
        console.error("Response text:", jqXHR.responseText); // 응답 본문 확인
        }
    });
}

//const selectedItems = new Set(); - 영화와 지역 둘다 누를 수 있어야 하기 때문에 두개로 나눔
const selectedMovieItems = new Set();
const selectedLocationItems = new Set();

const maxSelection = 3;


const alertElement = document.querySelector('.alert-message');

/* 이전 코드 (이성근)
//영화를 클릭하면 백그라운드 색상 변경 및 클릭목록에 추가(이미 클릭되어있으면 색상 지우기 및 클릭목록에 제거)
document.querySelectorAll('.movie-menu .sub-middle-menu .first-menu-item').forEach(item => {
    item.addEventListener('click', function() {
		console.log('clicked')*/
document.querySelector('.movie-menu .sub-middle-menu').addEventListener('click', function(event) {
	// 클릭된 요소를 기준으로 가장 가까운 .first-menu-item 클래스를 가진 조상을 찾음
	const item = event.target.closest('.first-menu-item');
	const itemText = item.querySelector('p').textContent;
	
	//클릭된 내용 가져오는 테스트코드
	const pElement = item.querySelector('p');
	const pText = pElement ? pElement.textContent : null;
	
	// 만약 클릭된 요소가 .first-menu-item 클래스를 가지지 않은 경우 함수 종료
	if (!item) return; 
	
	// 콘솔에 'clicked' 문자열을 출력하여 클릭 이벤트가 발생했는지 확인
	console.log('clicked : ' + pText);
    if (selectedMovieItems.has(itemText)) {
        selectedMovieItems.delete(itemText);
        item.style.backgroundColor = '';
        item.style.borderWidth = '';
        item.style.borderStyle = '';
        item.style.borderColor = '';
    } else {
        if (selectedMovieItems.size < maxSelection) {
            selectedMovieItems.add(itemText);
            item.style.backgroundColor = 'rgb(102, 102, 102)';
        } else {
            //alertElement.style.display = 'block'; 요소를 찾을 수 없어 오류 발생하여 아래의 알림창으로 수정 (이성근)
            alert("최대 3개까지만 선택이 가능합니다.");
        }
    }
    
    if(selectedLocationItems.size > 0){
//				var output = '';
		makeMovieTimeTable();
	}
});

//지점 클릭시 해당 지점의 타임테이블 가져옴(영화도 클릭되어 있다면 해당 영화의 타임테이블로 가져옴)
document.querySelector('.theater-menu .middle-second-menu').addEventListener('click', function(event) {
	// 클릭된 요소를 기준으로 가장 가까운 .first-menu-item 클래스를 가진 조상을 찾음
	const item = event.target.closest('.second-menu-item');
	const itemText = item.querySelector('p').textContent;
	
	// 만약 클릭된 요소가 .first-menu-item 클래스를 가지지 않은 경우 함수 종료
	if (!item) return; 
	
    if (selectedLocationItems.has(itemText)) {
        selectedLocationItems.delete(itemText);
        item.style.backgroundColor = '';
        item.style.borderWidth = '';
        item.style.borderStyle = '';
        item.style.borderColor = '';
    } else {
        if (selectedLocationItems.size < maxSelection) {
            selectedLocationItems.add(itemText);
            item.style.backgroundColor = 'rgb(102, 102, 102)';
            
            if(selectedLocationItems.size > 0){
//				var output = '';
				makeMovieTimeTable();
			}
        } else {
            //alertElement.style.display = 'block'; 요소를 찾을 수 없어 오류 발생하여 아래의 알림창으로 수정 (이성근)
            alert("최대 3개까지만 선택이 가능합니다.");
        }
    }
});



const alert2Element = document.querySelector('.alert-message');

document.querySelectorAll('.movie-menu .sub-middle-menu .second-menu-item').forEach(item => {
    item.addEventListener('click', function() {
        if (selectedItems.has(item)) {
            selectedItems.delete(item);
            item.style.backgroundColor = '';
            item.style.borderWidth = '';
            item.style.borderStyle = '';
            item.style.borderColor = '';
        } else {
            if (selectedItems.size < maxSelection) {
                selectedItems.add(item);
                item.style.backgroundColor = 'rgb(102, 102, 102)';
            } else {
                alert2Element.style.display = 'block';
            }
        }
    });
});

document.querySelectorAll('.movie-menu .sub-middle-menu .middle-second-menu').forEach(item => {
    item.addEventListener('click', function() {
        if (selectedItems.has(item)) {
            selectedItems.delete(item);
            item.style.backgroundColor = '';
            item.style.borderWidth = '';
            item.style.borderStyle = '';
            item.style.borderColor = '';
        } else {
            if (selectedItems.size < maxSelection) {
                selectedItems.add(item);
                item.style.backgroundColor = 'rgb(102, 102, 102)';
            } else {
                alert2Element.style.display = 'block';
            }
        }
    });
});


document.querySelectorAll('.theater-menu .sub-middle-menu .first-menu-item').forEach(item => {
    item.addEventListener('click', function() {
        document.querySelectorAll('.theater-menu .sub-middle-menu .first-menu-item').forEach(el => {
            el.style.backgroundColor = '';
            el.style.borderWidth = '';
            el.style.borderStyle = '';
            el.style.borderColor = '';
        });
        item.style.backgroundColor = 'rgb(235, 235, 235)';
        item.style.borderWidth = '1px 0 1px 0';
        item.style.borderStyle = 'solid';
        item.style.borderColor = '#333';
    });
});



// 큐레이션탭의 영화 클릭 - 영화 타임테이블 표기
const alert3Element = document.querySelector('.alert-message'); // 표시할 요소를 선택하세요
document.querySelectorAll('.theater-menu .sub-middle-menu .second-menu-item').forEach(item => {
    item.addEventListener('click', function() {
        if (selectedItems.has(item)) {
            selectedItems.delete(item);
            item.style.backgroundColor = '';
            item.style.borderWidth = '';
            item.style.borderStyle = '';
            item.style.borderColor = '';
        } else {
            if (selectedItems.size < maxSelection) {
                selectedItems.add(item);
                item.style.backgroundColor = 'rgb(102, 102, 102)';
            } else {
                alert3Element.style.display = 'block';
            }
        }
        const timeEl = document.querySelector('.time-menu .bottom-main')
        timeEl.style.display = 'none'
        const movieEl = document.querySelector('.time-menu .movie-time')
        movieEl.style.display = 'block'
    });
});

//특별관 클릭 - 영화 타임테이블 표기
const alert4Element = document.querySelector('.alert-message'); // 표시할 요소를 선택하세요
document.querySelectorAll('.theater-menu .sub-middleSecond-menu .second-menu-item').forEach(item => {
    item.addEventListener('click', function() {
        if (selectedItems.has(item)) {
            selectedItems.delete(item);
            item.style.backgroundColor = '';
            item.style.borderWidth = '';
            item.style.borderStyle = '';
            item.style.borderColor = '';
        } else {
            if (selectedItems.size < maxSelection) {
                selectedItems.add(item);
                item.style.backgroundColor = 'rgb(102, 102, 102)';
            } else {
                alert4Element.style.display = 'block';
            }
        }
        const timeEl = document.querySelector('.time-menu .bottom-main')
        timeEl.style.display = 'none'
        const movieEl = document.querySelector('.time-menu .movie-time')
        movieEl.style.display = 'block'
    });
});

//컨트리를 누르면 로케이션 이름을 표기하는 프로세스 (SungGeun)ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
var location1 = document.querySelectorAll('.contry');
location1.forEach(function(checkLocation) {
    checkLocation.addEventListener('click', function() {
        var locationName = this.querySelector('.contry_name').textContent;
        console.log('locationName:', locationName);
       	
       	var divClassName = null;
       	
        switch (locationName){
			case "서울":
				divClassName = ".seoul-area";
				break;
			case "경기":
				divClassName = ".gyeonggi-area";
				break;
			case "인천":
				divClassName = ".incheon-area";
				break;
			case "대전/충청/세종":
				divClassName = ".daejeon-area";
				break;
			case "부산/대구/경상":
				divClassName = ".busan-area";
				break;
			case "광주/전라":
				divClassName = ".gwangju-area";
				break;
			case "강원":
				divClassName = ".gangwon-area";
				break;
			case "제주":
				divClassName = ".jeju-area";
				break;
		};
        
        $.ajax({
            url: 'getLocation.jsp',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',       
            type: 'POST',
            data: 'locationText=' + encodeURIComponent(locationName), // URL 인코딩
            success: function(response) {
                console.log('location1 response', response);
                
                // response가 이미 JSON 객체로 파싱된 상태일 수 있습니다.
                // 확인 후 JSON 파싱을 시도합니다.
                var jsonResponse;
                if (typeof response === 'string') {
                    try {
                        jsonResponse = JSON.parse(response);
                    } catch (e) {
                        console.error('Failed to parse JSON:', e);
                        return;
                    }
                    console.log('parsing')
                } else {
                    jsonResponse = response;
                    console.log('no parsing')
                }

                // "locations" 키에서 데이터 추출
                var data = jsonResponse.locations;

                if (!Array.isArray(data)) {
                    console.error('Expected an array but received:', data);
                    console.log("test : is not Array")
                    return;
                }
                console.log("test : it is Array")
                
                var container = document.querySelector(divClassName); // HTML을 삽입할 대상 클래스
                
                // 기존 내용 제거
                container.innerHTML = '';
    
                // 데이터 배열을 반복하여 HTML 생성
                data.forEach(function(item) {
                    var divElement = document.createElement('div'); // 새로운 div 요소 생성
    				divElement.classList.add('second-menu-item');
    				
    
                    var pElement = document.createElement('p'); // 새로운 p 요소 생성
    				pElement.classList.add('contry_location');
                    pElement.textContent = item; // p 태그의 텍스트 설정
    
                    // div 요소에 p 태그 추가
                    divElement.appendChild(pElement);
    
                    // container에 div 요소 추가
                    container.appendChild(divElement);
                	console.log("Server response:", item);
                });
                
            },
            error: function(error) {
                // 요청 실패 시 처리할 로직을 작성합니다.
                console.log("Error:", error);
            }
        });
    });
});