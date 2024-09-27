package sec02;

public class Example {

	public static void main(String[] args) {
		ImplementationC impl = new ImplementationC();
		
		InterfaceA ia = impl; // InterfaceA로 자동형변환
		ia.methodA();	// ImplementationC의 methodA를 실행
		System.out.println(); // 한 줄 띄우기
		
		InterfaceB ib = impl; // InterfaceB로 자동형변환
		ib.methodB();	// ImplementationC의 methodB를 실행
		System.out.println(); // 한 줄 띄우기
		
		InterfaceC ic = impl;
		ic.methodA();	// ImplementationC의 methodA를 실행
		ic.methodB();	// ImplementationC의 methodB를 실행
		ic.methodC();	// ImplementationC의 methodC를 실행
	}

}
