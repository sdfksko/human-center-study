package sec01;

public class SmartTelevisionExample {

	public static void main(String[] args) {
		SmartTelevision tv1 = new SmartTelevision();
		RemoteControl rc = tv1;
		rc.turnOn();
		rc.setVolume(5);
		rc.turnOff();
		
		Searchable sa = tv1;
		sa.search("www.naver.com");
		
		

	}

}
