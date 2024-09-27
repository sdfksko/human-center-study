package sec01;

import java.util.*;

public class HashSetExample01 {

	public static void main(String[] args) {
		Set<String> set = new HashSet<String>();
		//추가
		set.add("Java");
		set.add("JDBC");
		set.add("Servlet/JSP");
		set.add("Java");	// set클래스 객체는 중복을 허용하지 않아 무시가 된다.
		set.add("iBATIS");
		
		//검색
		int size = set.size();
		System.out.println("총 객체수: " + size);
		
		Iterator<String> iterator = set.iterator();
		while(iterator.hasNext()) {
			String element = iterator.next();
			System.out.println("\t" + element);
		}
		
		//삭제
		set.remove("JDBC");
		set.remove("iBATIS");
		
		System.out.println("총 객체수: " + set.size());
		for(String element : set) {
			System.out.println("\t" + element);
		}
		
		set.clear();
		if(set.isEmpty()) { System.out.println("비어 있음"); }

	}

}
