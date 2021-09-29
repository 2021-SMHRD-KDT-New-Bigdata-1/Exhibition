package VO;

import java.util.Date;

public class adsaveVO {
	private int saved_ad_rv_seq;
	private String ad_my_memo;
	private String ad_mb_nick;
	private int ad_rv_num;
	
	//innerjoin
	private int ad_rv_seq ; //ad_rv_seq
	private String mb_nick; //mb_nick_1
	private String ad_content ; //ad_content
	private Date ad_date ; //ad_date
	private String region_tag; //region_tag
	private String genre_tag ; //genre_tag
	private String color_tag ; //color_tag
	private int ad_like_cnt; //ad_like_cnt
	private String ad_like_nick; //ad_like_nick
	private String ad_comment ; //ad_comment
	private String ad_title ; //ad_title
	
	//기본생성자 + innerjoin 결과 객체 담기 위함
	public adsaveVO(int saved_ad_rv_seq, String ad_my_memo, String ad_mb_nick, int ad_rv_num, int ad_rv_seq,
			String mb_nick, String ad_content, Date ad_date, String region_tag, String genre_tag, String color_tag,
			int ad_like_cnt, String ad_like_nick, String ad_comment, String ad_title) {
		super();
		this.saved_ad_rv_seq = saved_ad_rv_seq;
		this.ad_my_memo = ad_my_memo;
		this.ad_mb_nick = ad_mb_nick;
		this.ad_rv_num = ad_rv_num;
		this.ad_rv_seq = ad_rv_seq;
		this.mb_nick = mb_nick;
		this.ad_content = ad_content;
		this.ad_date = ad_date;
		this.region_tag = region_tag;
		this.genre_tag = genre_tag;
		this.color_tag = color_tag;
		this.ad_like_cnt = ad_like_cnt;
		this.ad_like_nick = ad_like_nick;
		this.ad_comment = ad_comment;
		this.ad_title = ad_title;
	}
	
	public adsaveVO(int saved_ad_rv_seq, String ad_my_memo, String ad_mb_nick, int ad_rv_num) {
		super();
		this.saved_ad_rv_seq = saved_ad_rv_seq;
		this.ad_my_memo = ad_my_memo;
		this.ad_mb_nick = ad_mb_nick;
		this.ad_rv_num = ad_rv_num;
	}


	public int getSaved_ad_rv_seq() {
		return saved_ad_rv_seq;
	}

	public void setSaved_ad_rv_seq(int saved_ad_rv_seq) {
		this.saved_ad_rv_seq = saved_ad_rv_seq;
	}

	public String getAd_my_memo() {
		return ad_my_memo;
	}

	public void setAd_my_memo(String ad_my_memo) {
		this.ad_my_memo = ad_my_memo;
	}

	public String getAd_mb_nick() {
		return ad_mb_nick;
	}

	public void setAd_mb_nick(String ad_mb_nick) {
		this.ad_mb_nick = ad_mb_nick;
	}

	public int getAd_rv_num() {
		return ad_rv_num;
	}

	public void setAd_rv_num(int ad_rv_num) {
		this.ad_rv_num = ad_rv_num;
	}
	

	public int getAd_rv_seq() {
		return ad_rv_seq;
	}

	public void setAd_rv_seq(int ad_rv_seq) {
		this.ad_rv_seq = ad_rv_seq;
	}

	public String getMb_nick() {
		return mb_nick;
	}

	public void setMb_nick(String mb_nick) {
		this.mb_nick = mb_nick;
	}

	public String getAd_content() {
		return ad_content;
	}

	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
	}

	public Date getAd_date() {
		return ad_date;
	}

	public void setAd_date(Date ad_date) {
		this.ad_date = ad_date;
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

	public int getAd_like_cnt() {
		return ad_like_cnt;
	}

	public void setAd_like_cnt(int ad_like_cnt) {
		this.ad_like_cnt = ad_like_cnt;
	}

	public String getAd_like_nick() {
		return ad_like_nick;
	}

	public void setAd_like_nick(String ad_like_nick) {
		this.ad_like_nick = ad_like_nick;
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

}
