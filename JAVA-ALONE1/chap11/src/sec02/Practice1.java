package sec02;

import java.text.*;
import java.util.*;

public class Practice1 {

	public static void main(String[] args) {
		Date now = new Date();
		String strNow1 = now.toString();
		
		SimpleDateFormat sdf =
				new SimpleDateFormat("yyyy년 MM월 dd일 E요일 HH시 MM분");
		String strNow2 = sdf.format(now);
		System.out.println(strNow2);

	}

}
