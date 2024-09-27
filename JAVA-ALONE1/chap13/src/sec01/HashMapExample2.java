package sec01;

import java.util.*;

public class HashMapExample2 {

	public static void main(String[] args) {
		Map<Student03, Integer> map = new HashMap<>();
		
		map.put(new Student03(1, "홍길동"), 95);
		map.put(new Student03(1, "홍길동"), 95);
		
		System.out.println("총 map의 entry의 수: " + map.size());
	}

}
