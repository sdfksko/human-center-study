package sec02;

import java.io.*;

public class ReadLineExample {

	public static void main(String[] args) throws Exception{
		// 문자 기반의 파일 BufferedReader로 읽어 사용한 예제
		String readPath = ReadLineExample.class.getResource("language.txt").getPath();
		Reader reader = new FileReader(readPath);
		BufferedReader br = new BufferedReader(reader); // Reader 보조 스트림 사용
		
		while(true) {
			String dataLine = br.readLine();
			if(dataLine == null) break; // 파일의 끝에 도달했을 경우 null임
			System.out.println(dataLine);
		}
		
		br.close();
	}

}
