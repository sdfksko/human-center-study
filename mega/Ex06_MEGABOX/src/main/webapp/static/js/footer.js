function showMenu() {
  const menuEl = document.querySelector('footer .sub-menu');

  function Menu(element) {
      element.style.display = 'block';
  }

  Menu(menuEl);

  window.scrollBy(0, -500);
}

function closeMenu() {
  const menuEl = document.querySelector('footer .sub-menu');

  function quit(star) {
      star.style.display = 'none';
  }

  quit(menuEl);

  window.scrollTo(0, document.body.scrollHeight);
}