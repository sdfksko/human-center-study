document.write('body mainjs파일');

// String(문자 데이터) 
// 따옴표를 사용합니다. 
let myName = "HEROPY"; 
let email = 'thesecon@gmail.com'; 
let hello = `Hello ${myName}?!` 
console.log(myName); // HEROPY 
console.log(email); // thesecon@gmail.com 
console.log(hello); // Hello HEROPY?! 

// Undefined 
// 값이 할당되지 않은 상태를 나타냅니다. 
let undef; 
let obj = { abc: 123 }; 
console.log(undef); // undefined 
console.log(obj.abc); // 123 
console.log(obj.xyz); // undefined