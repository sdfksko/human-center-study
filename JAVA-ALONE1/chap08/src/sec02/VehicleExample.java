package sec02;

public class VehicleExample {

	public static void main(String[] args) {
		Vehicle vehicle = new Bus();
		vehicle.run(); // 버스가 달립니다.
		// vehicle.checkFare(); // error -> Vehicle 인터페이스에는 checkFare가 없다.
		
		Bus bus = (Bus)vehicle; // 강제형 변환(casting)
		bus.run();
		bus.checkFare(); // bus에서 checkFare메소드가 존재하므로 실행가능

	}

}
