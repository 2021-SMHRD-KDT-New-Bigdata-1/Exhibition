package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.exhVO;

public class exhDAO {
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
		
		public ArrayList<exhVO> selectAll(){
			
			ArrayList<exhVO> list = new ArrayList<exhVO>();
			conn();
			
			try {
				String sql = "select * from exhibitions";
				psmt = conn.prepareStatement(sql);
				
				rs = psmt.executeQuery();
				while(rs.next()) {
					int col1 = rs.getInt(1);
					int col2 = rs.getInt(2);
					int col3 = rs.getInt(3);
					int col4 = rs.getInt(4);
					String col5 = rs.getString(5);
					String col6 = rs.getString(6);
					String col7 = rs.getString(7);
					String col8 = rs.getString(8);
					String col9 = rs.getString(9);
					
					list.add(new exhVO(col1,col2,col3,col4,col5,col6,col7,col8,col9));
				}
				
			}catch(Exception e) {e.printStackTrace();}finally {close();}
			
			return list;
		}
		
		public ArrayList<exhVO> selectDay(int year,int month,int day){
			
			ArrayList<exhVO> list = new ArrayList<exhVO>();
			conn();
			
			try {
				String sql = "select * from exhibitions where ex_year=? and ex_month=? and ex_day=?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, year);
				psmt.setInt(2, month);
				psmt.setInt(3, day);
				
				rs = psmt.executeQuery();
				while(rs.next()) {
					int col1 = rs.getInt(1);
					//int col2 = rs.getInt(2);
					//int col3 = rs.getInt(3);
					//int col4 = rs.getInt(4);
					String col5 = rs.getString(5);
					String col6 = rs.getString(6);
					String col7 = rs.getString(7);
					String col8 = rs.getString(8);
					String col9 = rs.getString(9);
				
				list.add(new exhVO(col1,year,month,day,col5,col6,col7,col8,col9));
				}
				
			}catch(Exception e) {e.printStackTrace();}finally {close();}
			
			return list;
		}
		
}