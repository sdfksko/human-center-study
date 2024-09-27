package com.boochung1;

// T는 제너릭(generic)
public class BoxGeneric<A> {
	private A t;
	
	public A get() {
		return this.t;
	}
	
	public void set(A t) {
		this.t = t;
	}
}
