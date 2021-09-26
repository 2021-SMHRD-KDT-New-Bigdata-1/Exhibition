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
		
		//검색한 태그
		String[] region_tag = request.getParameterValues("region");
		String[] genre_tag = request.getParameterValues("genre");
		String[] color_tag = request.getParameterValues("color");
		
		//배열 형태 -->String형태로 변환
		String search_region_tag = arrayJoin("|",region_tag);
		String search_genre_tag = arrayJoin("|",genre_tag);
		String search_color_tag = arrayJoin("|",color_tag);
				
//		System.out.println(region_tag);
//		System.out.println(genre_tag);
//		System.out.println(color_tag);

		
		postDAO dao = new postDAO();
		
//		ArrayList<postVO> AL = dao.search(region_tag,genre_tag,color_tag);
//		if(AL!=null) {
//			System.out.println("우선됨..");
//			response.sendRedirect("allSearch.jsp");
//			session.setAttribute("AL", AL);
//		}else {
//			System.out.println("놉");
//		}
		
		ArrayList<postVO> AL = dao.postselect(search_region_tag);
		ArrayList<postVO> list = new ArrayList<postVO>();
		
		for (int i = 0; i < AL.size(); i++) {
			String post_genre = AL.get(i).getGenre_tag();
			String post_color = AL.get(i).getColor_tag();
			String[] post_genre_ar = post_genre.split("\\|");
			String[] post_color_ar = post_color.split("\\|");
			
			if(search_genre_tag.contains(post_genre)) {
				System.out.println("장르필터링통과");
				int cnt = 0;
				if(post_color_ar.length>color_tag.length) {
					for(int j = 0; j<color_tag.length;j++) {
						if(post_color.contains(color_tag[j])) { //내가 검색한 태그가 post태그에 포함되어있는지 검색!
							cnt ++;
						}
					}
					if(cnt == color_tag.length) { //*
						System.out.println("컬러필터링 통과");
						System.out.println(AL.get(i).getColor_tag());
						list.add(AL.get(i));
					}
				}else{
					for(int j = 0; j<color_tag.length;j++) {
						if(post_color.contains(color_tag[j])) {
							cnt ++;
						}
					}
					if(cnt == color_tag.length) { 	//*
						System.out.println("컬러필터링 통과");
						System.out.println(AL.get(i).getColor_tag());
						list.add(AL.get(i));
					}
				}
			}
		}
		
		if(list!=null) {
			session.setAttribute("list", list);
			response.sendRedirect("allSearch.jsp");
			
		}
		
		
		
	}//class 끝
		
	public static String arrayJoin(String glue, String array[]) {
	    String result = "";

	    for (int i = 0; i < array.length; i++) {
	      result += array[i];
	      if (i < array.length - 1) result += glue;
	    }
	    return result;
	  }

}
