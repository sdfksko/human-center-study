package sec04;

public class ContinueKeyCodeReadExample {
	
	public static void main(String[] args) throws Exception {
		int keyCode;
		
		while(true) {
			keyCode = System.in.read();
			System.out.println("keyCode: " + keyCode);
			
			if(keyCode == 113) {            // q문자 입력
				break; 			//keyCode가 113과 동일한 경우 실행
		
			}
		}
		
		System.out.println("종료");
	}
}