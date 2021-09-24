package VO;

public class saveVO {
	private int saved_rv_seq;
	private String my_memo;
	private String mb_nick;
	private int rv_num;
	
	
	public saveVO(int saved_rv_seq, String my_memo, String mb_nick, int rv_num) {
		super();
		this.saved_rv_seq = saved_rv_seq;
		this.my_memo = my_memo;
		this.mb_nick = mb_nick;
		this.rv_num = rv_num;
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
	
}
