package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.saveVO;

public class likeDAO {

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
		
		public int like(int seq) {
			
			int cnt = 0;
			conn();
			
			try {
				String sql = "update post_reviews set like_cnt= like_cnt+1 where rv_seq=?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, seq); //�Խù� ���� seq
				
				cnt = psmt.executeUpdate();
				
				
			}catch(Exception e) {e.printStackTrace();} finally {close();}
			
			return cnt;
		}
		
		
		
	}

