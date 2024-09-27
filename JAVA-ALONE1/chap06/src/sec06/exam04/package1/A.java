package sec06.exam04.package1;

public class A {
	//필드
	A a1 = new A(true);
	A a2 = new A(1);
	A a3 = new A("문자열");
	
	//생성자
	public A(boolean b) {};		//public 생성자
	A(int b) {};				//default 생성자
	private A(String s) {};		//private 생성자

}
