package sec03;

public class Exam02 {
	
	public static void main(String[] args) {
		
	LoginResult result = LoginResult.FAIL_PASSWORD;
	if(result == LoginResult.SUCCESS) {
		System.out.println("나비");
	} else if(result == LoginResult.FAIL_ID) {
		System.out.println("꽃");
	} else if(result == LoginResult.FAIL_PASSWORD) {
		System.out.println("하품");
	}

}
}
