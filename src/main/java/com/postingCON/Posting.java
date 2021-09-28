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
		
		request.setCharacterEncoding("euc-kr");
		
				//�̹����� ���� �ڵ�
				PrintWriter out = response.getWriter();
				String savePath = "upload";
				int uploadFileSizeLimit = 20*1024*1024;
				String encType = "euc-kr";
				
				//�̹��� �̸��� seq��ȣ�� ���߱� ���� -> �����̸���...��
				postDAO pdao = new postDAO();
				ArrayList<postVO> list = pdao.allpost_order_seq();
				int new_seq = list.get(0).getSeq()+2;
				System.out.println("������ �� ������ : "+new_seq);
				
				//�̾
				ServletContext context = getServletContext();
				String uploadFilePath = context.getRealPath(savePath);
				System.out.println("�������� ���� ���丮 : "+uploadFilePath);
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
						
						filename = multi.getFilesystemName(file); //�������ϸ�
						
						//String uploadFilePath2 = uploadFilePath+"\\";
						
						//System.out.println(uploadFilePath2 + filename);
						//System.out.println(uploadFilePath2 + Integer.toString(new_seq));
						
						
						//Ȯ���ڵ� �־������..
						//filename.indexOf(".");
						//filename.substring(filename.indexOf("."),filename.length());
						//System.out.println(filename.indexOf("."));
						//System.out.println(filename.substring(filename.indexOf("."),filename.length()));
						
						//File oldFile = new File(uploadFilePath2+ filename);
						//File newFile = new File(uploadFilePath2+ Integer.toString(new_seq)); //
						
						//oldFile.renameTo(newFile); //���ϸ���
						//�׾ ���ϸ� ������ �ȵǳ� ��......ȭ����....
					}
					
 					title = multi.getParameter("title");
					content = multi.getParameter("content");
					
					like_region_tag = multi.getParameterValues("region");
					like_genre_tag = multi.getParameterValues("genre");
					like_color_tag = multi.getParameterValues("color");
					
					
//					if(filename==null) {
//						System.out.println("������ ���ε� ���� �ʾ���");
//					}else {
//						System.out.println("���� ���ε� ��");
//					}
					
				}catch(Exception e) {e.printStackTrace();System.out.println("���ܹ߻�");}
				//�̹��� ���� �ڵ� ��
		
		
		//�迭 ���� -->String���·� ��ȯ
		String region_tag = arrayJoin("|",like_region_tag);
		String genre_tag = arrayJoin("|",like_genre_tag);
		String color_tag = arrayJoin("|",like_color_tag);
		
		postVO pvo = new postVO(title,content,vo.getMB_nick(),region_tag,genre_tag,color_tag);
		
		postDAO dao = new postDAO();
		membersDAO  mdao = new membersDAO(); 
		adpostDAO adao = new adpostDAO();
		adpostVO avo = new adpostVO(vo.getMB_nick(), content, region_tag, genre_tag, color_tag);
		
		
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
				System.out.println("���������� �Ϸ�");
			}else {
				System.out.println("�Ϲ������� �Ϸ�");
				
			}
		}else if(cnt1 + cnt2==0) {
			System.out.println("������ ����..");
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
