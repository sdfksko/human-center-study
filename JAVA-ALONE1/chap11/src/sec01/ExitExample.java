package sec01;

public class ExitExample {

	public static void main(String[] args) {
		for(int i = 0; i < 10; i++) {
			if(i ==5) {
				System.exit(i);	// 프로그램 종료
				//break			// for문을 빠져나감
			}
		}
		System.out.println("마무리 코드"); // 위의 System.exit로 인해 출력이 안됨

	}

}
