package sec01;

import java.util.*;

public class MapExample {

	public static void main(String[] args) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("blue", 96);
		map.put("hong", 86);
		map.put("white", 92);
		
		String name = null;		// 최고 점수를 받은 아이디 저장
		int maxScore = 0;		// 최고 점수 저장
		int totalScore = 0;		// 점수 합계 저장
		
		Set<Map.Entry<String, Integer>> entrySet = map.entrySet();
		for(Map.Entry<String, Integer> entry : entrySet) {
			totalScore += entry.getValue();	// 합계점수
			
			if (maxScore < entry.getValue()) {
				maxScore = entry.getValue();	// 최고 점수
				name = entry.getKey();			// 최고 점수를 받은 아이디
			}
		}
		/*
		// while 문을 사용
		Iterator<Map.Entry<String, Integer>> entryIterator = entrySet.iterator(); // key와 value 모두 iterator
		while(entryIterator.hasNext()) {
			Map.Entry<String, Integer> entry = entryIterator.next();
			
			totalScore += entry.getValue();		// 합계점수
			
			if(maxScore < entry.getValue()) {	
				maxScore = entry.getValue();	// 최고 점수
				name = entry.getKey();			// 최고 점수를 받은 아이디
			}
			
			
			
		}
		*/
		double avgScore = (double) totalScore / map.size(); // 평균 점수
		
		System.out.println("평균점수: " + avgScore);
		System.out.println("최고점수: " + maxScore);
		System.out.println("최고점수를 받은 아이디: " + name);
	}
}