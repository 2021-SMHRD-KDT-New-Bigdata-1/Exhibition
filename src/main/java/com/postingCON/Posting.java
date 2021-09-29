package com.postingCON;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.adpostDAO;
import DAO.membersDAO;
import DAO.postDAO;
import VO.adpostVO;
import VO.membersVO;
import VO.postVO;

@WebServlet("/Posting")
public class Posting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =  request.getSession();
		membersVO vo= (membersVO)session.getAttribute("vo");
		membersDAO mdao = new membersDAO();
		
		String img1 = "";
		String img2 = "";
		String img3 = "";
		
		request.setCharacterEncoding("euc-kr");
			
		
				//이미지를 위한 코드
				PrintWriter out = response.getWriter();
				String savePath = "images";
				int uploadFileSizeLimit = 20*1024*1024;
				String encType = "euc-kr";
				
				//이미지 이름을 seq번호와 맞추기 위함 -> 폴더이름을...후
				postDAO pdao = new postDAO();
				ArrayList<postVO> list = pdao.allpost_order_seq();
				int new_seq = list.get(0).getSeq()+2;
				System.out.println("포스팅 될 시퀀스 : "+new_seq);
				
				//이어서
				ServletContext context = getServletContext();
				String uploadFilePath = context.getRealPath(savePath);
				System.out.println("서버상의 실제 디렉토리 : "+uploadFilePath);
				System.out.println(uploadFilePath+"\\"+new_seq);
				
				String title = null; 
				String content = null;
				String start_date = "";
				String end_date = "";
				String date = "";
				
				String[] like_region_tag = null;
				String[] like_genre_tag = null;
				String[] like_color_tag = null;
				
				String filename = "";
				
				String f_db = "";
				
				try {//dhktlqkf
					MultipartRequest multi = new MultipartRequest(
						request,
						uploadFilePath,
						uploadFileSizeLimit,
						encType, 
						new DefaultFileRenamePolicy());
					
					Enumeration files = multi.getFileNames();
					ArrayList<String> f_name = new ArrayList<>(); //+
					
					while(files.hasMoreElements()) {
						String file = (String) files.nextElement();
						
						filename = multi.getFilesystemName(file); //원본파일명
						System.out.println("업로드된 파일명 : "+filename);
						
						f_name.add(filename); //+
						//String uploadFilePath2 = uploadFilePath+"\\";
						
						//System.out.println(uploadFilePath2 + filename);
						//System.out.println(uploadFilePath2 + Integer.toString(new_seq));
						
						
						//확장자도 넣어줘야함..
						//filename.indexOf(".");
						//filename.substring(filename.indexOf("."),filename.length());
						//System.out.println(filename.indexOf("."));
						//System.out.println(filename.substring(filename.indexOf("."),filename.length()));
						
						//File oldFile = new File(uploadFilePath2+ filename);
						//File newFile = new File(uploadFilePath2+ Integer.toString(new_seq)); //
						
						//oldFile.renameTo(newFile); //파일명변경
						//죽어도 파일명 변경이 안되네 ㅎ......화이팅....
					}
					
					//f_name.remove(0); //null값 삭제 - 흠 이건 패스
					String f_name_string = "";
					for (int i = 0; i < f_name.size(); i++) {
						System.out.println(f_name.get(i));
						f_name_string = f_name_string+f_name.get(i)+"|";
					}
					System.out.println("컬럼에 들어갈 사진 이름들을 한 문자열로 : "+f_name_string.substring(0, f_name_string.length()-1));
					f_db = f_name_string.substring(0, f_name_string.length()-1); //db에 넣을 값
					
					
 					title = multi.getParameter("title");
					content = multi.getParameter("content");
					
					if(mdao.bncheck(vo.getMB_nick()) == true) {
					start_date = multi.getParameter("s_date");
					end_date = multi.getParameter("e_date");
					
					String s[] = start_date.split("-");
					String e[] = end_date.split("-");
					date = s[0]+"/"+s[1]+"/"+s[2]+"-"+e[0]+"/"+e[1]+"/"+e[2];
					System.out.println(date);
					}
					
					like_region_tag = multi.getParameterValues("region");
					like_genre_tag = multi.getParameterValues("genre");
					like_color_tag = multi.getParameterValues("color");
					
					img1 = multi.getFilesystemName("img1");
					img2 = multi.getFilesystemName("img2");
					img3 = multi.getFilesystemName("img3");
					
					
					
//					if(filename==null) {
//						System.out.println("파일이 업로드 되지 않았음");
//					}else {
//						System.out.println("파일 업로드 됨");
//					}
					
				}catch(Exception e) {e.printStackTrace();System.out.println("예외발생");}
				//이미지 위한 코드 끝
		
		
		//배열 형태 -->String형태로 변환
		String region_tag = arrayJoin("|",like_region_tag);
		String genre_tag = arrayJoin("|",like_genre_tag);
		String color_tag = arrayJoin("|",like_color_tag);
		
		postVO pvo = new postVO(title,content,vo.getMB_nick(),region_tag, genre_tag, color_tag,f_db);
		
		postDAO dao = new postDAO();
		adpostDAO adao = new adpostDAO();
		
		adpostVO avo = new adpostVO(vo.getMB_nick(), content, date, region_tag, genre_tag, color_tag, title, f_db); 
		
		int cnt1 = 0;
		int cnt2 = 0;
		
		if(mdao.bncheck(vo.getMB_nick()) == true) { 
			cnt2 = adao.adposting(avo);
		}else {
			cnt1 = dao.posting(pvo);
		}
		response.sendRedirect("all.jsp");
		
		
		
		
		if(cnt1 + cnt2>0) {
			if(cnt2>0) {
				System.out.println("광고포스팅 완료");
			}else {
				System.out.println("일반포스팅 완료");
				
			}
		}else if(cnt1 + cnt2==0) {
			System.out.println("포스팅 실패..");
		}
		
	}
	
	 public static String arrayJoin(String glue, String array[]) {
		    String result = "";

		    for (int i = 0; i < array.length; i++) {
		      result += array[i];
		      if (i < array.length - 1) result += glue;
		    }
		    return result;
		  }

}
