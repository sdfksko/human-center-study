const category = document.querySelectorAll(".main-top .left .item");
let categoryIdx=0;
let type='movie';
let movieName='데드풀과 울버린';
let location_name='강남';
let currTime;
// 메인
category.forEach((item,index)=>{
    item.addEventListener('click',function(){
        category[categoryIdx].classList.remove("selected");
        category[categoryIdx].children[1].children[1].style.display='none';
        this.classList.add("selected");
        this.children[1].children[1].style.display='block';
        if(this.children[1].children[0].textContent=='영화별'){
			type='movie';	
			$(".movieTitle").text(movieName);
	        getDataSource();
		}else if(this.children[1].children[0].textContent=='극장별'){
			type='location';
			$(".movieTitle").text(location_name);
			getTheaterSource();
		}
        categoryIdx=index;
    })
})

// 영화별
const movieList = document.querySelectorAll('.movie-list-content>li');
let idx=0;
movieList.forEach((item,index)=>{
    item.addEventListener('click',function(){
        movieList[idx].classList.remove("selected");
        movieList[idx].children[0].style.display='none';
        this.setAttribute("class","selected");
        document.querySelector(".movieTitle").textContent=item.children[0].value;
        movieName = (item.children[0].value);
        this.children[0].style.display='block';
        idx=index;
        getDataSource();
    })    
})
function getData(){
	return axios.get('cinemaLocationName.jsp?locationName='+movieName)
    .then(response=>{
        return response.data;
    })
    .catch(error=>{
		console.log(error);
		throw error;
	})
}
function getDataSource(){
	//console.log(type,movieName,currTime);
    
    getData().then(async cinemaData => {
    let res = $("<div></div>");

    // cinemaData를 순회하며 각 요청을 동기적으로 처리
    for (const item of cinemaData) {
        const container = $("<div class='theater-location'></div>");
        let title = $("<div class='title'>" + item.location_name + "</div>");
        container.append(title);
        
        let result;
        try {
            // 첫 번째 axios 요청
            const response = await axios.get(`cinemaRoomLocation.jsp?name=${movieName}&location_name=${item.location_name}`);
            result = response.data;

            // 각 결과에 대해 동기적으로 처리
            for (const it of result) {
                let theaterBox = $("<div class='theater-box'></div>");
                
                theaterBox.append($("<div class='theater-type'><div class='theater-name'>" + it.room_location + "</div><div class='chair'>총 232석</div></div>"));
                const theaterArea = $("<div class='theater-area'></div>");
                theaterBox.append(theaterArea);

                // 두 번째 axios 요청
                try {
                    const response2 = await axios.get(`selectMovieName.jsp?type=${type}&location_name=${it.location_name}&movie_idx=${it.movie_idx}&room_location=${it.room_location}&time=${currTime}`);
                    let result2 = response2.data;

                    theaterArea.append($("<div class='item'>2D(자막)</div>"));

                    for (const it2 of result2) {
                        let date = new Date(it2.start_time);
                        let startMovieTime = String(date.getHours()).padStart(2, "0") + ":" + String(date.getMinutes()).padStart(2, "0");
                        let date2 = new Date(it2.end_time);
                        let endMovieTime = String(date2.getHours()).padStart(2, "0") + ":" + String(date2.getMinutes()).padStart(2, "0");
                        theaterArea.append($("<div class='item'><div class='item-wrapper'>"+startMovieTime+"~"+endMovieTime+"</div><div class='item-box'><div class='start-time'>" + String(date.getHours()).padStart(2, "0") + ":" + String(date.getMinutes()).padStart(2, "0") + "</div><div class='remain-chair'>220석</div></div></div>"));
                    }

                    container.append(theaterBox);
                    res.append(container);
                } catch (error) {
                    console.log(error);
                }
            }
        } catch (error) {
            console.log(error);
        }
    }

    // 모든 요청이 완료된 후 DOM 업데이트
    $(".theater-location").html(res);
	}).catch(error => console.log(error));

    
}
// 극장별
const categoryTitle = document.querySelectorAll(".theater>span");
let categoryTitleIdx=0;
categoryTitle.forEach((item,index)=>{
    item.addEventListener('click',function(){
        categoryTitle[categoryTitleIdx].classList.remove("selected");
        item.classList.add("selected");
        categoryTitleIdx=index;
        console.log("result : "+categoryTitleIdx);
        theaterList(categoryTitleIdx);
    })
})
function getTheater(){
	return axios.get('selectTheater.jsp?location_name='+location_name)
	.then(response=>{
		return response.data;
	}).catch(error=>{
		throw error;
	})
}
function getTheaterSource(){
	
	getTheater().then(async theaterData=>{
		let res = $("<div></div>");
		for(const theater of theaterData){
			const container = $("<div class='theater-location'></div>");
		 	let movie_idx=theater.movie_idx;
		 	const re = await axios.get('selectMovieNameByIdx.jsp?movieIdx='+movie_idx);
	        let title = $("<div class='title'>" + re.data + "</div>");
	        container.append(title);
	        const response = await axios.get('selectTheaterSecond.jsp?location_name='+encodeURIComponent(location_name)+`&movie_idx=${theater.movie_idx}&room_location=${theater.room_location}`);
	        const result = response.data;
	        for (const it of result) {
                let theaterBox = $("<div class='theater-box'></div>");
                
                theaterBox.append($("<div class='theater-type'><div class='theater-name'>" + it.room_location + "</div><div class='chair'>총 232석</div></div>"));
                const theaterArea = $("<div class='theater-area'></div>");
                theaterBox.append(theaterArea);
                // 두 번째 axios 요청
                try {
                    const response2 = await axios.get(`selectMovieName.jsp?type=${type}&location_name=${location_name}&movie_idx=${movie_idx}&room_location=${it.room_location}&time=${currTime}`);
                    let result2 = response2.data;
                    theaterArea.append($("<div class='item'>2D(자막)</div>"));

                    for (const it2 of result2) {
                        let date = new Date(it2.start_time);
                        let startMovieTime = String(date.getHours()).padStart(2, "0") + ":" + String(date.getMinutes()).padStart(2, "0");
                        let date2 = new Date(it2.end_time);
                        let endMovieTime = String(date2.getHours()).padStart(2, "0") + ":" + String(date2.getMinutes()).padStart(2, "0");
                        theaterArea.append($("<div class='item'><div class='item-wrapper'>"+startMovieTime+"~"+endMovieTime+"</div><div class='item-box'><div class='start-time'>" + String(date.getHours()).padStart(2, "0") + ":" + String(date.getMinutes()).padStart(2, "0") + "</div><div class='remain-chair'>220석</div></div></div>"));
                    }

                    container.append(theaterBox);
                    res.append(container);
                } catch (error) {
                    console.log(error);
                }
            }
		}
		$(".theater-location").html(res);
	})
}
function theaterList(idx){
    const theaterListContent = categoryTitle[idx].querySelectorAll(" .theater-list-content>li");
    let ListIdx=0;
    console.log(theaterListContent.length);
    theaterListContent.forEach((item,index)=>{
        item.addEventListener('click',function(e){
            theaterListContent[ListIdx].classList.remove("selected");
            this.classList.add("selected");
            document.querySelector(".movieTitle").textContent=this.textContent;
            location_name=this.textContent;
            ListIdx=index;
            e.stopPropagation();
            if(type=='movie')debounce(getDataSource(),1000);
            else if(type=='location')getTheaterSource();
            
        })
    })
}

// 특별관

const contentSpecial = document.querySelectorAll(".category-title.special span");
let contentSpecialIdx=0;
contentSpecial.forEach((item,index)=>{
    item.addEventListener('click',function(){
        contentSpecial[contentSpecialIdx].classList.remove("selected");
        item.classList.add("selected");
        contentSpecialIdx=index;
        specialList(contentSpecialIdx);
    })
})
function specialList(idx){
    const theaterListContent = contentSpecial[idx].querySelectorAll(" .special-list-content>li");
    let ListIdx=0;
    theaterListContent.forEach((item,index)=>{
        item.addEventListener('click',function(){
            theaterListContent[ListIdx].classList.remove("selected");
            this.classList.add("selected");
            document.querySelector(".movieTitle").textContent=this.textContent;
            ListIdx=index;
        })
    })
}

// 날짜 클릭 이벤트
const selectedDate = document.querySelectorAll(".timetable .item");
let selectedDateIdx=0;
let hour,min;
selectedDate.forEach((item,index)=>{
	if(index==0){
		selectedDate[0].classList.add("selected");
		const time=selectedDate[0].children[0].textContent.split(".");
	    publicSelectedDate(time);
	}
	item.addEventListener("click",function(){
		const time = this.children[0].textContent.split(".");
		selectedDate[selectedDateIdx].classList.remove("selected");
		this.classList.add("selected");
		selectedDateIdx=index;
		publicSelectedDate(time);
	})
})
function publicSelectedDate(time){
	hour = String(time[0]).padStart(2,"0");
    min = String(time[1]).padStart(2,"0");
    currTime=hour+"-"+min;
    if(type=='movie') getDataSource();
    else if(type=='location')getTheaterSource();
}

