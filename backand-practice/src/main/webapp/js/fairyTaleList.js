function insertTo() {
	location.href='fairyTaleInsertForm.jsp';
} ;
 
function updateTo(title) {
	location.href='fairyTaleUpdateForm.jsp?title=' + title;
	console.log('하하');
};

function deleteTo(title) {
	location.href='fairyTaleDelete.jsp?title=' + title;
};

function insertForm() {
	location.href='fairyTaleInsert.jsp';
};

