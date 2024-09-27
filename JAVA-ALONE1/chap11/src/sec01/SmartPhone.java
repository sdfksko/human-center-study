package sec01;

public class SmartPhone {
	// field
	private String company;
	private String os;
	
	// constructor
	public SmartPhone(String company, String os) {
		super();
		this.company = company;
		this.os = os;
	}
	
	// method
	@Override
	public String toString() {
		System.out.println("SmartPhone의 toString()이 실행됨");
		return company + ", " + os;
	}

}
