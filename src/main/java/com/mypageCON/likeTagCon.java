package com.mypageCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.membersDAO;
import VO.membersVO;


@WebServlet("/likeTagCon")
public class likeTagCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession();
		membersVO vo = (membersVO)session.getAttribute("vo");
		
		request.setCharacterEncoding("euc-kr");
		
		String[] like_region_tag = request.getParameterValues("region");
		String[] like_genre_tag = request.getParameterValues("genre");
		String[] like_color_tag = request.getParameterValues("color");

		//배열 형태 -->String형태로 변환
		String region_tag = arrayJoin("|",like_region_tag);
		String genre_tag = arrayJoin("|",like_genre_tag);
		String color_tag = arrayJoin("|",like_color_tag);
		
		membersDAO dao = new membersDAO();
	
		int cnt=dao.likeupdate(region_tag, genre_tag, color_tag, vo.getMB_nick());
	
		if(cnt>0) {
			
			System.out.println("태그수정완료");
			
			membersVO vo1 = (membersVO)session.getAttribute("vo");
			session.setAttribute("vo", vo1);
			
			response.sendRedirect("Main.jsp");
		}else {
			System.out.println("회원정보 수정 실패 ;;");
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
