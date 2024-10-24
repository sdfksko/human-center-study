const pageSize=5;
const pageBottom=5;
getData(1,pageSize,pageBottom,'','all');
function getData(p,s,b,title,name){
    s=pageSize;
    b=pageBottom;
    let pageStartNo =parseInt((p-1)/b)*b+1;
    let pageEndNo=(pageStartNo+b-1);
    let startNo = (p-1)*s;
    axios.get('selectAll.jsp?p='+(startNo)+"&title="+title+"&name="+name)
    .then(function (response) {
        // 성공 핸들링
        console.log(response.data);
        const data = response.data.list;
        const div = $("<div></div>");
        const total = response.data.total;
        let totalPage = parseInt((total-1)/s)+1;            
        if(pageEndNo>totalPage)pageEndNo=totalPage;
        
        
        for(d of data){
          const ul=$("<ul class='content-container list'></ul>");
          let li=$("<li>"+d.row_num+"</li>")
          .add($("<li>"+d.name+"</li>"))
          .add($("<li>"+d.category+"</li>"))
          .add($("<li><a href='noticeDetail.jsp?idx="+d.idx+"'>"+d.title+"</a></li>"))
          .add($("<li>"+new Intl.DateTimeFormat('en-CA').format(new Date(d.regDate))+"</li>"));
          ul.append(li);
          div.append(ul);
      }
      // alert(ul.prop('outerHTML'));
      const container = $("<div class='container'></div>");
      if(pageStartNo>b){
          container.append($("<div class='item'><a href='javascript:void(0)' onclick='getData("+(1)+","+"\""+pageSize+"\","+"\""+pageBottom+"\",\""+title+"\",\""+name+"\")'>&laquo;</a></div>"))
          .append($("<div class='item'><a href='javascript:void(0)' onclick='getData("+(pageStartNo-1)+","+"\""+pageSize+"\","+"\""+pageBottom+"\",\""+title+"\",\""+name+"\")'>&lt;</a></div>"))
      }
      for(let i=pageStartNo;i<=pageEndNo;i++){
          if(i==p){
              container.append($("<div class='item selected'><a href='javascript:void(0)' onclick='getData("+i+","+"\""+pageSize+"\","+"\""+pageBottom+"\",\""+title+"\",\""+name+"\")'>"+i+"</a></div>"));
          }else{
              container.append($("<div class='item'><a href='javascript:void(0)' onclick='getData("+i+","+"\""+pageSize+"\","+"\""+pageBottom+"\",\""+title+"\",\""+name+"\")'>"+i+"</a></div>"))
          }
      }
      if(pageEndNo<totalPage){
          container.append($("<div class='item'><a href='javascript:void(0)' onclick='getData("+(pageStartNo+b)+","+"\""+pageSize+"\","+"\""+pageBottom+"\",\""+title+"\",\""+name+"\")'>&gt;</a></div>"))
          .append($("<div class='item'><a href='javascript:void(0)' onclick='getData("+totalPage+","+"\""+pageSize+"\","+"\""+pageBottom+"\",\""+title+"\",\""+name+"\")'>&raquo;</a></div>"));
      }
      const pagination = $("<div class='pagination'></div>");
      pagination.append(container);
      div.append(pagination);
      $(".tmp").html(div);
      $(".totalCount").html(total);
      $(".search>input").val('');
  })
  .catch(function (error) {
      // 에러 핸들링
      console.log(error);
  })
  .finally(function () {
      // 항상 실행되는 영역
  });
}
const menu = document.querySelectorAll('.sub-menu-item');
menu.forEach(item=>{
  item.addEventListener('click',function(){
      menu.forEach(item=>{
          item.style.backgroundColor='white';
          item.style.color='black';
      });
      if(this.textContent=='전체'){
        getData(1,pageSize,pageBottom,$(".search").children().first().val(),"all");
      }else if(this.textContent=='메가박스 공지'){
        getData(1,pageSize,pageBottom,$(".search").children().first().val(),"megabox");
      }else{
        getData(1,pageSize,pageBottom,$(".search").children().first().val(),"other");        
      }
      this.style.backgroundColor='rgb(85,85,85)';
      this.style.color='white';
  })
})


// 검색창
$(".search").on('click',function(){
	const child = $(this).children().eq(0);
	getData(1,pageSize,pageBottom,child.val());
}) 
/*const noticeSearch=document.querySelector(".search");
noticeSearch.children[1].addEventListener('click',function(){
	
  let form = document.createElement('form');
  form.setAttribute("action","notice.jsp");
  form.setAttribute("method","get");
  
  let inputPage = document.createElement("input");
  inputPage.setAttribute("name","p");
  inputPage.setAttribute("value",1);
  form.appendChild(inputPage);
  
  if(noticeSearch.children[0].value!=''){
    let input = document.createElement("input");
    input.setAttribute("name","title");
    input.setAttribute("value",noticeSearch.children[0].value);
    form.appendChild(input);
  }
  

  document.body.appendChild(form);
  form.submit();
})*/

