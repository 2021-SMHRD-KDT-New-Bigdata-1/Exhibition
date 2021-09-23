package VO;

public class membersVO {
	
	private String MB_nick;
	private String MB_id;
	private String MB_pw;
	private String MB_tel;
	private String MB_nm;
	private String MB_type;
	private String MB_bn;
	private String like_region_tag;
	private String like_genre_tag;
	private String like_color_tag;
	
	
	public membersVO(String mB_nick, String mB_id, String mB_pw, String mB_tel, String mB_nm, String mB_type,
			String mB_bn, String like_region_tag, String like_genre_tag, String like_color_tag) {
		super();
		MB_nick = mB_nick;
		MB_id = mB_id;
		MB_pw = mB_pw;
		MB_tel = mB_tel;
		MB_nm = mB_nm;
		MB_type = mB_type;
		MB_bn = mB_bn;
		this.like_region_tag = like_region_tag;
		this.like_genre_tag = like_genre_tag;
		this.like_color_tag = like_color_tag;
	}


	public String getMB_nick() {
		return MB_nick;
	}

	public String getMB_id() {
		return MB_id;
	}

	public String getMB_pw() {
		return MB_pw;
	}

	public String getMB_tel() {
		return MB_tel;
	}

	public String getMB_nm() {
		return MB_nm;
	}

	public String getMB_type() {
		return MB_type;
	}

	public String getMB_bn() {
		return MB_bn;
	}

	public String getLike_region_tag() {
		return like_region_tag;
	}

	public String getLike_genre_tag() {
		return like_genre_tag;
	}

	public String getLike_color_tag() {
		return like_color_tag;
	}

	public membersVO(String mB_nick, String mB_id, String mB_pw, String mB_tel, String mB_nm, String mB_type,
			String mB_bn) {
		super();
		MB_nick = mB_nick;
		MB_id = mB_id;
		MB_pw = mB_pw;
		MB_tel = mB_tel;
		MB_nm = mB_nm;
		MB_type = mB_type;
		MB_bn = mB_bn;
	}
	
	
}
	
	
	
