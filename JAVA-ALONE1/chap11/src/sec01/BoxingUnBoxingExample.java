package sec01;

public class BoxingUnBoxingExample {

	public static void main(String[] args) {
		// Boxing
		Integer obj1 = new Integer(100);	// 밑줄은 deprecated된 것을 표현
		Integer obj2 = new Integer("200");
		Integer obj3 = new Integer("300");
		
		System.out.println(obj1);
		System.out.println(obj2);
		System.out.println(obj3);
		
		// UnBoxing
		int value1 = obj1.intValue();
		int value2 = obj2.intValue();
		int value3 = obj3.intValue();
		
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);
	}

}
