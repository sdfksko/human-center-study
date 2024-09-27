package sec02;

public class Exam10 {
	public static void main(String[] args) {
		int var1 = 10; // 반지름
		int var2 = 3; // PI의 정수값
		int var3 = 14; // PI의 소수점값
		
		double var4 = var1 * var1 * Double.parseDouble(var2 + "." + var3); // Double.parseDouble("3.14")
		System.out.println("원의 넓이: " + var4);
	}

}
