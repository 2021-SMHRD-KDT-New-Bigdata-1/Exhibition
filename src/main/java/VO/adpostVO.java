package VO;

import java.util.Date;

public class adpostVO {
	
	private int seq;
	private String nick;
	private String content;
	private String region;
	private Date date;
	private String genre;
	private String color;
	
	
	public adpostVO(String nick, String content, String region, String genre, String color) {
		super();
		this.nick = nick;
		this.content = content;
		this.region = region;
		this.genre = genre;
		this.color = color;
	}

	public adpostVO(int seq, String nick, String content, Date date, String region, String genre, String color) {
		super();
		this.seq = seq;
		this.nick = nick;
		this.content = content;
		this.date = date;
		this.region = region;
		this.genre = genre;
		this.color = color;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	

}
