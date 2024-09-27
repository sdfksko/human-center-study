package com.boochung1;

// 제너릭 메소드 사용 예제
public class Util {
	public static <T> BoxGeneric<T> boxing(T t) {
		BoxGeneric<T> boxGeneric = new BoxGeneric<T>();
		boxGeneric.set(t);
		
		return boxGeneric;
	}
	
	// T로 될 수 있는 타입은 숫자로 된 타입으로 제한
	public static <T extends Number> int compare(T t1, T t2) {
		double v1 = t1.doubleValue();
		//System.out.println(t1.getClass().getName());
		double v2 = t2.doubleValue();
		//System.out.println(t2.getClass().getName());
		return Double.compare(v1, v2);
		}
}
