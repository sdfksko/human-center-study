package sec01;

public class Member {
	
	//필드
	public String name;
	public int age;
	
	//생성자
	public Member(String name, int age) {
		this.name = name;
		this.age = age;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Member) {
			Member member = (Member)obj; // 강제형변환(casting)
			
			return member.name.equals(this.name) && member.age == this.age; 
			
		}
	
		return false;
	}
	
	@Override
	public int hashCode() {
		return name.hashCode() + age;
	}
}

