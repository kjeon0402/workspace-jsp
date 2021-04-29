package day11;

import java.io.Serializable;

public class VO implements Serializable{	// Value Object
	
	private static final long serialVersionUID = 3655367693910701833L;

	private String writer, date, content;
	
	@Override
	public String toString() {
		return this.writer;
	}
	
	public VO() {}
	public VO(String writer, String date, String content) {
		this.writer = writer;
		this.date = date;
		this.content = content;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
