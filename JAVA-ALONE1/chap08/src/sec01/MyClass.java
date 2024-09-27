package sec01;

public class MyClass {
	// 필드
	RemoteControl rc = new Television();
	
	// 생성자
	MyClass() {
		
	}
	
	MyClass(RemoteControl rc) {
		this.rc = rc;
		rc.turnOn();
		rc.setVolume(5);
	}
	
	//메소드
	void methodA() {		// 오디오를 키는 메소드
		RemoteControl rc = new Audio();
		rc.turnOn();
		rc.setVolume(5);
	}
	
	void methodB(RemoteControl rc) {		// TV를 키는 메소드
		rc.turnOn();
		rc.setVolume(5);
	}

}
