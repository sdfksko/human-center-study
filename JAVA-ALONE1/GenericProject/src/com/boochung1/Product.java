package com.boochung1;

// T와 M은 일반 클래스
public class Product<T, M> {
	private T kind;
	private M model;	// ex) A1-kor-pohang-123
	
	public T getKind() {
		return kind;
	}
	public void setKind(T kind) {
		this.kind = kind;
	}
	public M getModel() {
		return model;
	}
	public void setModel(M model) {
		this.model = model;
	}
}
