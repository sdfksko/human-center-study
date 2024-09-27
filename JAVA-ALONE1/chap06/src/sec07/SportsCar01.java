package sec07;

public class SportsCar01 extends Car01 {
	@Override
	public void speedUp() { speed += 10; }
	
	@Override
	public void stop() {
		System.out.println("스포츠카를 멈춤"); // <------ 메소드를 재정의할 수 없음
		speed = 0;
	}

}
