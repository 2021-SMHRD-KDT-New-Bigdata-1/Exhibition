package com.allpostCON;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

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
		
		System.out.println("searchCON시작2");
		//검색한 태그
		String[] region_tag = request.getParameterValues("region");
		System.out.println(Arrays.toString(region_tag));
		String[] genre_tag = request.getParameterValues("genre");
		System.out.println(Arrays.toString(genre_tag));
		String[] color_tag = request.getParameterValues("color");
		System.out.println(Arrays.toString(color_tag));
		
		//배열 형태 -->String형태로 변환
		String search_region_tag = arrayJoin("|",region_tag);
		String search_genre_tag = arrayJoin("|",genre_tag);
		String search_color_tag = arrayJoin("|",color_tag);
		
		//all_region, all_genre, all_color 선택 시
		if(search_region_tag.contains("|")) {
			region_tag = search_region_tag.split("\\|");
			search_region_tag = arrayJoin("|",region_tag);
		}
		if(search_genre_tag.contains("|")) {
			genre_tag = search_genre_tag.split("\\|");
			search_genre_tag = arrayJoin("|",genre_tag);
		}
		if(search_color_tag.contains("|")) {
			color_tag = search_color_tag.split("\\|");
			search_color_tag = arrayJoin("|",color_tag);
		}
		System.out.println(search_region_tag);
		System.out.println(search_genre_tag);
		System.out.println(search_color_tag);

		postDAO dao = new postDAO();

		ArrayList<postVO> AL = dao.postselect();
		ArrayList<postVO> list = new ArrayList<postVO>();
		
		for (int i = 0; i < AL.size(); i++) {
			String post_region = AL.get(i).getRegion_tag();
			String post_genre = AL.get(i).getGenre_tag();
			String post_color = AL.get(i).getColor_tag();
			
			String[] post_regioin_ar = post_region.split("\\|");
			String[] post_genre_ar = post_genre.split("\\|");
			String[] post_color_ar = post_color.split("\\|");
			
			
			if(search_region_tag.contains(post_region)) {
				System.out.println("지역필터링통과");
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
							System.out.println(AL.get(i).getGenre_tag());
							System.out.println(AL.get(i).getColor_tag());
							list.add(AL.get(i));
						}
					}else{
						for(int j = 0; j<color_tag.length;j++) {
							if(post_color.contains(color_tag[j])) {
								cnt ++;
							}
						}
						if(cnt == post_color_ar.length) { 	//*
							System.out.println("컬러필터링 통과");
							System.out.println(AL.get(i).getGenre_tag());
							System.out.println(AL.get(i).getColor_tag());
							list.add(AL.get(i));
						}
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
