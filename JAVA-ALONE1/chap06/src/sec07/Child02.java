package sec07;

public class Child02 extends Parent02 {
	private String name;
	
	public Child02() {
		this("홍길동");
		System.out.println("Child02() call");
	}
	

	public Child02(String name) {
		this.name = name;
		System.out.println("Child02(String name) call");
	}

}
