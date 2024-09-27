package sec03.exam03;

public class ByteOperationExample {
	public static void main(String[] args) {
		//정수 연산에서의 자동타입 변환(byte 예제)
		byte result1 = 10 + 20;
		System.out.println(result1);
		
		byte x =10;
		byte y = 20;
		int result2 = x + y;
		System.out.println(result2);
		// --------------------------------------------------
		// 정수 연산에서의 자동타입 변환(long 예제)
		byte value1 = 10;
		int value2 = 100;
		long value3 = 1000L;
		long result = value1 + value2 + value3;
		System.out.println(result);
	}

}
