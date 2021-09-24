package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.saveVO;

public class saveDAO {
	
	//��������ȭ
	Connection conn = null; 
	PreparedStatement psmt = null;
	ResultSet rs = null;
		
	//DB ���� �޼ҵ�
	public void conn() {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe"; //1521�� ����Ŭ�� ��Ʈ(��)��ȣ
		String dbid = "cgi_6_4";
		String dbpw = "smhrd4";
		conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
		
	//DB ���� ��ü ��ȯ �޼ҵ�
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//�����ϱ� ��ư Ŭ�� �� saved_reviews ���̺� ����
	public int save(int seq, String nick) {
		
		int cnt = 0;
		conn();

		try {
			String sql = "insert into saved_reviews values(SAVED_REVIEWS_SEQ.NEXTVAL,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, " "); //�켱 �޸��� null
			psmt.setString(2, nick);
			psmt.setInt(3, seq); //�Խù� ���� seq
			
			cnt = psmt.executeUpdate();
			
			
		}catch(Exception e) {e.printStackTrace();} finally {close();}
		
		return cnt;
	}
	
	//�ϸ�ũ ������ Ŭ�� �� �α����� �г����� ������ �Խù��� ���̵���
	public ArrayList<saveVO> savepostselect(String nick){
		
		ArrayList<saveVO> AL = new ArrayList<saveVO>(); //!!!!
		conn();
		String sql = "select * from saved_reviews s INNER JOIN post_reviews p ON s.rv_num = p.rv_seq and s.mb_nick = ? order by p.like_cnt desc";
		//�ߺ����� �ڵ�..�ʿ�
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nick);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				//s
				int col1  = rs.getInt(1); //saved_rv_seq
				String col2 = rs.getString(2); //saved_my_memo
				String col3 = rs.getString(3); //mb_nick
				int col4 = rs.getInt(4); //rv_num
				//p
				int seq = rs.getInt(5);
				String content = rs.getString(6);
				int cnt = rs.getInt(7);
				String nick1 = rs.getString(8);
				String title = rs.getString(9);
				String region_tag = rs.getString(10);
				String genre_tag = rs.getString(11);
				String color_tag = rs.getString(12);
				
				saveVO vo = new saveVO(col1,col2,col3,col4,seq,content,cnt,nick1,title,region_tag,genre_tag,color_tag);
				AL.add(vo);
			}
			
		}catch(Exception e) {e.printStackTrace();}finally {close();}
		
		
		return AL;
	}
	
	//���� ��� ��ư Ŭ�� �� ���� ���̺��� ����
	public int delSave(int seq, String nick) {
		
		int cnt = 0;
		conn();
		try {
			String sql = "delete from saved_reviews where rv_num=? and mb_nick=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.setString(2, nick);
			cnt = psmt.executeUpdate();
		} catch(Exception e) {e.printStackTrace();} finally {close();}
		return cnt;
	}
	
	//�޸�
	public int memo(int seq, String nick, String memo) {
		int cnt = 0;
		conn();
		try {
			String sql = "update saved_reviews set my_memo = ? where rv_num=? and mb_nick=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memo);
			psmt.setInt(2, seq);
			psmt.setString(3, nick);
			cnt = psmt.executeUpdate();
		} catch(Exception e) {e.printStackTrace();} finally {close();}
		
		return cnt;
	}
	
	//�޸� ����� ����
	public String memoSelect(int seq, String nick) {
		String mm = null;
		conn();
		try {
			String sql = "select my_memo from saved_reviews where rv_num=? and mb_nick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.setString(2, nick);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				mm = rs.getString(1);
			}
			
		} catch(Exception e) {e.printStackTrace();} finally {close();}
		
		
		return mm;
		
	}
	
	//�̹� ����Ǿ��ִ��� Ȯ���ϴ� �޼ҵ�
	public boolean check(int seq, String nick) {
		conn();
		boolean result = false;
		try {
			String sql = "select * from saved_reviews where rv_num=? and mb_nick = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,seq);
			psmt.setString(2, nick);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result=true;
			}else {
				result=false;
			}
			
		} catch(Exception e) {e.printStackTrace();} finally {close();}
		return result;
		
		
		
	}
}
