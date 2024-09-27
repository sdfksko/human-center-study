package sec02;

public class Exam01 {
	public static void main(String[] args) {
		
		int x = 10;
		int y = 20;
		int z = (++x) + (y--); // (1) x = x + 1 -> 11  (2) z = 11 + y(20) -> 31  (3) y = y(20) - 1 -> 19
		
		System.out.println(x);
		System.out.println(y);
		System.out.println(z);
		
	}

}
