package sec05;

public class Singleton {
	private static Singleton singleton = new Singleton();
	
	private Singleton() {}		// private로 된 생성자는 외부에서 객체 생성 불가
	
	static Singleton getInstance() {
		return singleton;
	}

}
