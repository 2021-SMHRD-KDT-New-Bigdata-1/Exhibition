package com.postingCON;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.postDAO;
import VO.postVO;

@WebServlet("/tagpost")
public class tagpost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		postDAO dao = new postDAO();
		postVO vo = new postVO();
		
		ArrayList<postVO> list = new ArrayList<postVO>();
				
		String[] region_tag = request.getParameterValues("region");
		String[] genre_tag = request.getParameterValues("genre");
		String[] color_tag = request.getParameterValues("color");
		
		String region = arrayJoin("|",region_tag);
		String genre = arrayJoin("|",genre_tag);
		String color = arrayJoin("|",color_tag);
		
		
		

		list = dao.post_select(region);
		for(int i = 0; i<genre_tag.length; i++){
			String genre60 = genre_tag[i];
			
			ArrayList<postVO> list2 = new ArrayList<postVO>();
			
			for(int j = 0; j<list.size(); j++){
				if(list.get(j).getGenre_tag().contains(genre)){
					list2.add(list.get(j));
					
				}System.out.println(list2);
				
			}
			
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
