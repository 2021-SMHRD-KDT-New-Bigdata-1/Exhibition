package VO;

public class exhVO {
	private int ex_seq;
	private int ex_year;
	private int ex_month;
	private int ex_day;
	private String ex_title;
	private String ex_date;
	private String ex_location;
	private String ex_content;
	private String ex_writer_nick;
	
	public exhVO(int ex_seq, int ex_year, int ex_month, int ex_day, String ex_title, String ex_date, String ex_location,
			String ex_content, String ex_writer_nick) {
		super();
		this.ex_seq = ex_seq;
		this.ex_year = ex_year;
		this.ex_month = ex_month;
		this.ex_day = ex_day;
		this.ex_title = ex_title;
		this.ex_date = ex_date;
		this.ex_location = ex_location;
		this.ex_content = ex_content;
		this.ex_writer_nick = ex_writer_nick;
	}

	public int getEx_seq() {
		return ex_seq;
	}

	public void setEx_seq(int ex_seq) {
		this.ex_seq = ex_seq;
	}

	public int getEx_year() {
		return ex_year;
	}

	public void setEx_year(int ex_year) {
		this.ex_year = ex_year;
	}

	public int getEx_month() {
		return ex_month;
	}

	public void setEx_month(int ex_month) {
		this.ex_month = ex_month;
	}

	public int getEx_day() {
		return ex_day;
	}

	public void setEx_day(int ex_day) {
		this.ex_day = ex_day;
	}

	public String getEx_title() {
		return ex_title;
	}

	public void setEx_title(String ex_title) {
		this.ex_title = ex_title;
	}

	public String getEx_date() {
		return ex_date;
	}

	public void setEx_date(String ex_date) {
		this.ex_date = ex_date;
	}

	public String getEx_location() {
		return ex_location;
	}

	public void setEx_location(String ex_location) {
		this.ex_location = ex_location;
	}

	public String getEx_content() {
		return ex_content;
	}

	public void setEx_content(String ex_content) {
		this.ex_content = ex_content;
	}

	public String getEx_writer_nick() {
		return ex_writer_nick;
	}

	public void setEx_writer_nick(String ex_writer_nick) {
		this.ex_writer_nick = ex_writer_nick;
	}
	
}
