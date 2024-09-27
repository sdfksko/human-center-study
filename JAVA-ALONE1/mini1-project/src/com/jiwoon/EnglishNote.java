package com.jiwoon;

import java.io.*;

public class EnglishNote implements Serializable {
	
	private int eNum;
	private String english;
	private String answer;
	
	public EnglishNote() {
		
	}
	
	public EnglishNote(String k) {
		
	}
	
	public int geteNum() {
		return eNum;
	}
	public void seteNum(int eNum) {
		this.eNum = eNum;
	}
	public String getEnglish() {
		return english;
	}
	public void setEnglish(String english) {
		this.english = english;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
	
}
