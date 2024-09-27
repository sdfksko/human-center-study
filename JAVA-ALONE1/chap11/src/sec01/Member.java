package sec01;


// 내부적으로 java.lang.Object 클래스를 자동 상속이 됨
public class Member extends Object {
	public String id;
	
	public Member(String id) {
		// super(); // 생략되어 있음(Object의 기본생성자)
		this.id = id;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Member) {
			
			Member member = (Member)obj; // 강제형변환(casting)
		
			if (id.equals(member.id))
				return true;
		}
		return false;
		
		
	}
 }
