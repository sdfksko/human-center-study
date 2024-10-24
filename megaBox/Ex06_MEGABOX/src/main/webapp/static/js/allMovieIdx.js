const movieMain = document.querySelectorAll(".movie-main .title .title-list");
let movieMainIdx = 0;
movieMain.forEach((item, index) => {
	item.addEventListener("click", function() {
		movieMain[movieMainIdx].children[0].style.border = "none";
		movieMain[movieMainIdx].children[0].style.borderBottom = "1px solid #503396";
		movieMain[movieMainIdx].children[1].style.display = 'none';
		this.children[0].style.border = "1px solid #503396";
		this.children[0].style.borderBottom = "none";
		this.children[1].style.display = 'block';
		movieMainIdx = index;

	})
})
function review_insert(name,movieIdx) {
	if (name == null || name == '') {
		alert("로그인후 이용가능합니다.");
		return false;
	}
	location.href = 'writeForm.jsp?movieIdx='+movieIdx;
}
function debounce(func, timeout) {
	let timer;
	return (...args) => {
		clearTimeout(timer);
		timer = setTimeout(() => {
			func.apply(this, args);
		}, timeout);
	};
}
const debounceUpdate = debounce(reviewRankDiv, 500);
function updateType(type, reviewIdx, span) {
	axios.get('reviewType.jsp?type=' + type + '&reviewIdx=' + reviewIdx)
		.then(response => {
			$(span).text(response.data.reviewLike);
		}).catch(error => console.log(error));
}
const reviewLike = document.querySelectorAll(".review-like img");
reviewLike.forEach(item => {
	item.addEventListener("click", function() {
		const reviewIdx = this.nextElementSibling.value;
		let span = this.parentNode.children[2];
		if (this.getAttribute("src").includes("ico-like-g.png")) {
			this.setAttribute("src", "https://img.megabox.co.kr/static/pc/images/common/ico/ico-like-b.png");
			updateType('plus', reviewIdx, span);
		} else {
			this.setAttribute("src", "https://img.megabox.co.kr/static/pc/images/common/ico/ico-like-g.png");
			updateType('minus', reviewIdx, span);
		}
	})

})
function updateReview(e, reviewIdx) {
	const span = (e.currentTarget.parentNode.children[2]);
	if (e.currentTarget.getAttribute("src").includes("ico-like-g.png")) {
		e.currentTarget.setAttribute("src", "https://img.megabox.co.kr/static/pc/images/common/ico/ico-like-b.png");
		updateType('plus', reviewIdx, span);
	} else {
		e.currentTarget.setAttribute("src", "https://img.megabox.co.kr/static/pc/images/common/ico/ico-like-g.png");
		updateType('minus', reviewIdx, span);
	}
}


const reviewRank = document.querySelectorAll(".review-rank .review-item");
let reviewRankIdx = 0;
reviewRank.forEach((item, index) => {
	item.addEventListener("click", function() {
		reviewRank[reviewRankIdx].classList.remove("selected");
		this.classList.add("selected");
		if (this.textContent == '최신순') debounceUpdate('recently');
		else if (this.textContent == '공감순') debounceUpdate('reviewLike');
		else debounceUpdate('movieLike');
		reviewRankIdx = index;
	})
})

function reviewRankDiv(type) {
	const movieIdx = document.querySelector("#movieIdx").value;
	let div = $("<div></div>");
	axios.get(`reviewControl.jsp?type=${type}&movieRef=${movieIdx}`)
		.then(response => {
			const data = response.data;
			data.forEach(it => {
				let reviewMain = $("<div class='review-main'/></div>");
				reviewMain.append($("<div class='review-img'/><img src='https://img.megabox.co.kr/static/pc/images/mypage/bg-profile.png'/><p>" + it.userId + "</p></div>"));
				reviewMain.append($("<div class='review-rate'>관람평</div>"));
				reviewMain.append($("<div class='review-rate number'>" + it.movieLike + "</div>"));
				reviewMain.append($("<div class='review-content'>" + it.title + "</div>"));
				let reviewLike = $("<div class='review-like'></div>");
				reviewLike.append($("<img src='https://img.megabox.co.kr/static/pc/images/common/ico/ico-like-g.png' onclick='updateReview(event," + it.reviewIdx + ")'>"));
				reviewLike.append($("<input type='hidden' id='idx' value=" + it.reviewIdx + "/>"));
				reviewLike.append($("<span class='review-like-value'>" + it.reviewLike + "</span>"));
				reviewMain.append(reviewLike);
				div.append(reviewMain);
			})
			$("#resultDiv").html(div);
		})
		.catch(error => console.log(error));
}