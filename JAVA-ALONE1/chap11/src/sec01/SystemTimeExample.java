package sec01;

public class SystemTimeExample {

	public static void main(String[] args) {		
		long time1 = System.nanoTime();				// 10의 -9승
		long time3 = System.currentTimeMillis();	// 10의 -6승
		
		long sum = 0;
		for(long i = 1; i <= 99999999999L; i++) {
			sum += i;
		}
		
		long time2 = System.nanoTime();
		
		System.out.println("1~999999999999999999999까지의 합: " + sum);
		System.out.println("계산에 " + (time2 - time1) + " 나노초가 소요되었습니다.");
		System.out.println("계산에 " + ((time2 - time1) / (double)1000000000) + "초가 소요되었습니다.");
		

	}

}
