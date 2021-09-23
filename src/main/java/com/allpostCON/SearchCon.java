package com.allpostCON;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.membersDAO;
import DAO.postDAO;
import VO.membersVO;
import VO.postVO;

@WebServlet("/SearchCon")
public class SearchCon extends HttpServlet {
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
				
		System.out.println(region_tag);
		System.out.println(genre_tag);
		System.out.println(color_tag);
		
		postDAO dao = new postDAO();
		ArrayList<postVO> AL = dao.search(region_tag,genre_tag,color_tag);
		if(AL!=null) {
			System.out.println("우선됨..");
			response.sendRedirect("allSearch.jsp");
			session.setAttribute("AL", AL);
		}else {
			System.out.println("놉");
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
