package sec01;

import java.io.*;

public class WriteExample {
	public static void main(String[] args) throws Exception {
		//OutputStream os = new FileOutputStream("./bin/sec01/test1.db"); // 혅재 실행 위치(chap14)에서 이전데이터 파일을 만듬.
		OutputStream os = new FileOutputStream("./bin/sec01/test2.db"); // 혅재 실행 위치(chap14)에서 이전데이터 파일을 만듬.
		//OutputStream os = new FileOutputStream("./bin/sec01/test3.db"); // 혅재 실행 위치(chap14)에서 이전데이터 파일을 만듬.
		
		//byte a = 10;
		//byte b = 20;
		//byte c = 30;
		//os.write(a);	// 1byte씩 데이터를 출력
		//os.write(b);
		//os.write(c);
		
		byte[] array = { 10, 20, 30 };
		os.write(array);	// 배열 전체를 출력
		
		//byte[] array = { 10, 20, 30, 40 ,50 };
		//os.write(array, 1, 3); // 1번 인덱스 값부터 3개값을 버퍼에 출력(20, 30 ,40)
		
		os.flush(); 	// test1.db파일에 실제 남아있는 버퍼에 모든 바이트를 출력
		os.close(); 	// 출력 스트림을 닫음
		
		System.out.println("프로그램 종료");
	}

}
