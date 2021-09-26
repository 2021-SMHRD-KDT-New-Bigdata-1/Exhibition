package VO;

public class postVO {
	

	private int seq;
	private String content;
	private int cnt;
	private String nick;
	private String title;
	private String region_tag;
	private String genre_tag;
	private String color_tag;
	private String comment;
<<<<<<< HEAD
	private String like_nick;

	
	

	public postVO(int seq, String content, int cnt, String nick, String title, String region_tag, String genre_tag,
			String color_tag) {
=======
	private String like_nick;
	
	//전체생성자
	public postVO(int seq, String content, int cnt, String nick, String title, String region_tag, String genre_tag,
			String color_tag, String comment, String like_nick) {
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/Exhibition.git
		super();
		this.seq = seq;
		this.content = content;
		this.cnt = cnt;
		this.nick = nick;
		this.title = title;
		this.region_tag = region_tag;
		this.genre_tag = genre_tag;
		this.color_tag = color_tag;
	}
	
	//postselect을 위한 생성자
	public postVO(int seq, String content, int cnt, String nick, String title, String region_tag, String genre_tag,
			String color_tag) {
		super();
		this.seq = seq;
		this.content = content;
		this.cnt = cnt;
		this.nick = nick;
		this.title = title;
		this.region_tag = region_tag;
		this.genre_tag = genre_tag;
		this.color_tag = color_tag;
	}

<<<<<<< HEAD

		public postVO(int seq, String content, int cnt, String nick, String title, String region_tag, String genre_tag,

			String color_tag, String comment, String like_nick) {

		super();
		this.seq = seq;
		this.content = content;
		this.cnt = cnt;
		this.nick = nick;
		this.title = title;
		this.region_tag = region_tag;
		this.genre_tag = genre_tag;
		this.color_tag = color_tag;
		this.comment = comment;
		this.like_nick = like_nick;

	}




=======
	//?
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/Exhibition.git
		public postVO(String content, String nick,String title, String region_tag, String genre_tag, String color_tag) {
		super();
		this.title = content;
		this.content = nick;
		this.nick = title;
		this.region_tag = region_tag;
		this.genre_tag = genre_tag;
		this.color_tag = color_tag;
	}
		

	public postVO() {
			
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


	public String getNick() {
		return nick;
	}


	public void setNick(String nick) {
		this.nick = nick;
	}


	public String getRegion_tag() {
		return region_tag;
	}


	public void setRegion_tag(String region_tag) {
		this.region_tag = region_tag;
	}


	public String getGenre_tag() {
		return genre_tag;
	}


	public void setGenre_tag(String genre_tag) {
		this.genre_tag = genre_tag;
	}


	public String getColor_tag() {
		return color_tag;
	}


	public void setColor_tag(String color_tag) {
		this.color_tag = color_tag;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	
	
}
