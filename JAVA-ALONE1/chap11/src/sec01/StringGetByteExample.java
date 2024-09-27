package sec01;

public class StringGetByteExample {

	public static void main(String[] args) {
		String str1 = "안녕하세요";		// 안 -> ㅇㅏㄴ 3byte, ㅎㅏ빈칸 -> 3byte
		String str2 = "hello";			// h -> h
		
		byte[] bytes1 = str1.getBytes();	// 인코딩(encoding) 아무것도 적지 않으면 utf8
		System.out.println("bytes1.length: " + bytes1.length);	// 3byte * 5 -> 15개
		byte[] bytes2 = str2.getBytes();
		System.out.println("bytes2.length: " + bytes2.length);	// 1byte * 5 -> 5개
		
		String str3 = new String(bytes1);	// 디코딩(decoding)
		System.out.println("bytes1 -> String: " + str3);	// 안녕하세요
		String str4 = new String(bytes2);
		System.out.println("bytes2 -> String: " + str4);	// hello
		
		try {
			//euc-kr(대소문자 구분 안함) -> 한국어 인코딩 타입이름
			byte[] bytes3 = str1.getBytes("EUC-KR"); // euc-kr로  인코딩(encoding) euc-kr은 2byte ex)아ㄴ -> 2byte
			System.out.println("bytes3.length: " + bytes3.length); // 2byte * 5 -> 10개
			String str5 = new String(bytes3, "euc-kr");	// euc-kr로 디코딩(decoding)
			System.out.println("bytes3 - > String: " + str5); // 안녕하세요
			
			//utf-8(대소문자 구분 안함) -> 다(多)국어 인코딩 타입이름
			byte[] bytes4 = str1.getBytes("utf-8"); // utf-8 로  인코딩(encoding) utf-8은 3byte ex)ㅇㅏㄴ -> 3byte
			System.out.println("bytes4.length: " + bytes3.length); // 3byte * 5 -> 15개
			String str6 = new String(bytes3, "utf-8");	// utf-8 로 디코딩(decoding)
			System.out.println("bytes4 - > String: " + str6); // 안녕하세요
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}