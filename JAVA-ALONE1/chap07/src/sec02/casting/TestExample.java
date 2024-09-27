package sec02.casting;

public class TestExample {
	static void method(B b) {}
	
	public static void main(String[] args) {
		B b = (B)new A();
		method(b);
	}

}
