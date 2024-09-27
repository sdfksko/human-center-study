package sec01;

import java.util.*;

public class HashSetExample2 {

	public static void main(String[] args) {
		Set<Member> set = new HashSet<Member>();
		
		//인스턴스가 다르지만 내부 데이터가 같은 즉 equals메소드와
		//hashCode()값이 같은 객체로 동일한 객체로 인정
		set.add(new Member("홍길동", 30));
		set.add(new Member("홍길동", 30));
		
		System.out.println("총 객체 수: " + set.size());
	}

}
