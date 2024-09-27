package sec07;

public class Child extends Parent {
	void method2() {
		System.out.println("child의 method2");
		super.method2(); // 부모클래스의 method2메소드 호출
	}
	void method3() {
		System.out.println("child의 method3");
	}
}
