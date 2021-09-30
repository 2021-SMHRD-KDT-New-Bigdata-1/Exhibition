package VO;

public class saveVO {
	private int saved_rv_seq;
	private String my_memo;
	private String mb_nick;
	private int rv_num;
	
	private int seq;
	private String content;
	private int cnt;
	private String nick;
	private String title;
	private String region_tag;
	private String genre_tag;
	private String color_tag;
	
	//img_name√ﬂ∞°
	private String img_name;
	
	public saveVO(int saved_rv_seq, String my_memo, String mb_nick, int rv_num) {
		super();
		this.saved_rv_seq = saved_rv_seq;
		this.my_memo = my_memo;
		this.mb_nick = mb_nick;
		this.rv_num = rv_num;
	}
	
	public saveVO(int saved_rv_seq, String my_memo, String mb_nick, int rv_num, int seq, String content, int cnt,
			String nick, String title, String region_tag, String genre_tag, String color_tag,String img_name) {
		super();
		this.saved_rv_seq = saved_rv_seq;
		this.my_memo = my_memo;
		this.mb_nick = mb_nick;
		this.rv_num = rv_num;
		this.seq = seq;
		this.content = content;
		this.cnt = cnt;
		this.nick = nick;
		this.title = title;
		this.region_tag = region_tag;
		this.genre_tag = genre_tag;
		this.color_tag = color_tag;
		this.img_name = img_name;
	}

	public int getSaved_rv_seq() {
		return saved_rv_seq;
	}

	public void setSaved_rv_seq(int saved_rv_seq) {
		this.saved_rv_seq = saved_rv_seq;
	}

	public String getMy_memo() {
		return my_memo;
	}

	public void setMy_memo(String my_memo) {
		this.my_memo = my_memo;
	}

	public String getMb_nick() {
		return mb_nick;
	}

	public void setMb_nick(String mb_nick) {
		this.mb_nick = mb_nick;
	}

	public int getRv_num() {
		return rv_num;
	}

	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}


}
