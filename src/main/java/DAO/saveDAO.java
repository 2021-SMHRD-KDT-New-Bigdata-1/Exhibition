package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.saveVO;

public class saveDAO {
	
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
	
	//저장하기 버튼 클릭 시 saved_reviews 테이블에 저장
	public int save(int seq, String nick) {
		
		int cnt = 0;
		conn();

		try {
			String sql = "insert into saved_reviews values(SAVED_REVIEWS_SEQ.NEXTVAL,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, " "); //우선 메모값은 null
			psmt.setString(2, nick);
			psmt.setInt(3, seq); //게시물 고유 seq
			
			cnt = psmt.executeUpdate();
			
			
		}catch(Exception e) {e.printStackTrace();} finally {close();}
		
		return cnt;
	}
	
	//북마크 아이콘 클릭 시 로그인한 닉네임이 저장한 게시물들 보이도록
	public ArrayList<saveVO> savepostselect(String nick){
		
		ArrayList<saveVO> AL = new ArrayList<saveVO>(); //!!!!
		conn();
		String sql = "select * from saved_reviews s INNER JOIN post_reviews p ON s.rv_num = p.rv_seq and s.mb_nick = ? order by p.like_cnt desc";
		//중복제거 코드..필요
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
	
	//저장 취소 버튼 클릭 시 저장 테이블에서 삭제
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
	
	//메모
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
	
	//메모 출력을 위함
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
	
	//이미 저장되어있는지 확인하는 메소드
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
