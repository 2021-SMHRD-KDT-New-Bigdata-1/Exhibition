package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.membersVO;
import VO.postVO;

		public class postDAO {
	
			//전역변수화
			Connection conn = null; 
			PreparedStatement psmt = null;
			ResultSet rs = null;
				
			//DB 연결 메소드
			public void conn() {
				try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe"; //1521은 오라클의 포트(방)번호
				String dbid = "cgi_6_4";
				String dbpw = "smhrd4";
				conn = DriverManager.getConnection(url, dbid, dbpw);
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
				
			//DB 연결 객체 반환 메소드
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
	    	  							//이미 지정된 SEQ의 이름은 Developer에서 확인!
	         String sql = "insert into POST_REVIEWS values(SAVED_REVIEWS_SEQ.nextval, ?, null, ?, ?, ?, ?, ?)";
	         
	         psmt = conn.prepareStatement(sql);
	         
	         
	         psmt.setString(1, vo.getContent());
	         psmt.setString(2, vo.getNick());
	         psmt.setString(3, vo.getTitle());
	         psmt.setString(4, vo.getRegion_tag());
	         psmt.setString(5, vo.getGenre_tag());
	         psmt.setString(6, vo.getColor_tag());
	         
	         cnt = psmt.executeUpdate();
	         
	         }catch(Exception e){e.printStackTrace();}finally {close();}
	      return cnt;
	      }
	
		
	public ArrayList<postVO> allpost() {
		conn();
		ArrayList<postVO> list = new ArrayList<postVO>();
		
		String sql = "select * from post_reviews";
		
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
		
	}


