function searchNotice() {
	const searchTextBoxEl = document.querySelector('#sch_bar')
	
	window.location.href='/starbucks-homepage/notice_list.jsp?search=' + searchTextBoxEl.value
}