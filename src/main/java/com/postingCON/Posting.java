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

import DAO.membersDAO;
import DAO.postDAO;
import VO.membersVO;
import VO.postVO;

@WebServlet("/Posting")
public class Posting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =  request.getSession();
		membersVO vo= (membersVO)session.getAttribute("vo");
		
		request.setCharacterEncoding("euc-kr");
		
				//이미지를 위한 코드
				PrintWriter out = response.getWriter();
				String savePath = "upload";
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
				
				String[] like_region_tag = null;
				String[] like_genre_tag = null;
				String[] like_color_tag = null;
				
				String filename = "";
				
				try {//dhktlqkf
					MultipartRequest multi = new MultipartRequest(
						request,
						uploadFilePath,
						uploadFileSizeLimit,
						encType, 
						new DefaultFileRenamePolicy());
					
					Enumeration files = multi.getFileNames();
					
					while(files.hasMoreElements()) {
						String file = (String) files.nextElement();
						
						filename = multi.getFilesystemName(file); //원본파일명
						
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
					
 					title = multi.getParameter("title");
					content = multi.getParameter("content");
					
					like_region_tag = multi.getParameterValues("region");
					like_genre_tag = multi.getParameterValues("genre");
					like_color_tag = multi.getParameterValues("color");
					
					
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
		
		postVO pvo = new postVO(title,content,vo.getMB_nick(),region_tag,genre_tag,color_tag);
		
		postDAO dao = new postDAO();
		
		int cnt = dao.posting(pvo);
		
		if(cnt>0) {
			System.out.println("포스팅 완료");
			response.sendRedirect("all.jsp");
		}else {
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
