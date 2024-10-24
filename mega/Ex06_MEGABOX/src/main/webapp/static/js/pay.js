function sTo() {
    const startY = window.scrollY;
    const endY = 0;
    const duration = 300; // 애니메이션 지속 시간 (밀리초)
    const startTime = performance.now();

    function animateScroll(currentTime) {
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);
        const ease = progress * (2 - progress); // Ease-out 효과

        window.scrollTo(0, startY + (endY - startY) * ease);

        if (progress < 1) {
            requestAnimationFrame(animateScroll);
        }
    }

    requestAnimationFrame(animateScroll);
}

const topEl = document.querySelector('main > .top');
window.addEventListener('scroll', _.throttle(() => {
    console.log('scrollY:', window.scrollY);

    if (window.scrollY < 300) {
        gsap.to(topEl, .5, {opacity: 0, display: 'none'});
    } else {
        gsap.to(topEl, .5, {opacity: 1, display: 'block'});
    }
}, 200));


function firstShow() {
    const firstMainEl = document.querySelector('.discount .discount-select-menu .select-main .first-main p');
    const secondMainEl = document.querySelector('.discount .discount-select-menu .select-main .second-main p')
    const firstSubEl = document.querySelector('.discount .discount-select-menu .select-sub .first-sub');
    const secondSubEl = document.querySelector('.discount .discount-select-menu .select-sub .second-sub');
    firstMainEl.style.backgroundColor = '#fff';
    firstMainEl.style.color = '#222';
    firstMainEl.style.fontWeight = 600;
    secondMainEl.style.backgroundColor = '';
    secondMainEl.style.color = '#666';
    secondMainEl.style.fontWeight = '';
    firstSubEl.style.display = 'block';
    secondSubEl.style.display = 'none'
};

function secondShow() {
    const firstMainEl = document.querySelector('.discount .discount-select-menu .select-main .first-main p');
    const secondMainEl = document.querySelector('.discount .discount-select-menu .select-main .second-main p')
    const firstSubEl = document.querySelector('.discount .discount-select-menu .select-sub .first-sub');
    const secondSubEl = document.querySelector('.discount .discount-select-menu .select-sub .second-sub');
    firstMainEl.style.backgroundColor = '';
    firstMainEl.style.color = '#666';
    firstMainEl.style.fontWeight = '';
    secondMainEl.style.backgroundColor = '#fff';
    secondMainEl.style.color = '#222';
    secondMainEl.style.fontWeight = '600';
    firstSubEl.style.display = 'none';
    secondSubEl.style.display = 'block'
};

function cardPay() {
    const firstChildEl = document.querySelector('.settlement-method .set-item:first-child');
    const firstChildP = firstChildEl.querySelector('p');
    const secondChildEl = document.querySelector('.settlement-method .set-item:nth-child(2)');
    const secondChildP = secondChildEl.querySelector('p');
    const thirdChildEl = document.querySelector('.settlement-method .set-item:nth-child(3)');
    const thirdChildP = thirdChildEl.querySelector('p');
    const fourthChildEl = document.querySelector('.settlement-method .set-item:nth-child(4)');
    const fourthChildP = fourthChildEl.querySelector('p');
    const cardSelectEl = document.querySelector('.bottom-menu .card-select');
    const easySelectEl = document.querySelector('.bottom-menu .easy-select');
    const phoneSelectEl = document.querySelector('.bottom-menu .phone-select');
    const bankSelectEl = document.querySelector('.bottom-menu .bank-select');
    const agreementEl = document.querySelector('.bottom-menu .agreement');
    const mainEl = document.querySelector('main');


    firstChildEl.style.border = '1px solid #6437bf';
    firstChildP.style.color = '#6437bf';
    secondChildEl.style.border = '';
    secondChildP.style.color = '';
    thirdChildEl.style.border = '';
    thirdChildP.style.color = '';
    fourthChildEl.style.border = '';
    fourthChildP.style.color = '';

    cardSelectEl.style.display = 'block';
    cardSelectEl.style.display = 'flex';
    easySelectEl.style.display = 'none'
    phoneSelectEl.style.display = 'none'
    bankSelectEl.style.display = 'none'
    agreementEl.style.display = 'none'

    if(agreementEl.style.display === 'none') {
        mainEl.style.height = '1600px';
    } else {
        mainEl.style.height = '1900px';
    }
}

function easyPay() {
    const firstChildEl = document.querySelector('.settlement-method .set-item:first-child');
    const firstChildP = firstChildEl.querySelector('p');
    const secondChildEl = document.querySelector('.settlement-method .set-item:nth-child(2)');
    const secondChildP = secondChildEl.querySelector('p');
    const thirdChildEl = document.querySelector('.settlement-method .set-item:nth-child(3)');
    const thirdChildP = thirdChildEl.querySelector('p');
    const fourthChildEl = document.querySelector('.settlement-method .set-item:nth-child(4)');
    const fourthChildP = fourthChildEl.querySelector('p');
    const cardSelectEl = document.querySelector('.bottom-menu .card-select');
    const easySelectEl = document.querySelector('.bottom-menu .easy-select');
    const phoneSelectEl = document.querySelector('.bottom-menu .phone-select');
    const bankSelectEl = document.querySelector('.bottom-menu .bank-select');
    const agreementEl = document.querySelector('.bottom-menu .agreement');
    const mainEl = document.querySelector('main');

    firstChildEl.style.border = '';
    firstChildP.style.color = '';
    secondChildEl.style.border = '1px solid #6437bf';
    secondChildP.style.color = '#6437bf';
    thirdChildEl.style.border = '';
    thirdChildP.style.color = '';
    fourthChildEl.style.border = '';
    fourthChildP.style.color = '';

    cardSelectEl.style.display = 'none';
    easySelectEl.style.display = 'block'
    phoneSelectEl.style.display = 'none'
    bankSelectEl.style.display = 'none'
    agreementEl.style.display = 'block'

    if(agreementEl.style.display === 'none') {
        mainEl.style.height = '1600px';
    } else {
        mainEl.style.height = '1900px';
    }
}

function phonePay() {
    const firstChildEl = document.querySelector('.settlement-method .set-item:first-child');
    const firstChildP = firstChildEl.querySelector('p');
    const secondChildEl = document.querySelector('.settlement-method .set-item:nth-child(2)');
    const secondChildP = secondChildEl.querySelector('p');
    const thirdChildEl = document.querySelector('.settlement-method .set-item:nth-child(3)');
    const thirdChildP = thirdChildEl.querySelector('p');
    const fourthChildEl = document.querySelector('.settlement-method .set-item:nth-child(4)');
    const fourthChildP = fourthChildEl.querySelector('p');
    const cardSelectEl = document.querySelector('.bottom-menu .card-select');
    const easySelectEl = document.querySelector('.bottom-menu .easy-select');
    const phoneSelectEl = document.querySelector('.bottom-menu .phone-select');
    const bankSelectEl = document.querySelector('.bottom-menu .bank-select');
    const agreementEl = document.querySelector('.bottom-menu .agreement');
    const mainEl = document.querySelector('main');

    firstChildEl.style.border = '';
    firstChildP.style.color = '';
    secondChildEl.style.border = '';
    secondChildP.style.color = '';
    thirdChildEl.style.border = '1px solid #6437bf';
    thirdChildP.style.color = '#6437bf';
    fourthChildEl.style.border = '';
    fourthChildP.style.color = '';

    cardSelectEl.style.display = 'none';
    easySelectEl.style.display = 'none'
    phoneSelectEl.style.display = 'block'
    bankSelectEl.style.display = 'none'
    agreementEl.style.display = 'none'

    if(agreementEl.style.display === 'none') {
        mainEl.style.height = '1600px';
    } else {
        mainEl.style.height = '1900px';
    }
}

function bankPay() {
    const firstChildEl = document.querySelector('.settlement-method .set-item:first-child');
    const firstChildP = firstChildEl.querySelector('p');
    const secondChildEl = document.querySelector('.settlement-method .set-item:nth-child(2)');
    const secondChildP = secondChildEl.querySelector('p');
    const thirdChildEl = document.querySelector('.settlement-method .set-item:nth-child(3)');
    const thirdChildP = thirdChildEl.querySelector('p');
    const fourthChildEl = document.querySelector('.settlement-method .set-item:nth-child(4)');
    const fourthChildP = fourthChildEl.querySelector('p');
    const cardSelectEl = document.querySelector('.bottom-menu .card-select');
    const easySelectEl = document.querySelector('.bottom-menu .easy-select');
    const phoneSelectEl = document.querySelector('.bottom-menu .phone-select');
    const bankSelectEl = document.querySelector('.bottom-menu .bank-select');
    const agreementEl = document.querySelector('.bottom-menu .agreement');
    const mainEl = document.querySelector('main');

    firstChildEl.style.border = '';
    firstChildP.style.color = '';
    secondChildEl.style.border = '';
    secondChildP.style.color = '';
    thirdChildEl.style.border = '';
    thirdChildP.style.color = '';
    fourthChildEl.style.border = '1px solid #6437bf';
    fourthChildP.style.color = '#6437bf';

    cardSelectEl.style.display = 'none';
    easySelectEl.style.display = 'none'
    phoneSelectEl.style.display = 'none'
    bankSelectEl.style.display = 'block'
    agreementEl.style.display = 'none'

    if(agreementEl.style.display === 'none') {
        mainEl.style.height = '1600px';
    } else {
        mainEl.style.height = '1900px';
    }
}


function payment(){
	alert("결제가 완료되었습니다.");
	location.href="main.jsp";
}