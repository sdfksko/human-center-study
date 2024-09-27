package sec07;

public class Parent02 {
	
	public String nation;
	
	public Parent02() {
		this("대한민국");
		System.out.println("Parent02() call");
	}
	
	public Parent02(String nation) {
		this.nation = nation;
		System.out.println("parent02(String nation) call");
	}

}
