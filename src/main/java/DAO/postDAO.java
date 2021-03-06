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
	         String sql = "insert into POST_REVIEWS values(POST_REVIEWS_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?,' ',' ',?)";
	         
	         psmt = conn.prepareStatement(sql);
	         
	         
	         psmt.setString(1, vo.getContent());
	         psmt.setInt(2, 0); //좋아요 카운트 null로 넣는거를 0으로 변경
	         psmt.setString(3, vo.getNick());
	         psmt.setString(4, vo.getTitle());
	         psmt.setString(5, vo.getRegion_tag());
	         psmt.setString(6, vo.getGenre_tag());
	         psmt.setString(7, vo.getColor_tag());
	         psmt.setString(8, vo.getImg_name());
	         
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
				String rv_comment = rs.getString(9);
				String like_nick = rs.getString(10);
				String img_name = rs.getString(11);

				postVO vo = new postVO(seq, content, cnt, nick, title, region_tag, genre_tag, color_tag,rv_comment,like_nick,img_name);

				
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
		
	//검색 기능 - 우선 한개만
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
					String comment = rs.getString(9);
					String like_nick = rs.getString(10);
					String img_name = rs.getString(11);

					postVO vo = new postVO(seq, content, cnt, nick, title, region_tag1, genre_tag1, color_tag1, comment, like_nick,img_name);

					list.add(vo);
				}
			}catch(Exception e) {e.printStackTrace();}finally {close();}
			return list;
		}

		//게시물 보기 기능 - seq값에 맞는 게시물 출력
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
					String comment = rs.getString(9);
					String like_nick = rs.getString(10);
					String img_name = rs.getString(11);

					postVO vo = new postVO(seq, content, cnt, nick, title, region_tag1, genre_tag1, color_tag1, comment,like_nick,img_name);

					list.add(vo);
				}
				
				
			} catch(Exception e) {e.printStackTrace();} finally {close();}
			
			return list; 
		}
		
		//기존의 댓글 셀렉으로 가져옴
		public String selectComment(int seq) {
			
			conn();
			String c_origin = "";
			try {
				String sql = "select rv_comment from post_reviews where rv_seq= ?";
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
				String sql = "update post_reviews set rv_comment = ? where rv_seq=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, comment);
				psmt.setInt(2, seq);
				
				cnt = psmt.executeUpdate();
				
			}catch(Exception e) {e.printStackTrace();}finally {close();}
			
			
			return cnt;
		}
		
		//좋아요 눌렀는지 확인위한 데이터 꺼내기
		public String likeselect(int seq) {
			String like_origin = "";
			conn();
			try {
				String sql = "select rv_like_nick from post_reviews where rv_seq = ?";
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
				String sql = "update post_reviews set like_cnt=like_cnt+1 where rv_seq=?";
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
				String sql = "update post_reviews set rv_like_nick = ? where rv_seq=?";
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
				String sql = "update post_reviews set like_cnt=like_cnt-1 where rv_seq=?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, seq);
				
				cnt = psmt.executeUpdate();
				
			}catch(Exception e) {e.printStackTrace();}finally {close();}
			return cnt;
		}

		
		
		//췡민의 postselect..
	      public ArrayList<postVO> postselect() {
	          ArrayList<postVO> list = new ArrayList<postVO>();
	          conn();
	          
	          try {
	             String sql = "select * from post_reviews order by like_cnt desc";
	             psmt = conn.prepareStatement(sql);
	             //psmt.setString(1, region);
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
	                String img_nick = rs.getString(11);
	                
	                postVO vo = new postVO(seq, content, cnt, nick, title, region_tag, genre_tag, color_tag,img_nick);
	                list.add(vo);
	             }
	             
	          }catch(Exception e) {
	             e.printStackTrace();
	          }finally{close();}
	          return list;
	          
	          
	       }
	      
	      public ArrayList<postVO> allpost_order_seq() {
	  		conn();
	  		ArrayList<postVO> list = new ArrayList<postVO>();
	  		
	  		String sql = "select * from post_reviews order by rv_seq desc";
	  		
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
	  				String rv_comment = rs.getString(9);
	  				String like_nick = rs.getString(10);
	  				String img_name = rs.getString(11);

	  				postVO vo = new postVO(seq, content, cnt, nick, title, region_tag, genre_tag, color_tag,rv_comment,like_nick,img_name);

	  				
	  				list.add(vo);
	  			}
	  		}catch(Exception e) {
	  			e.printStackTrace();
	  		}finally {close();}
	  		return list;
	  		
	  	}
	      
	     //작성자에 따른 게시물 모아보기
	      
	      public ArrayList<postVO> mypost(String nick) {
	    	  conn();
	    	  ArrayList<postVO> list = new ArrayList<postVO>();
	    	  String sql = "select * from post_reviews where mb_nick = ?";
	    	  try {
	    		  psmt = conn.prepareStatement(sql);
	    		  psmt.setString(1,nick);
	    		  rs = psmt.executeQuery();
	    		  
	    		  while(rs.next()) {
		  				int seq = rs.getInt(1);
		  				String content = rs.getString(2);
		  				int cnt = rs.getInt(3);
		  				
		  				String title = rs.getString(5);
		  				String region_tag = rs.getString(6);
		  				String genre_tag = rs.getString(7);
		  				String color_tag = rs.getString(8);
		  				String rv_comment = rs.getString(9);
		  				String like_nick = rs.getString(10);
		  				String img_name = rs.getString(11);

		  				postVO pvo = new postVO(seq, content, cnt, nick, title, region_tag, genre_tag, color_tag,rv_comment,like_nick,img_name);

	    			list.add(pvo);
	    		  }
	    	  } catch(Exception e) {e.printStackTrace();} finally {close();}
	    	  return list;
	      }

	}


