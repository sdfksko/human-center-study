let swiper = new Swiper(".boutiqueSwiper", {
  slidesPerView: 12,
  pagination: {
    el: ".swiper-pagination",
    type: "fraction",
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
});

document.addEventListener("DOMContentLoaded", function() {
        const swiper = new Swiper('.movieSwiper', {
            navigation: {
                nextEl: '.swiper-button-next.movie',
                prevEl: '.swiper-button-prev.movie',
            },
            slidesPerView: 5,
            spaceBetween: 10,
            loop: true,
        });
		
    });

let coin = 0;

const slide = document.querySelectorAll(".swiper-slide.calendar");
let slideIdx=0;
let month = new Date().getMonth()+1; // 월
let day=0; //일 
let dayOfWeek=''; //요일
slide.forEach((item,index)=>{
  if(index==0){
    item.classList.add("selected");
  }
  item.addEventListener("click",function(){
    slide[slideIdx].classList.remove("selected");
    this.classList.add("selected");
    day=(this.children[0].textContent);
    dayOfWeek = this.children[1].textContent;
    const today_day=new Date().getDate();
    if(today_day>day){
		month++;
	}
    slideIdx=index;
    coin ++
    console.log(coin);
  })
})
const packageButton = document.querySelector(".package-button");
packageButton.addEventListener("click",function(){
  if(this.textContent=='상품 더보기'){
    document.querySelector(".package-wrap").style.height=1000+'px';
    this.textContent='상품 접기';
  }else{
    document.querySelector(".package-wrap").style.height=700+'px';
    this.textContent='상품 더보기';
  }
})

let koex = '코엑스 더 부티크 ';

function firstShow() {
	const firstRoom = document.querySelector('.reserve-location .room1');
	const secondRoom = document.querySelector('.reserve-location .room2');
	const firstPEl = document.querySelector('.reserve-location .room1 p').innerHTML;
	const theaterEl = document.querySelector('#selectTheabNo span:last-child');
	const moneyEl = document.querySelector('.total em');
	
	
	secondRoom.style.color = '';
	secondRoom.style.backgroundColor = '';
	firstRoom.style.color = '#fff';
	firstRoom.style.backgroundColor = '#503396';
	theaterEl.innerHTML = koex + firstPEl;
	moneyEl.innerHTML = '600,000';
	
	document.querySelector('.reserve-date-box .item:first-child').innerHTML = '10:00';
	document.querySelector('.reserve-date-box .item:nth-child(2)').innerHTML = '14:00';
	document.querySelector('.reserve-date-box .item:nth-child(3)').innerHTML = '18:00';
	document.querySelector('.reserve-date-box .item:last-child').innerHTML = '22:00';
}

function secondShow() {
	const firstRoom = document.querySelector('.reserve-location .room1');
	const secondRoom = document.querySelector('.reserve-location .room2');
	const firstPEl = document.querySelector('.reserve-location .room2 p').innerHTML;
	const theaterEl = document.querySelector('#selectTheabNo span:last-child');
	const moneyEl = document.querySelector('.total em');
	
	
	secondRoom.style.color = '#fff';
	secondRoom.style.backgroundColor = '#503396';
	firstRoom.style.color = '';
	firstRoom.style.backgroundColor = '';
	theaterEl.innerHTML = koex + firstPEl;
	moneyEl.innerHTML = '500,000';
	
	document.querySelector('.reserve-date-box .item:first-child').innerHTML = '09:00';
	document.querySelector('.reserve-date-box .item:nth-child(2)').innerHTML = '13:00';
	document.querySelector('.reserve-date-box .item:nth-child(3)').innerHTML = '17:00';
	document.querySelector('.reserve-date-box .item:last-child').innerHTML = '21:00';
}

 document.addEventListener('DOMContentLoaded', () => {
        const firstRoom = document.querySelector('.reserve-location .room1');
        firstRoom.style.color = '#fff';
        firstRoom.style.backgroundColor = '#503396';
});

let timeButton = null;
let year = new Date().getFullYear();

const timesEl = document.querySelectorAll('.reserve-date-box .item');
timesEl.forEach(function(timeEl) {
	timeEl.addEventListener('click', function() {
		
		if(timeButton && timeButton !== this) {
			timeButton.style.backgroundColor = '';
			timeButton.style.color = '#666';
		}
		if (this.style.backgroundColor !== '#503396' && this.style.color !== '#fff') {
			this.style.backgroundColor = '#503396';
			this.style.color = '#fff';
			timeButton = this;
		} else {
			this.style.backgroundColor = '';
			this.style.color = '#666';
			timeButton = null;
		}
		console.log(timeButton);
		console.log(coin);
		const aaa = document.querySelector('#selectTime span:last-child').innerHTML;
		console.log(aaa)
		if (timeButton != null && coin > 0) {
			document.querySelector('#selectTime span:last-child').innerHTML = year.toString() + ' ' + '0' + month + ' ' + day + ' ' + this.innerHTML;
		}
	});
});




		
const reserveButtons = document.querySelectorAll('.reserve-movie-button');
let lastSelectedButton = null;

reserveButtons.forEach(button => {
    button.addEventListener('click', function() {
        // 숨겨진 input 요소에서 영화 정보 가져오기
        const movieName = this.parentElement.querySelector('.movie-name').value;
        const movieImage = this.parentElement.querySelector('.movie-image').value;

        // 선택된 영화 정보로 결제 화면 업데이트
        document.getElementById('smallImage').src = movieImage;
        document.getElementById('smallImage').alt = movieName;
        document.getElementById('movieTitle').innerText = movieName;

        
        if (lastSelectedButton && lastSelectedButton !== this) {
            lastSelectedButton.style.backgroundColor = '';
            lastSelectedButton.style.color = '#444';
        }

        if(this.style.backgroundColor !== '#503396' && this.style.color !== '#fff') {
            this.style.backgroundColor = '#503396';
            this.style.color = '#fff';
            lastSelectedButton = this; // 현재 버튼을 이전 버튼으로 저장
        } else {
            this.style.backgroundColor = '';
            this.style.color = '#444';
            lastSelectedButton = null; // 선택 해제 시 이전 버튼을 null로 초기화
        }
    });
});

const payEl = document.querySelector('.payment-button');                 				

payEl.addEventListener('click', function() {
	alert('결제가 완료되었습니다');
	location.href='./main.jsp';
})