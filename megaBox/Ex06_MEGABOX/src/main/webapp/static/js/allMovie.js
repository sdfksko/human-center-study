const topEl = document.querySelector('main .top');
window.addEventListener('scroll', _.throttle(() => {

    if (window.scrollY < 300) {
        gsap.to(topEl, .5, {opacity: 0, display: 'none'});
    } else {
        gsap.to(topEl, .5, {opacity: 1, display: 'block'});
    }
}, 200));

const homeMenuEl = document.querySelector('main .home-menu');
window.addEventListener('scroll', _.throttle(() => {

    if (window.scrollY < 100) {
        gsap.to(homeMenuEl, {duration: 0, opacity: 0, display: 'none'});
    } else {
        gsap.to(homeMenuEl, {duration: 0, opacity: 1, display: 'block'});
    }
}));

const menuTopEl = document.querySelector('main .menu-top');
window.addEventListener('scroll', _.throttle(() => {

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

const moveView = document.querySelector("main .inner .show");
moveView.addEventListener('click',function(){
	let styleDiv = document.querySelector("main .inner .movie-box");
	let height = parseInt(window.getComputedStyle(styleDiv).height.slice(0,4));
	if(height>2000)this.style.display='none';
	styleDiv.style.height=height+1000+'px';
})

function debounce(func, timeout) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => {
      func.apply(this, args);
    }, timeout);
  };
}


const searchBox = document.querySelector(".search-box");
const debouncedSearch = debounce(() => {
  axios.get('allMovieIdxMovieName.jsp?name=' + searchBox.children[0].value)
    .then(response => {
		const data = response.data;
		if(data.length>10)location.href='allMovie.jsp';
		let div = $("<div class='movie-box'></div>");
		console.log(data);
		data.forEach(item=>{
			let movie = $("<div class='movie'></div>");
			let aTag = $("<a href='allMovieIdx.jsp?movieIdx="+item.movieIdx+"'></a>");
			let movieImg = $("<div class='movie-img'><img src='"+item.image+"'><div class='img-shadow'><div class='img-text'><p>"+item.content+"</p></div></div></div>");
			aTag.append(movieImg);
			let movieNameTag = $("<div class='movie-name'><p class='movie-age-19'>19</p></div>");
			let movieName = item.name.length>10?item.name.substring(0,10):item.name;
			movieNameTag.append($("<p class='title'>"+movieName+"</p>"));			
			let date = new Date(item.openingDate);
			let movieInformation = $("<div class='movie-information'><p class='rate'>예매율 22%</p><div class='and'></div></div>");
			movieInformation.append($("<p class='date'>개봉일 "+date.toLocaleDateString("ko-kr").slice(0,11)+"<p>"));
			
			let movieUtil = $("<div class='movie-util'><button><img src='../static/images/like.svg'><span class='movieLike'>"+item.movieLike+"</span></button></div>");
			movieUtil.append($("<a href='javascript void(0)'><div class='movie-ticketing'>예매</div></a>"));
			movie.append(aTag);
			movie.append(movieNameTag);
			movie.append(movieInformation);
			movie.append(movieUtil);
			div.append(movie);
		})
		$(".movie-box").html(div);
    })
    .catch(error => console.log(error));
}, 1000);

searchBox.children[1].addEventListener("click", function() {
  debouncedSearch(); // 반환된 함수를 호출
});
