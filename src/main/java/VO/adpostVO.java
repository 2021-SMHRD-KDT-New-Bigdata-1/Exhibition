package VO;


public class adpostVO {
	

	private int seq;
	private String nick;
	private String content;
	private String date;
	private String region;
	private String genre;
	private String color;
	private int like_cnt;
	private String like_nick;
	private String ad_comment;
	private String ad_title;
	
	//이미지 이름을 넣어줄 컬럼 추가생성했음
	private String ad_img_name;
	
	//전체생성자
	public adpostVO(int seq, String nick, String content, String date, String region, String genre, String color,
			int like_cnt, String like_nick, String ad_comment, String ad_title, String ad_img_name) {
		super();
		this.seq = seq;
		this.nick = nick;
		this.content = content;
		this.region = region;
		this.date = date;
		this.genre = genre;
		this.color = color;
		this.like_cnt = like_cnt;
		this.like_nick = like_nick;
		this.ad_comment = ad_comment;
		this.ad_title = ad_title;
		this.ad_img_name = ad_img_name;
	}
	
	

	public adpostVO(String nick, String content, String region, String genre, String color) {
		super();
		this.nick = nick;
		this.content = content;
		this.region = region;
		this.genre = genre;
		this.color = color;
	}

	public adpostVO(int seq, String nick, String content, String date, String region, String genre, String color) {
		super();
		this.seq = seq;
		this.nick = nick;
		this.content = content;
		this.date = date;
		this.region = region;
		this.genre = genre;
		this.color = color;
	}

	//ad posting 찐막
	public adpostVO(String nick, String content, String date, String region, String genre, String color,
			String ad_title, String ad_img_name) {
		super();
		this.nick = nick;
		this.content = content;
		this.date = date;
		this.region = region;
		this.genre = genre;
		this.color = color;
		this.ad_title = ad_title;
		this.ad_img_name = ad_img_name;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
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
	
	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public String getLike_nick() {
		return like_nick;
	}

	public void setLike_nick(String like_nick) {
		this.like_nick = like_nick;
	}

	public String getAd_comment() {
		return ad_comment;
	}

	public void setAd_comment(String ad_comment) {
		this.ad_comment = ad_comment;
	}

	public String getAd_title() {
		return ad_title;
	}

	public void setAd_title(String ad_title) {
		this.ad_title = ad_title;
	}

	public String getAd_img_name() {
		return ad_img_name;
	}

	public void setAd_img_name(String ad_img_name) {
		this.ad_img_name = ad_img_name;
	}
	

}
