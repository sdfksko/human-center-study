package sec02;

public class ForSumFrom1To100Example1 {
	public static void main(String[] args) {
		int sum = 0;   // <---------합계변수
		
		for(int i = 1; i <= 100; i++) {
			sum += i;
		}
		System.out.println("1~100 합: " + sum);
		
		int i = 1;
		for(; i <= 100; i++) {
			System.out.println(i);
		}
		
		for (int j = 0, k = 100; j <= 50 && k >= 50; j++, k--) {
			
		}
		
		for (;;) { //무한루프 == while(true)
			break;
		}
		for(int j = 0; ; j++) { // 무한루프 == while
			break;
			
		}
	}

}
