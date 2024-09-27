package sec02;

public class IncreaseDecreaseOperatorExample {
	public static void main(String[] args) {
		int x = 10;
		int y = 10;
		int z;
		
		System.out.println("---------------------");
		x++;
		++x;
		System.out.println("x=" + x);
		
		System.out.println("---------------------");
		y--;
		--y;
		System.out.println("y=" + y);
		
		System.out.println("---------------------");
		z = x++;			// (1) z = x (2) x = x + 1
		System.out.println("z=" + z);
		System.out.println("x=" + x);
		
		System.out.println("---------------------");
		z = ++x;			// (1) x = x + 1 (2) z = x
		System.out.println("z=" + z);
		System.out.println("x=" + x);
		
		System.out.println("---------------------");
		z = ++x + y++;		// (1) x = x + 1 (2) z = x + y (3) y = y + 1
		System.out.println("z=" + z);
		System.out.println("x=" + x);
		System.out.println("y=" + y);
	}

}
