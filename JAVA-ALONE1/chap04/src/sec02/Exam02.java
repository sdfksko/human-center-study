package sec02;

public class Exam02 {
	public static void main(String[] args) {
		int sum = 0;
		for (int i = 1; i < 101;  i++) {
			if(i%3 != 0) {
				continue;
			}
			sum += i;
			System.out.println(sum);
				
		}
				
				
	}

}
