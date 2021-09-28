package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.adpostVO;


public class adpostDAO {
	
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
		
		public int adposting(adpostVO vo) {
			
			 int cnt = 0;
		      
			 conn();
		      
		      try {
		    	  							
		         String sql = "insert into ad_reviews values(AD_REVIEWS_SEQ.nextval, ?, ?, sysdate, ?, ?, ?)";
		         
		         psmt = conn.prepareStatement(sql);
		         
		         
		         psmt.setString(1, vo.getNick());
		         psmt.setString(2, vo.getContent()); //좋아요 카운트 null로 넣는거를 0으로 변경
		         psmt.setString(3, vo.getRegion());
		         //psmt.setDate(3, (Date) vo.getDate());
		         psmt.setString(4, vo.getGenre());
		         psmt.setString(5, vo.getColor());
		         
		         
		         cnt = psmt.executeUpdate();
		         
		         }catch(Exception e){e.printStackTrace();}finally {close();}
		      return cnt;
		}
		
		public ArrayList<adpostVO> allsearchAD(){
			
			ArrayList<adpostVO> list = new ArrayList<adpostVO>();
			conn();
			
			try {
				String sql = "select * from post_reviews p INNER JOIN members m ON p.mb_nick = m.mb_nick where m.mb_bn is not null  ";
				
				psmt = conn.prepareStatement(sql);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int ad_seq = rs.getInt(1);
					String ad_nick = rs.getString(2);
					String ad_content = rs.getString(3);
					Date date = rs.getDate(4);
					String ad_region = rs.getString(5);
					String ad_genre = rs.getString(6);
					String ad_color = rs.getString(7);
					String m_nick = rs.getString(8);
					String m_id = rs.getString(9);
					
				}
					
					
				
				
			} catch(Exception e) {} finally {}
			return list;
		}
		

}
