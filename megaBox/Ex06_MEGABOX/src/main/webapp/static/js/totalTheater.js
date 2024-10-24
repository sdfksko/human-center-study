const cityContainer  = document.querySelectorAll(".city-container>li");
let cityContainerIdx=0;
cityContainer.forEach((item,index)=>{
    item.addEventListener("click",function(){
        let con = document.querySelector(".theater-container");
        cityContainer[cityContainerIdx].children[1].style.display='none';
        let calc = this.children[1].children.length;
        con.style.height=100+23*Math.ceil(calc/4)+'px';
        cityContainer[cityContainerIdx].classList.remove("selected");
        this.children[1].style.display='flex';
        this.classList.add("selected");
        cityContainerIdx=index;

    })
})