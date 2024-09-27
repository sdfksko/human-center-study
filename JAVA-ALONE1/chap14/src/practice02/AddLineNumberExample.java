package practice02;

import java.io.*;

public class AddLineNumberExample {

	public static void main(String[] args) throws Exception {
		String filePath = "src/practice02/AddLineNumberExample.java";
		
		int sum = 0;
		
		Reader reader = new FileReader(filePath);
		BufferedReader br = new BufferedReader(reader);
		
		/*
			for(int i = 1; i < 23; i++) {
				String dataLine = br.readLine();
				if(dataLine == null) break;
				System.out.println(i + ":" + dataLine);
				
			}
		*/
		/*
		while(true) {
			int i = 1;
			sum += i;
			String dataLine = br.readLine();
			if(dataLine == null) break;
			System.out.println(sum + ":" + dataLine);
			*/
		while(true) {
			int i = 1;
			String dataLine = br.readLine();
			if(dataLine == null) break;
			System.out.println(i + ":" + dataLine);
			i++;
		}
		br.close();
	}
}