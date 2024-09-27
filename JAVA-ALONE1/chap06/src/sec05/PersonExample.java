package sec05;

public class PersonExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person p1 = new Person("12345601234567", "홍길동");
		
		System.out.println(p1.nation);
		System.out.println(p1.ssn);
		System.out.println(p1.name);
		
		//p1.nation = "usa"; -> final 필드라 바꿀 수 없음
		//p1.ssn = "654321-7654321"; -> final 필드라 바꿀 수 없음
		p1.name = "홍삼원"; // -> final 필드가 아니기에 바꿀 수 있음

	}

}
