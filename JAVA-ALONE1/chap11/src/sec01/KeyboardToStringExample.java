package sec01;

public class KeyboardToStringExample {
	public static void main(String[] args) throws Exception {
		// byte배열 100만큼 생성 및 초기화
		byte[] bytes = new byte[100];
		
		System.out.println("입력(98자까지 입력하고 엔터): ");	
		int readByteNo = System.in.read(bytes);	// 키보드로 입력받은 문자 혹은 숫자가 엔터를 누를때까지 bytes배열에 들어감.
		
		// 엔터를 누르게 되면 \r\n의 값이 자동으로 들어가기 때문에 \r\n 2개를 제외한 개수까지만 String으로 저장
		String str = new String(bytes, 0, readByteNo - 2);
		System.out.println(str);
	}
}