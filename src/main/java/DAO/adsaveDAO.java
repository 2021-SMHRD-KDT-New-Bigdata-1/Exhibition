package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import VO.adsaveVO;
import VO.saveVO;

public class adsaveDAO {
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
		
		//�����ϱ� ��ư Ŭ�� �� saved_ad_reviews ���̺� ����
		public int save(int seq, String nick) {
			int cnt = 0;
			conn();
			try {
				String sql = "insert into saved_ad_reviews values(SAVED_AD_REVIEWS_SEQ.NEXTVAL,?,?,?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, " "); //�켱 �޸��� null
				psmt.setString(2, nick);
				psmt.setInt(3, seq); //�Խù� ���� seq
				cnt = psmt.executeUpdate();
				
			}catch(Exception e) {e.printStackTrace();} finally {close();}
			
			return cnt;
		}
		
		//�̹� ����Ǿ��ִ��� Ȯ���ϴ� �޼ҵ�
		public boolean check(int seq, String nick) {
			conn();
			boolean result = false;
			try {
				String sql = "select * from saved_ad_reviews where ad_rv_num=? and mb_nick = ?";
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
			
			
			//���� ��� ��ư Ŭ�� �� ���� ���̺��� ����
			public int delSave(int seq, String nick) {
				
				int cnt = 0;
				conn();
				try {
					String sql = "delete from saved_ad_reviews where ad_rv_num=? and mb_nick=?";
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
					String sql = "update saved_ad_reviews set ad_my_memo = ? where ad_rv_num=? and mb_nick=?";
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
					String sql = "select ad_my_memo from saved_ad_reviews where ad_rv_num=? and mb_nick = ?";
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
			
			//�ϸ�ũ ������ Ŭ�� �� �α����� �г����� ������ �Խù��� ���̵���
			public ArrayList<adsaveVO> savepostselect(String nick){
				
				ArrayList<adsaveVO> AL = new ArrayList<adsaveVO>(); //!!!!
				conn();
				String sql = "select * from saved_ad_reviews s INNER JOIN ad_reviews a ON s.ad_rv_num = a.ad_rv_seq and s.mb_nick = ? order by a.ad_like_cnt desc";
				//�ߺ����� �ڵ�..�ʿ�
				try {
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, nick);
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						//s
						int col1  = rs.getInt(1); //saved_ad_rv_seq
						String col2 = rs.getString(2); //ad_my_memo
						String col3 = rs.getString(3); //ad_mb_nick
						int col4 = rs.getInt(4); //ad_rv_num
						//a
						int seq = rs.getInt(5); //ad_rv_seq
						String nick1 = rs.getString(6); //mb_nick_1
						String content = rs.getString(7); //ad_content
						Date date = rs.getDate(8); //ad_date
						String region_tag = rs.getString(9); //region_tag
						String genre_tag = rs.getString(10); //genre_tag
						String color_tag = rs.getString(11); //color_tag
						int like_cnt = rs.getInt(12); //ad_like_cnt
						String like_nick = rs.getString(13); //ad_like_nick
						String comment = rs.getString(14); //ad_comment
						String title = rs.getString(15); //ad_title
						
						adsaveVO vo = new adsaveVO(col1,col2,col3,col4,seq,nick1,content,date,
								region_tag,genre_tag,color_tag,
								like_cnt,like_nick,comment,title);
						AL.add(vo);
					}
					
				}catch(Exception e) {e.printStackTrace();}finally {close();}
				
				
				return AL;
			}
		
}
