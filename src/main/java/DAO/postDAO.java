package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.membersVO;
import VO.postVO;

		public class postDAO {
	
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
			

	public int posting(postVO vo) {
		
		 int cnt = 0;
	      
		 conn();
	      
	      try {
	    	  							//�̹� ������ SEQ�� �̸��� Developer���� Ȯ��!
	         String sql = "insert into POST_REVIEWS values(POST_REVIEWS_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?)";
	         
	         psmt = conn.prepareStatement(sql);
	         
	         
	         psmt.setString(1, vo.getContent());
	         psmt.setInt(2, 0); //���ƿ� ī��Ʈ null�� �ִ°Ÿ� 0���� ����
	         psmt.setString(3, vo.getNick());
	         psmt.setString(4, vo.getTitle());
	         psmt.setString(5, vo.getRegion_tag());
	         psmt.setString(6, vo.getGenre_tag());
	         psmt.setString(7, vo.getColor_tag());
	         
	         cnt = psmt.executeUpdate();
	         
	         }catch(Exception e){e.printStackTrace();}finally {close();}
	      return cnt;
	      }
	
		
	public ArrayList<postVO> allpost() {
		conn();
		ArrayList<postVO> list = new ArrayList<postVO>();
		
		String sql = "select * from post_reviews order by like_cnt desc";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int seq = rs.getInt(1);
				String content = rs.getString(2);
				int cnt = rs.getInt(3);
				String nick = rs.getString(4);
				String title = rs.getString(5);
				String region_tag = rs.getString(6);
				String genre_tag = rs.getString(7);
				String color_tag = rs.getString(8);
				
				postVO vo = new postVO(seq, content, cnt, nick, title, region_tag, genre_tag, color_tag);
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {close();}
		return list;
		
	}	
	
	public int count(String tag, char bar){
		int cnt = 0;
		
		for(int i =0; i<tag.length(); i++){
			if(tag.charAt(i)==bar){
				cnt++;
			}
		}
		
	return cnt;	
	}
		
	//�˻� ��� - �켱 �Ѱ���
		public ArrayList<postVO> search(String region_tag, String genre_tag,String color_tag) {
			
			conn();
			ArrayList<postVO> list = new ArrayList<postVO>();
			
			String sql = "select * from post_reviews where region_tag = ? or genre_tag = ? or color_tag = ? order by like_cnt desc";
			
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, region_tag);
				psmt.setString(2, genre_tag);
				psmt.setString(3, color_tag);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int seq = rs.getInt(1);
					String content = rs.getString(2);
					int cnt = rs.getInt(3);
					String nick = rs.getString(4);
					String title = rs.getString(5);
					String region_tag1 = rs.getString(6);
					String genre_tag1 = rs.getString(7);
					String color_tag1 = rs.getString(8);
					
					postVO vo = new postVO(seq, content, cnt, nick, title, region_tag1, genre_tag1, color_tag1);
					
					list.add(vo);
				}
			}catch(Exception e) {e.printStackTrace();}finally {close();}
			return list;
		}
<<<<<<< HEAD
	
=======

>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/Exhibition.git
		//�Խù� ���� ��� - seq���� �´� �Խù� ���
		public ArrayList<postVO> onepost(int seq){
			
			conn();
			ArrayList<postVO> list = new ArrayList<postVO>();
			
			try {
				String sql = "select * from post_reviews where rv_seq= ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, seq);
				
				rs = psmt.executeQuery();
				while(rs.next()) {
					String content = rs.getString(2);
					int cnt = rs.getInt(3);
					String nick = rs.getString(4);
					String title = rs.getString(5);
					String region_tag1 = rs.getString(6);
					String genre_tag1 = rs.getString(7);
					String color_tag1 = rs.getString(8);
					
					postVO vo = new postVO(seq, content, cnt, nick, title, region_tag1, genre_tag1, color_tag1);
					
					list.add(vo);
				}
				
				
			} catch(Exception e) {e.printStackTrace();} finally {close();}
			
			return list; 
		}
	}


