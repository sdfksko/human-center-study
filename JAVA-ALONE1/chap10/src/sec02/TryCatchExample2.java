package sec02;

public class TryCatchExample2 {
	public static void main(String[] args) {
		try {
			System.out.println("잘 나오나");
			return;
		} catch(Exception e) {
			System.out.println("Exception 발생");
		} finally { 			// try블록에서 return을 만나더라도 무조건 실행되는 코드
			System.out.println("finally 실행됨");
		}
		
		System.out.println("프로그램 종료");
	}
}
