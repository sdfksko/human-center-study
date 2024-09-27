package sec02;

import java.text.*;
import java.util.*;

public class DataExample {

	public static void main(String[] args) {
		Date now = new Date();
		String strNow1 = now.toString();
		System.out.println(strNow1);
		
		SimpleDateFormat sdf =
				new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
		String strNow2 = sdf.format(now);
		System.out.println(strNow2);
		
		// yyyy-MM-dd-HH:mm:ss
		SimpleDateFormat sdf2 =
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strNow3 = sdf2.format(now);
		System.out.println(strNow3);
		
		// dd/mm/yyyy hh:mm:ss
		SimpleDateFormat sdf3 =
				new SimpleDateFormat("dd/mm/yyyy hh:mm:ss");
		String strNow4 = sdf3.format(now);
		System.out.println(strNow4);
		
	}

}
