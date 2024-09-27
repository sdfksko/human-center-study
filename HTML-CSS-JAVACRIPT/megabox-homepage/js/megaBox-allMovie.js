const topEl = document.querySelector('main .top');
window.addEventListener('scroll', _.throttle(() => {
    console.log('scrollY:', window.scrollY);

    if (window.scrollY < 300) {
        gsap.to(topEl, .5, {opacity: 0, display: 'none'});
    } else {
        gsap.to(topEl, .5, {opacity: 1, display: 'block'});
    }
}, 200));

const homeMenuEl = document.querySelector('main .home-menu');
window.addEventListener('scroll', _.throttle(() => {
    console.log('scrollY:', window.scrollY);

    if (window.scrollY < 100) {
        gsap.to(homeMenuEl, {duration: 0, opacity: 0, display: 'none'});
    } else {
        gsap.to(homeMenuEl, {duration: 0, opacity: 1, display: 'block'});
    }
}));

const menuTopEl = document.querySelector('main .menu-top');
window.addEventListener('scroll', _.throttle(() => {
    console.log('scrollY:', window.scrollY);

    if (window.scrollY < 260) {
        gsap.to(menuTopEl, {duration: 0, opacity: 0, display: 'none'});
    } else {
        gsap.to(menuTopEl, {duration: 0, opacity: 1, display: 'block'});
    }
}));

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