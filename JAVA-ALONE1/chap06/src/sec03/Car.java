package sec03;

public class Car {
	// 1. 만약 기본생성자가 만들어지지 않더라도 내부적으로 기본생성자가 없다면 자동으로 만들어줌
	// 2. 단, 다른 생성자가 생성되어 있다면 기본 생성자는 자동으로 생성되지 않음
	public Car() {   	// 기본 생성자 선언
		System.out.println("기본 생성자 출력");
		
	}
	
	public Car(String model, String color, int maxSpeed) { // 3개의 인수를 가진 생성자
		System.out.println("인수가 3개인 생성자 출력");
	}
	
	public Car(String color, int cc) {
		System.out.println("인수가 2개인 생성자 출력");
	}

}
