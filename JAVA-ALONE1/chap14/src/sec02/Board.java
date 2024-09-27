package sec02;

import java.util.Date;
import java.io.Serializable;

//입출력을 하려면 Serializable를 꼭 implements해야 한다.
public class Board implements Serializable {
	// 사용하는 필드(게시판 번호, 제목, 내용, 작성자, 작성날짜)
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date date;

	// 생성자
	public Board(int bno, String title, String content, String writer, Date date) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.date = date;
	}
	
	// 메소드(getter, setter)
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	

}
