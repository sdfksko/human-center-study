package sec01;

import java.util.HashMap;

public class KeyExample {

	public static void main(String[] args) {
		// Key 객체를 식별키로 사용해서 String값을 저장하는 HashMap객체를 생성
		HashMap<Key, String> hashMap = new HashMap<Key, String>();
		
		// 식별키 Key 1을 "홍길동"으로 저장
		hashMap.put(new Key(1), "홍길동");
		
		String value = hashMap.get(new Key(1)); // Key 1의 값을 가져온다.
		System.out.println(value); //  number값을 가져오도록 hashCode메소드를 재정의하였다면 "홍길동"을 가져온다.

	}

}
