package sec02;

public class ThrowExample {
	
	public static void findClass()
			throws ClassNotFoundException,
			NumberFormatException,
			ArrayIndexOutOfBoundsException
	{
		Class clazz = Class.forName("java.lang.String2");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			findClass();
		} catch(ClassNotFoundException e) {
			System.out.println("클래스가 존재하지 않습니다.");
		} catch(NumberFormatException e) {
			System.out.println("잘못된 문자가 들어가 있습니다.");
		} catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("설정된 배열의 크기를 넘은 값을 넣었습니다.");
		} finally {
			System.out.println("종료되었습니다.");
		}

	}

}
