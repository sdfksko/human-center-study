const data = document.querySelectorAll(".sup-content");
const supListContents = document.querySelectorAll('.sup-list-content');
const wrapper = document.querySelector(".header-wrapper");
data.forEach((item,index)=>{
    item.addEventListener('mouseover',async function(){
        supListContents.forEach(it=>it.style.display='none');
        // this.style.display='block';
        wrapper.style.display='block';
        supListContents[index].style.display='flex';
        supListContents[index].style.zIndex='1';
      })
        supListContents[index].addEventListener('mouseleave',function(){
          this.style.display='none';
          wrapper.style.display='none';
      })
});