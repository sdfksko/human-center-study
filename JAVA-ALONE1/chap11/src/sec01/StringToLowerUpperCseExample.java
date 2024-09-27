package sec01;

public class StringToLowerUpperCseExample {

	public static void main(String[] args) {
		String str1 = "Java Programming";
		String str2 = "JAVA Programming";
		
		System.out.println(str1.equals(str2));
		
		String lowerStr1 = str1.toLowerCase();
		String lowerStr2 = str2.toLowerCase();
		System.out.println(lowerStr1);
		System.out.println(lowerStr2);
		
		System.out.println(lowerStr1.equals(lowerStr2));
		
		System.out.println(str1.equalsIgnoreCase(str2));
		
		String str3 = "Java Programming";
		String str4 = "JAVA Programming";
		
		System.out.println(str1.equals(str2));
		
		String upperStr3 = str3.toUpperCase();
		String upperStr4 = str4.toUpperCase();
		System.out.println(upperStr3);
		System.out.println(upperStr4);
		
		System.out.println(upperStr3.equals(upperStr4));
		
		System.out.println(upperStr3.equalsIgnoreCase(upperStr4));

	}

}
