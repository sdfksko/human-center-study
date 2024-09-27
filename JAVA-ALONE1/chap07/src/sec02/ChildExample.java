package sec02;

public class ChildExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Child child = new Child();
		Parent parent = child; // 클래스 자동형변환;
		
		parent.method1();
		parent.method2();    // parent의 method2가 아니라 Child의 method2가 실행됨
		// parent.method3(); // error

	}

}
