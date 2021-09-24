package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
