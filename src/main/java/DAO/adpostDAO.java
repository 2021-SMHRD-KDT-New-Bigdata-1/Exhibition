package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.adpostVO;
import VO.postVO;


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
		
		//광고게시물 포스팅 메소드
		public int adposting(adpostVO vo) {
			 int cnt = 0;
			 conn();
		     
			 try {
		         String sql = "insert into ad_reviews values(AD_REVIEWS_SEQ.nextval, ?, ?, '', ?, ?, ?, ?,?,?,?)";
		         psmt = conn.prepareStatement(sql);
		         
		         psmt.setString(1, vo.getNick());
		         psmt.setString(2, vo.getContent()); //좋아요 카운트 null로 넣는거를 0으로 변경
		         psmt.setString(3, vo.getRegion());
		         //psmt.setString(3, ); date 우선 null
		         psmt.setString(4, vo.getGenre());
		         psmt.setString(5, vo.getColor());
		         psmt.setInt(6, vo.getLike_cnt());
		         psmt.setString(7, vo.getLike_nick());
		         psmt.setString(8, vo.getAd_comment());
		         psmt.setString(9, vo.getAd_title());
		         
		         cnt = psmt.executeUpdate();
		         
		         }catch(Exception e){e.printStackTrace();}finally {close();}
		      return cnt;
		}
		
		//쓸모없는거 - 창민 zzz
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
					String date = rs.getString(4);
					String ad_region = rs.getString(5);
					String ad_genre = rs.getString(6);
					String ad_color = rs.getString(7);
					String m_nick = rs.getString(8);
					String m_id = rs.getString(9);
				}
				
			} catch(Exception e) {} finally {}
			return list;
		}
		
		//게시물 보기 기능 - seq값에 맞는 게시물 출력
				public ArrayList<adpostVO> onepost(int seq){
					
					conn();
					ArrayList<adpostVO> list = new ArrayList<adpostVO>();
					
					try {
						String sql = "select * from ad_reviews where ad_rv_seq= ?";
						psmt = conn.prepareStatement(sql);
						psmt.setInt(1, seq);
						
						rs = psmt.executeQuery();
						while(rs.next()) {
							int ad_seq = rs.getInt(1);
							String ad_nick = rs.getString(2);
							String ad_content = rs.getString(3);
							String date = rs.getString(4);
							String ad_region = rs.getString(5);
							String ad_genre = rs.getString(6);
							String ad_color = rs.getString(7);
							int ad_like_cnt = rs.getInt(8);
							String ad_like_nick = rs.getString(9);
							String ad_like_comment = rs.getString(10);
							String ad_title = rs.getString(11);
							
							list.add(new adpostVO(
									ad_seq,ad_nick,ad_content,date,
									ad_region,ad_genre,ad_color,
									ad_like_cnt,ad_like_nick,ad_like_comment,ad_title));
						}
						
					} catch(Exception e) {e.printStackTrace();} finally {close();}
					
					return list; 
				}
				
				//ad 모든 게시물 보기
				public ArrayList<adpostVO> allpost() {
					conn();
					ArrayList<adpostVO> list = new ArrayList<>();
					try {
						String sql = "select * from ad_reviews";
						psmt = conn.prepareStatement(sql);
						rs = psmt.executeQuery();
						
						while(rs.next()) {
							int ad_seq = rs.getInt(1);
							String ad_nick = rs.getString(2);
							String ad_content = rs.getString(3);
							String date = rs.getString(4);
							String ad_region = rs.getString(5);
							String ad_genre = rs.getString(6);
							String ad_color = rs.getString(7);
							int ad_like_cnt = rs.getInt(8);
							String ad_like_nick = rs.getString(9);
							String ad_like_comment = rs.getString(10);
							String ad_title = rs.getString(11);
							
							list.add(new adpostVO(
									ad_seq,ad_nick,ad_content,date,
									ad_region,ad_genre,ad_color,
									ad_like_cnt,ad_like_nick,ad_like_comment,ad_title));
						}
					} catch(Exception e) {e.printStackTrace();} finally {close();}
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
				
				//좋아요 눌렀는지 확인위한 데이터 꺼내기
				public String likeselect(int seq) {
					String like_origin = "";
					conn();
					try {
						String sql = "select ad_like_nick from ad_reviews where ad_rv_seq = ?";
						psmt = conn.prepareStatement(sql);
						psmt.setInt(1, seq);
						
						rs = psmt.executeQuery();
						while(rs.next()) {
							like_origin = rs.getString(1);
						}
						
					} catch(Exception e) {e.printStackTrace();} finally {close();}
					return like_origin;
				}
				
				//좋아요+1
				public int likeplus(int seq, String nick) {
					int cnt = 0;
					conn();
					try {
						String sql = "update ad_reviews set ad_like_cnt=ad_like_cnt+1 where ad_rv_seq=?";
						psmt = conn.prepareStatement(sql);
						psmt.setInt(1, seq);
						
						cnt = psmt.executeUpdate();
						
					}catch(Exception e) {e.printStackTrace();}finally {close();}
					return cnt;
				}
				
				public int likenickUpdate(int seq, String like_new) {
					int cnt = 0;
					conn();
					try {
						String sql = "update ad_reviews set ad_like_nick = ? where ad_rv_seq=?";
						psmt = conn.prepareStatement(sql);
						System.out.println(seq);
						System.out.println(like_new);
						psmt.setString(1, like_new);
						psmt.setInt(2, seq);
						
						cnt = psmt.executeUpdate();
						
						
					}catch(Exception e) {e.printStackTrace();}finally {close();}
					return cnt;
				}
				
				//좋아요-1
				public int likeminus(int seq, String nick) {
					int cnt = 0;
					conn();
					try {
						String sql = "update ad_reviews set ad_like_cnt=ad_like_cnt-1 where ad_rv_seq=?";
						psmt = conn.prepareStatement(sql);
						psmt.setInt(1, seq);
						
						cnt = psmt.executeUpdate();
						
					}catch(Exception e) {e.printStackTrace();}finally {close();}
					return cnt;
				}
				
				//기존의 댓글 셀렉으로 가져옴
				public String selectComment(int seq) {
					
					conn();
					String c_origin = "";
					try {
						String sql = "select ad_comment from ad_reviews where ad_rv_seq= ?";
						psmt= conn.prepareStatement(sql);
						psmt.setInt(1,seq);
						
						rs = psmt.executeQuery();
						while(rs.next()) {
							c_origin = rs.getString(1);
						}
					}catch(Exception e) {e.printStackTrace();}finally {close();}
					
					return c_origin;
				}
				
				public int updateComment(int seq, String comment) {
					int cnt = 0;
					conn();
					try {
						String sql = "update ad_reviews set ad_comment = ? where ad_rv_seq=?";
						psmt = conn.prepareStatement(sql);
						psmt.setString(1, comment);
						psmt.setInt(2, seq);
						
						cnt = psmt.executeUpdate();
						
					}catch(Exception e) {e.printStackTrace();}finally {close();}
					
					
					return cnt;
				}
}
