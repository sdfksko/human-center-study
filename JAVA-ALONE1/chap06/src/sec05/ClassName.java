package sec05;

public class ClassName {
	
	//인스턴스 필드
	int field1;
	//인스턴스 메소드
	void method1() {}
	
	//정적 필드
	static int field2;
	//정적 메소드
	static void method2() {}
	
	static void method3() {
		// 정적 메소드 안에서는 정적 필드만 사용 가능. this도 사용 불가
		//this.field1 = 10;
		//this.method1();
		
		field2 = 10;
		method2();
		
		ClassName obj1 = new ClassName();
		obj1.field1 = 10;
		obj1.method1();
	}

}
