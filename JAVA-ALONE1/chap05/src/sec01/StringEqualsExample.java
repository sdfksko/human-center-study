package sec01;

public class StringEqualsExample {
	public static void main(String[] args) {
		
		String strVar1 = "신민철"; //String은 참조타입(reference type)
		String strVar2 = "신민철";
		
		if(strVar1 == strVar2) {
			System.out.println("strVar1과 strVar2는 참조가 같음");
		} else {
			System.out.println("strVar1과 strVar2는 참조가 다름");
		}
		
		if(strVar1.equals(strVar2)) {
			System.out.println("strVar1과 strVar2는 문자열이 같음");
		}
		
		String strVar3 = new String("신민철");
		String strVar4 = new String("신민철");
		
		if(strVar3 == strVar4) {
			System.out.println("strVar3가 strVar4는 참조가 같음");
		} else {
			System.out.println("strVar3과 strVar4는 참조가 다름");
		}
		
		if(strVar1 == strVar3) {
			System.out.println("strVar1가 strVar3는 참조가 같음");
		} else {
			System.out.println("strVar1가 strVar3는 참조가 다름");
		}
		
		// 참조 타입의 변수들은 모두 null이란 걸 가진다.
		String str = null; // "" -> empty
		System.out.println("총 문자수" + str.length());  //NullPointerException이 나서 에러
		// 기본 타입(primitive type)은 null 가질 수 없다.
		// int intValue1 = null;
	}
}
