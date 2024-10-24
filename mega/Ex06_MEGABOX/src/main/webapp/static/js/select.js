const homeMenuEl = document.querySelector('main .home-menu');
window.addEventListener('scroll', _.throttle(() => {

    if (window.scrollY < 100) {
        gsap.to(homeMenuEl, {duration: 0, opacity: 0, display: 'none'});
    } else {
        gsap.to(homeMenuEl, {duration: 0, opacity: 1, display: 'block'});
    }
}));


function closeScreen() {
    const screenEl = document.querySelector('.select-people .bottom-menu .screen')
    screenEl.style.display = 'none';
};

let adultNumber = 0;
let teenagerNumber = 0;
let routeNumber = 0;
let bestNumber = 0;
let totalNumber = 0;
let type;
const addEl = document.querySelector('.select-people .bottom-menu .top .item .math .add');
const subtractEl = document.querySelector('.select-people .bottom-menu .top .item .math .subtract');
const numberEl = document.querySelector('.select-people .bottom-menu .top .item .math .number p');
const screenEl = document.querySelector('.select-people .bottom-menu .screen')
const mainAreaEls = document.querySelectorAll('.seat-sub-area .area-number');

// 인원 관련 함수
addEl.addEventListener('click', function() {
    if(totalNumber == 8) {
        const selectPopEl = document.querySelector('main .select-pop-up');
        const completePopEl = document.querySelector('main .complete-pop');
        selectPopEl.style.display = 'block'
        completePopEl.style.display = 'block'
        return;
    }
    let firstNumber = parseInt(numberEl.textContent, 10);
    adultNumber += 1;
    type='adult';
    firstNumber += 1;
    totalNumber += 1;
    numberEl.textContent = firstNumber;
    screenEl.style.display = 'none';
    console.log("adultNumber: " + adultNumber);
});

subtractEl.addEventListener('click', function() {
    let conditionMet = false;

    mainAreaEls.forEach(function(mainAreaEl) {
        if(mainAreaEl.style.backgroundColor === 'rgb(80, 51, 150)' && adultNumber > 0) {
            const selectPopEl = document.querySelector('main .select-pop-up');
            const cancelPopEl = document.querySelector('main .cancel-pop');
            selectPopEl.style.display = 'block';
            cancelPopEl.style.display = 'block';
            conditionMet = 'true'
        }    
    });

    if (conditionMet) {
        return;
    }

    let secondNumber = parseInt(numberEl.textContent, 10);
    if (secondNumber > 0) {
        adultNumber -= 1;
        secondNumber -= 1;
        totalNumber -= 1;
        numberEl.textContent = secondNumber;
        
    } else {

    }
    screenEl.style.display = 'none';
    console.log("adultNumber: " + adultNumber);
});



const addEl2 = document.querySelector('.select-people .bottom-menu .top .item2 .math .add');
const subtractEl2 = document.querySelector('.select-people .bottom-menu .top .item2 .math .subtract');
const numberEl2 = document.querySelector('.select-people .bottom-menu .top .item2 .math .number p');


addEl2.addEventListener('click', function() {
    if(totalNumber == 8) {
        const selectPopEl = document.querySelector('main .select-pop-up');
        const completePopEl = document.querySelector('main .complete-pop');
        selectPopEl.style.display = 'block'
        completePopEl.style.display = 'block'
        return;
    }
    let firstNumber = parseInt(numberEl2.textContent, 10);
    teenagerNumber += 1;
    type='teenager';
    firstNumber += 1;
    totalNumber += 1;
    numberEl2.textContent = firstNumber;
    screenEl.style.display = 'none';
    console.log("teenagerNumber: " + teenagerNumber);
});

subtractEl2.addEventListener('click', function() {
    let conditionMet = false;

    mainAreaEls.forEach(function(mainAreaEl) {
        if(mainAreaEl.style.backgroundColor === 'rgb(80, 51, 150)' && teenagerNumber > 0) {
            const selectPopEl = document.querySelector('main .select-pop-up');
            const cancelPopEl = document.querySelector('main .cancel-pop');
            selectPopEl.style.display = 'block';
            cancelPopEl.style.display = 'block';
            conditionMet = 'true'
        }    
    });

    if (conditionMet) {
        return;
    }
    
    let secondNumber = parseInt(numberEl2.textContent, 10);
    if (secondNumber > 0) {
        teenagerNumber -= 1;
        secondNumber -= 1;
        totalNumber -= 1;
        numberEl2.textContent = secondNumber;
        
    } else {

    }
    screenEl.style.display = 'none';
    console.log("teenagerNumber: " + teenagerNumber);
});

const addEl3 = document.querySelector('.select-people .bottom-menu .top .item3 .math .add');
const subtractEl3 = document.querySelector('.select-people .bottom-menu .top .item3 .math .subtract');
const numberEl3 = document.querySelector('.select-people .bottom-menu .top .item3 .math .number p');
    

addEl3.addEventListener('click', function() {
    if(totalNumber == 8) {
        const selectPopEl = document.querySelector('main .select-pop-up');
        const completePopEl = document.querySelector('main .complete-pop');
        selectPopEl.style.display = 'block'
        completePopEl.style.display = 'block'
        return;
    }
    let firstNumber = parseInt(numberEl3.textContent, 10);
    routeNumber += 1;
    type='route';
    firstNumber += 1;
    totalNumber += 1;
    numberEl3.textContent = firstNumber;
    screenEl.style.display = 'none';
    console.log("routeNumber: " + routeNumber);
});

subtractEl3.addEventListener('click', function() {
    let conditionMet = false;

    mainAreaEls.forEach(function(mainAreaEl) {
        if(mainAreaEl.style.backgroundColor === 'rgb(80, 51, 150)' && routeNumber > 0) {
            const selectPopEl = document.querySelector('main .select-pop-up');
            const cancelPopEl = document.querySelector('main .cancel-pop');
            selectPopEl.style.display = 'block';
            cancelPopEl.style.display = 'block';
            conditionMet = 'true'
        }    
    });

    if (conditionMet) {
        return;
    }

    let secondNumber = parseInt(numberEl3.textContent, 10);
    if (secondNumber > 0) {
        routeNumber -= 1;
        secondNumber -= 1;
        totalNumber -= 1;
        numberEl3.textContent = secondNumber;
        
    } else {

    }
    screenEl.style.display = 'none';
    console.log("routeNumber: " + routeNumber);
});



const addEl4 = document.querySelector('.select-people .bottom-menu .top .item4 .math .add');
const subtractEl4 = document.querySelector('.select-people .bottom-menu .top .item4 .math .subtract');
const numberEl4 = document.querySelector('.select-people .bottom-menu .top .item4 .math .number p');

addEl4.addEventListener('click', function() {
    if(totalNumber == 8) {
        const selectPopEl = document.querySelector('main .select-pop-up');
        const completePopEl = document.querySelector('main .complete-pop');
        selectPopEl.style.display = 'block'
        completePopEl.style.display = 'block'
        return;
    }
    let firstNumber = parseInt(numberEl4.textContent, 10);
    bestNumber += 1;
    type='best';
    firstNumber += 1;
    totalNumber += 1;
    numberEl4.textContent = firstNumber;
    screenEl.style.display = 'none';
    console.log("bestNumber: " + bestNumber);
});

subtractEl4.addEventListener('click', function() {
    let conditionMet = false;

    mainAreaEls.forEach(function(mainAreaEl) {
        if(mainAreaEl.style.backgroundColor === 'rgb(80, 51, 150)' && bestNumber > 0) {
            const selectPopEl = document.querySelector('main .select-pop-up');
            const cancelPopEl = document.querySelector('main .cancel-pop');
            selectPopEl.style.display = 'block';
            cancelPopEl.style.display = 'block';
            conditionMet = 'true'
        }    
    });

    if (conditionMet) {
        return;
    }

    let secondNumber = parseInt(numberEl4.textContent, 10);
    if (secondNumber > 0) {
        bestNumber -= 1;
        secondNumber -= 1;
        totalNumber -= 1;
        numberEl4.textContent = secondNumber;
        
    } else {

    }
    screenEl.style.display = 'none';
    console.log("bestNumber: " + bestNumber);
});
//


const areaNumbers = document.querySelectorAll('.select-people .bottom-menu .bottom .seat-sub-area .area-number');
const selectPopEl = document.querySelector('main .select-pop-up');
const subPopEl = document.querySelector('main .sub-pop');
const seatPopEl = document.querySelector('main .seat-pop');
const moneyEl = document.querySelector('.money p:first-child');
const seatItems = document.querySelectorAll('.seat-menu .seat-item p');
const nextEl = document.querySelector('.next');

// 사람 유형 엘리먼트를 가져오고 처음에는 숨김
const peopleTypeEls = document.querySelectorAll('.people-menu .people-type');

// 사람 유형 텍스트 업데이트 함수
function updatePeopleTypeText() {
    peopleTypeEls.forEach(function(el, index) {
        const type = Object.keys(counts)[index];
        const count = counts[type];
        const textEl = el.querySelector('p');
        if (count > 0) {
            textEl.innerHTML = `${peopleTypes[type]} ${count}`;
            el.style.display = 'block'; // 값이 있을 때만 보임
        } else {
            el.style.display = 'none'; // 값이 없을 때 숨김
        }
    });
}

// function updateSeatItems() {
//     // 모든 seat-item을 초기화
//     seatItems.forEach((seatItem, index) => {
//         seatItem.parentElement.removeAttribute('id');
//         seatItem.innerHTML = '-';
//     });

//     // 선택된 좌석 번호를 할당
//     let seatIndex = 0;
//     areaNumbers.forEach((areaNumberEl, index) => {
//         const currentColor = window.getComputedStyle(areaNumberEl).backgroundColor;
//         if (currentColor === 'rgb(80, 51, 150)') {
//             seatItems[seatIndex].innerHTML = (index + 1);
//             seatItems[seatIndex].parentElement.setAttribute('id', 'selected');
//             seatIndex++;
//         }
//     });
// }

const selectedSeats = []; // 클릭한 순서대로 좌석을 저장할 배열

// 좌석을 업데이트하는 함수
function updateSeatItems() {
    // 모든 seat-item을 초기화
    seatItems.forEach((seatItem) => {
        seatItem.parentElement.removeAttribute('id');
        seatItem.innerHTML = '-';
    });

    // 선택된 좌석 번호를 클릭 순서대로 할당
    selectedSeats.forEach((areaNumberEl, seatIndex) => {
        const index = Array.prototype.indexOf.call(areaNumbers, areaNumberEl);
        seatItems[seatIndex].innerHTML = (index + 1);
        seatItems[seatIndex].parentElement.setAttribute('id', 'selected');
    });
};

// 좌석이 선택되었을 때 실행되는 함수
function enableNextButton() {
    nextEl.style.backgroundColor = 'rgb(50, 158, 177)';
    nextEl.style.cursor = 'pointer';
    nextEl.addEventListener('click', goToNextPage);
};

// 좌석이 선택되지 않았을 때 실행되는 함수
function disableNextButton() {
    nextEl.style.backgroundColor = 'rgb(224, 224, 224)';
    nextEl.style.cursor = 'default';
    nextEl.removeEventListener('click', goToNextPage);
};

// 다음 페이지로 이동하는 함수
function goToNextPage() {
	let movieName = sessionStorage.getItem("movieName");
	axios.post('/Ex06_MEGABOX/main/payProcess.jsp',{
		adultNumber,
		teenagerNumber,
		routeNumber,
		'movieName' : ''+movieName
	})
	.then(()=>{
	    window.location.href = '../main/pay.jsp';
		
	}).catch(error=>console.log(error));
};

// 좌석이 선택될 때마다 버튼 상태를 업데이트하는 함수
function updateNextButton() {
    if (total > 0) {
        enableNextButton();
    } else {
        disableNextButton();
    }
};

let selectNumber = 0;
let total = 0;
let counts = {
    adult: 0,
    teenager: 0,
    route: 0,
    best: 0
};

const prices = {
    adult: 12000,
    teenager: 9000,
    route: 5000,
    best: 3000
};

const peopleTypes = {
    adult: '성인',
    teenager: '청소년',
    route: '경로',
    best: '우대'
};


// 좌석선택 관련 함수
areaNumbers.forEach(function(areaNumberEl) {
    areaNumberEl.style.backgroundColor = '#333';

    areaNumberEl.addEventListener('click', function() {
        const currentColor = window.getComputedStyle(areaNumberEl).backgroundColor;

        if (totalNumber == 0) {
            selectPopEl.style.display = 'block';
            subPopEl.style.display = 'block';
        } else {
            if (currentColor === 'rgb(51, 51, 51)') {
                if (selectNumber < totalNumber) {
                    areaNumberEl.style.backgroundColor = 'rgb(80, 51, 150)';
                    selectNumber++;

                    if (counts.adult < adultNumber) {
                        counts.adult++;
                        total += prices.adult;
                        areaNumberEl.children[0].setAttribute("id", "adult");
                    } else if (counts.teenager < teenagerNumber) {
                        counts.teenager++;
                        total += prices.teenager;
                        areaNumberEl.children[0].setAttribute("id", "teenager");
                    } else if (counts.route < routeNumber) {
                        counts.route++;
                        total += prices.route;
                        areaNumberEl.children[0].setAttribute("id", "route");
                    } else if (counts.best < bestNumber) {
                        counts.best++;
                        total += prices.best;
                        areaNumberEl.children[0].setAttribute("id", "best");
                    }
                    selectedSeats.push(areaNumberEl); // 클릭한 좌석을 배열에 추가
                    updatePeopleTypeText(); // 사람 유형 텍스트 업데이트
                } else {
                    selectPopEl.style.display = 'block';
                    seatPopEl.style.display = 'block';
                }
            } else if (currentColor === 'rgb(80, 51, 150)') {
                areaNumberEl.style.backgroundColor = '#333';
                selectNumber--;

                if (areaNumberEl.children[0].id === 'best') {
                    counts.best--;
                    total -= prices.best;
                    areaNumberEl.children[0].removeAttribute("id");
                } else if (areaNumberEl.children[0].id === 'route') {
                    counts.route--;
                    total -= prices.route;
                    areaNumberEl.children[0].removeAttribute("id");
                } else if (areaNumberEl.children[0].id === 'teenager') {
                    counts.teenager--;
                    total -= prices.teenager;
                    areaNumberEl.children[0].removeAttribute("id");
                } else if (areaNumberEl.children[0].id === 'adult') {
                    counts.adult--;
                    total -= prices.adult;
                    areaNumberEl.children[0].removeAttribute("id");
                }
                 // 클릭 해제된 좌석을 배열에서 제거
                 const index = selectedSeats.indexOf(areaNumberEl);
                 if (index > -1) {
                     selectedSeats.splice(index, 1);
                 }
                updatePeopleTypeText(); // 사람 유형 텍스트 업데이트
            }

            document.querySelector('.payment-money>div>p').textContent = total.toLocaleString();
            
        }
        updateSeatItems(); // 선택된 좌석 업데이트
        console.log("totalNumber: " + totalNumber);
        console.log("selectNumber: " + selectNumber);
        console.log("money: " + moneyEl);
        updateNextButton(); // 버튼 상태 업데이트
    });
});


//팝업창 관련 함수 
function closeSubPop() {
    const selectPopEl = document.querySelector('main .select-pop-up');
    const subPopEl = document.querySelector('main .sub-pop');

    selectPopEl.style.display = 'none';
    subPopEl.style.display = 'none';
};

function closeSeatPop() {
    const selectPopEl = document.querySelector('main .select-pop-up');
    const seatPopEl = document.querySelector('main .seat-pop');

    selectPopEl.style.display = 'none';
    seatPopEl.style.display = 'none';
};

function closeCancelPop() {
    const selectPopEl = document.querySelector('main .select-pop-up');
    const cancelPopEl = document.querySelector('main .cancel-pop');
    selectPopEl.style.display = 'none';
    cancelPopEl.style.display = 'none';
};

function closeCompletePop() {
    const selectPopEl = document.querySelector('main .select-pop-up');
    const completePopEl = document.querySelector('main .complete-pop');
    selectPopEl.style.display = 'none';
    completePopEl.style.display = 'none';
};
//


function reset() {
    location.reload();
    
};


document.addEventListener("DOMContentLoaded",function(){
	let movieName = sessionStorage.getItem("movieName");
	let div = document.querySelector(".info image");
	document.querySelector(".info").children[0].children[0].textContent=movieName;
	axios.get('allMovieIdxMovieName.jsp?name='+movieName)
	.then(response=>{
		console.log(response.data);
		$(".movie-image").html($("<img src='"+response.data[0].image+"'/>"));
	})
})