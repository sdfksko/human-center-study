package sec06.exam05.package1;

public class B {
	public B() {
		A a = new A();
		a.field1 = 1;
		a.field2 = 1;
		a.field3 = 1;	//error(접근제한이 private로 되어있어서)
		
		a.method1();
		a.method2();
		a.method3();	//error(접근제한이 private로 되어있어서)
	}

}
