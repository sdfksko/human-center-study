package sec02.casting;

public class InstanceofExample {
	// 부모 클래스를 자식 클래스로 강제형변환을 안전하게 하는 메소드
	public static Child method1(Parent parent) {
		Child child = null;
		
		if(parent instanceof Child) {
			child = (Child) parent; // 강제형변환(casting)
			System.out.println("method1 - Child로 변환 성공");
		} else {
			System.out.println("method1 - Child로 변환되지 않음");
		}
		
		return child;
	}
		
		// 부모 클래스를 자식 클래스로 강제형변환을 안전하게 하는 메소드
		public static Child method2(Parent parent) {
			//강제형변환(casting) - > ClassCastException 발생할 가능성이 있음
			Child child = (Child) parent;
			System.out.println("method2 - Child로 변환 성공");
			
			return child;
		}
		
		
	

	public static void main(String[] args) {
		Parent parentA = new Child();
		method1(parentA);
		method2(parentA);
		//method1(new child()); 		// instanceof -> true
		//method1(mew Parent());		// instanceof ->false
		
		Parent parentB = new Parent();
		method1(parentB);
		method2(parentB);	// 예외 발생
	}

}
