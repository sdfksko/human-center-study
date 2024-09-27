package com.boochung1;

public class Container <E, F> {
	private E key;
	private F value;
	
	public void set(E key, F value) {
		this.key = key;
		this.value = value;
	}
	
	public E get() {
		return key;
	}
	
	public E getKey() {
		return key;
	}
	
	public F getValue() {
		return value;
	}
}
