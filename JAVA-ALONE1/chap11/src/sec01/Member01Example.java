package sec01;

public class Member01Example {

	public static void main(String[] args) {
		Member01 member = new Member01("blue", "이파란");
		
		String strObj = member.toString();
		System.out.println(strObj);
		
		System.out.println(member);
	}

}
