package sec06.exam05.package2;

import sec06.exam05.package1.A;

public class C {
	public C() {
		A a = new A();
		a.field1 = 1;
		a.field2 = 1;	//error(접근제한이 default로 되어있어서)
		a.field3 = 1;	//error(접근제한이 private로 되어있어서)
		
		a.method1();
		a.method2();	//error(접근제한이 default로 되어있어서)
		a.method3();	//error(접근제한이 private로 되어있어서)
	}

}
