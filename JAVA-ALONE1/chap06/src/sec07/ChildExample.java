package sec07;

public class ChildExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Child child = new Child();
		
		child.method1(); // Parent의 method1
		child.method2(); //재정의된 메소드 호출 부모한테 상속받은 method2()가아닌 본인의 것을 먼저 사용한다.
		child.method3(); // Child의 method3
		
		Parent parent = new Parent();
		parent.method2(); //parent.method3()은 에러가 난다.

	}

}
