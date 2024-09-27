package sec02;

public class Exam03 {
	public static void main(String[] args) {
		while(true) {
			double a = (Math.random()*6 + 1);
			double b = (Math.random()*6 + 1);
			int c = (int)(double)a;
			int d = (int)(double)b;
			System.out.println("눈1: " + c + " " + "눈2: " + d);
			if (c + d == 5) {
				System.out.println("두 주사위의 합은 5입니다.");
				break;
			}
			
		}
	}

}
// int a = (int)(Math.random()*6) + 1;
// int b = (int)(Math.random()*6) + 1;