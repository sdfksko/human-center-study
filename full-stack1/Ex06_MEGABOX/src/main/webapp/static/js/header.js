const supListContents = document.querySelectorAll('.sup-list-content');
const wrapper = document.querySelector(".header-wrapper");
document.querySelectorAll(".sup-content").forEach((item,index)=>{
    item.addEventListener('mouseover',function(e){
        supListContents.forEach(it=>it.style.display='none');
        // this.style.display='block';
        if(item.textContent=='스토어'){
          wrapper.style.display='none';
          return false;
        }
        wrapper.style.display='block';
        supListContents[index].style.display='flex';
        supListContents[index].style.zIndex='2';
      })
        supListContents[index].addEventListener('mouseleave',function(){
          this.style.display='none';
          wrapper.style.display='none';
      })
});


// 검색 이미지
const search = document.querySelector(".search-img");
search.addEventListener('click',function(){
  if(search.children[0]['src'].includes('search')){
    document.querySelector(".search-container").style.display='block';
    search.children[0].setAttribute('src','../static/images/cancel.svg');    
  }else{
    document.querySelector(".search-container").style.display='none';
    search.children[0].setAttribute('src','../static/images/search.svg');    
  }
})
document.querySelector("#closeLogin").addEventListener('click',function(){
  document.querySelector(".login-box").style.display='none';
  document.querySelector(".login-background").style.display='none';
})
// 로그아웃
const logout = document.querySelector("#logout");
if(logout){
	logout.addEventListener('click',function(){
		location.href="logoutAccess.jsp";
	})	
}
function login(){
	const id = document.querySelector("#id").value;
	const pw = document.querySelector("#pw");
	axios.get('selectLogin.jsp?memberId='+id)
	.then(response=>{
		let data = response.data;
		if(data==null){
			alert("아이디 혹은 비밀번호가 다릅니다.");
			pw.value="";
			return false;
		}
		if(document.querySelector("#chk").checked){
			data.chk=true;
		}
		else {
			data.chk=false;
			console.log("unchecked");
		}
		console.log(data);
		return axios.post('loginAccess.jsp',data).then(response=>{
			if(response){
				location.href="loginAccess.jsp";
			}
		})
	})
	
	.catch(error=>console.log(error))
}

// 로그인
const userLogin = document.querySelector("#login");
if(userLogin){
	userLogin.addEventListener('click',function(){
	  document.querySelector(".login-box").style.display='block';
	  document.querySelector(".login-background").style.display='block';
	  document.querySelector(".header-wrapper").style.display='none';
	  supListContents.forEach(it=>it.style.display='none');
	  document.querySelector(".logout-container").style.display='none';
	  document.querySelector("#userLogin").setAttribute("src",'../static/images/user.svg');
	})	
}
// 메뉴 이미지
const container = document.querySelector(".menu-img");
container.addEventListener('click',function(){
    const img = container.firstChild;
    const menu = document.querySelector(".menu-container");
    if(img.getAttribute('src').includes('menu')){
        img.setAttribute('src','../static/images/cancel.svg');
        menu.style.display='block';
        menu.style.zIndex="2";
    }else{
        img.setAttribute('src','../static/images/menu.svg');
        menu.style.display='none';	
    }
})


// 사람이미지

const userLoginImg = document.querySelector("#userLogin");
userLoginImg.addEventListener('click',function(){
	if(document.querySelector("#session_name").value.length==0){
	  if(this.getAttribute("src").includes("user")){
	    document.querySelector(".logout-container").style.display='block';
	    this.setAttribute("src",'../static/images/cancel.svg');
	  }else{
	    document.querySelector(".logout-container").style.display='none';
	    this.setAttribute("src",'../static/images/user.svg');	
	  }		
	}else{
		if(this.getAttribute("src").includes("user")){
	    document.querySelector(".login-container").style.display='block';
	    this.setAttribute("src",'../static/images/cancel.svg');
	  }else{
	    document.querySelector(".login-container").style.display='none';
	    this.setAttribute("src",'../static/images/user.svg');	
	  }		
	}
})

document.querySelector("#moveLogin").addEventListener('click',function(){
	document.querySelector(".login-box").style.display='block';
	document.querySelector(".logout-container").style.display='none';	
	document.querySelector(".logout-container").style.display='none';	
	document.querySelector(".login-background").style.display='block';
	document.querySelector(".header-wrapper").style.display='none';
	supListContents.forEach(it=>it.style.display='none');
	document.querySelector("#userLogin").setAttribute("src","../static/images/user.svg");
})

//영화 검색
const movieSearch = document.querySelector(".search-container .right");
movieSearch.children[1].addEventListener("click",function(){
	location.href='allMovie.jsp?name='+movieSearch.children[0].value;
})