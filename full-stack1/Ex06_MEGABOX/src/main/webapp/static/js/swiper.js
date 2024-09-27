const swiper = new Swiper(".alarm-body", {
    slidesPerView: 6, // 한 번에 보여줄 슬라이드 수
    spaceBetween: 10, // 슬라이드 간의 간격
    
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  const swiper2 = new Swiper('.benefit', {
    // Optional parameters
    loop: true,
    autoplay:{
      delay:2000
    },
    // If we need pagination
    pagination: {
      el: '.swiper-pagination',
      type: "fraction",
    },
    scrollbar: {
      el: ".swiper-scrollbar",
    },
    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  
  });
