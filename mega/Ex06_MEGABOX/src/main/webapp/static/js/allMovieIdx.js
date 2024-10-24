const movieMain = document.querySelectorAll(".movie-main .title .title-list");
let movieMainIdx=0;
movieMain.forEach((item,index)=>{
    item.addEventListener("click",function(){
        movieMain[movieMainIdx].children[0].style.border="none";
        movieMain[movieMainIdx].children[0].style.borderBottom="1px solid #503396";
        movieMain[movieMainIdx].children[1].style.display='none';
        this.children[0].style.border="1px solid #503396";
        this.children[0].style.borderBottom="none";
        this.children[1].style.display='block';
        movieMainIdx=index;
        
    })
})

function review_insert(name, movieIdx){console.log('a',name);
	if(name==null || name==""){
		alert("로그인후 이용가능합니다.");
		return false;
	}
	location.href='writeForm.jsp?movieIdx='+movieIdx;
}