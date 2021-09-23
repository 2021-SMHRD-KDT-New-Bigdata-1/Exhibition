package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import VO.membersVO;

public class membersDAO {
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
		
		//로그인 메소드
		public membersVO login(String id, String pw) {
			
			conn();
			membersVO vo = null;
			
			try {
				String sql = "select * from members where MB_ID = ? and MB_PW = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pw);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					String nick = rs.getString(1); //닉네임 받아오기
					//rs.getString(2);
					//rs.getString(3);
					String tel = rs.getString(4);
					String nm = rs.getString(5);
					String type = rs.getString(6);
					String bn = rs.getString(7);
					String region_tag = rs.getString(8);
					String genre_tag = rs.getString(9);
					String color_tag = rs.getString(10);
				
					vo = new membersVO(nick,id,pw,tel,nm,type,bn,region_tag,genre_tag,color_tag);
				}
				
			}catch(Exception e){e.printStackTrace();}finally {close();} 
			return vo;
		}

		//회원가입 메소드
		public int join(membersVO vo) {
		      
		      int cnt = 0;
		      conn();
		      
		      try {
		         
		         String sql = "insert into MEMBERS values(?, ?, ?, ?, ?, ?, ?, null, null, null)";
		         psmt = conn.prepareStatement(sql);
		         
		         psmt.setString(1, vo.getMB_nick());
		         psmt.setString(2, vo.getMB_id());
		         psmt.setString(3, vo.getMB_pw());
		         psmt.setString(4, vo.getMB_tel());
		         psmt.setString(5, vo.getMB_nm());
		         psmt.setString(6, vo.getMB_type());
		         psmt.setString(7, vo.getMB_bn());
		         
		         cnt = psmt.executeUpdate();
		         
		         }catch(Exception e){e.printStackTrace();}finally {close();}
		      return cnt;
		      }

		public int update(String name, String id, String pw, String tel, String nick) {
			conn();
			int cnt = 0;
			try {
				//아니 근데 사업자 번호를 수정할 일이 있을까? -> 없앴음
				String sql = "update members set MB_NM = ?, MB_ID = ?, MB_PW = ?, MB_TEL=? where MB_NICK = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, name);
				psmt.setString(2, id);
				psmt.setString(3, pw);
				psmt.setString(4, tel);
				psmt.setString(5, nick);
				cnt = psmt.executeUpdate();
			}catch(Exception e) {e.printStackTrace();}finally {close();}
		return cnt;
		}
		
		public boolean idcheck(String id){
			
			boolean check = false;
			try {
				conn();
				String sql = "select * from members where mb_id =?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				
				if(rs.next()) {check = true;}
				else{check = false;}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {close();}
			
			return check;
		}
		
		public boolean nickcheck(String nick){
			
			boolean check = false;
			try {
				conn();
				String sql = "select * from members where mb_nick =?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, nick);
				rs = psmt.executeQuery();
				
				if(rs.next()) {check = true;}
				else{check = false;}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {close();}
			
			return check;
		}
		
		//태그 수정 메소드
		public int likeupdate(String like_region_tag, String like_genre_tag, String like_color_tag, String nick) {
			
			conn();
			
			int cnt =0;
			try {
			String sql  = "update members set LIKE_REGION_TAG=?, LIKE_GENRE_TAG=?,LIKE_COLOR_TAG=? WHERE MB_NICK=? ";
		
			psmt=conn.prepareStatement(sql);
			
			psmt.setString(1,like_region_tag );
			psmt.setString(2,like_genre_tag );
			psmt.setString(3,like_color_tag );
			psmt.setString(4,nick );
			
			cnt = psmt.executeUpdate();
			
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;
		}
}
