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

import DAO.adpostDAO;
import DAO.membersDAO;
import DAO.postDAO;
import VO.adpostVO;
import VO.membersVO;
import VO.postVO;

@WebServlet("/SearchCon")
public class SearchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		membersVO vo = (membersVO)session.getAttribute("vo");
	
		request.setCharacterEncoding("euc-kr");
		
		System.out.println("searchCON���� - �±׸� ������� �˻��մϴ�");
		//�˻��� �±�
		String[] region_tag = request.getParameterValues("region");
		System.out.println(Arrays.toString(region_tag));
		String[] genre_tag = request.getParameterValues("genre");
		System.out.println(Arrays.toString(genre_tag));
		String[] color_tag = request.getParameterValues("color");
		System.out.println(Arrays.toString(color_tag));
		
		//�迭 ���� -->String���·� ��ȯ
		String search_region_tag = arrayJoin("|",region_tag);
		String search_genre_tag = arrayJoin("|",genre_tag);
		String search_color_tag = arrayJoin("|",color_tag);
		
		//all_region, all_genre, all_color ���� ��
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

		postDAO pdao = new postDAO();

		ArrayList<postVO> AL = pdao.postselect();
		ArrayList<postVO> list = new ArrayList<postVO>();
		
		for (int i = 0; i < AL.size(); i++) {
			String post_region = AL.get(i).getRegion_tag();
			String post_genre = AL.get(i).getGenre_tag();
			String post_color = AL.get(i).getColor_tag();
			
			String[] post_regioin_ar = post_region.split("\\|");
			String[] post_genre_ar = post_genre.split("\\|");
			String[] post_color_ar = post_color.split("\\|");
			
			
			if(search_region_tag.contains(post_region)) {
				System.out.println("�������͸����");
				if(search_genre_tag.contains(post_genre)) {
					System.out.println("�帣���͸����");
					int cnt = 0;
					if(post_color_ar.length>color_tag.length) {
						for(int j = 0; j<color_tag.length;j++) {
							if(post_color.contains(color_tag[j])) { //���� �˻��� �±װ� post�±׿� ���ԵǾ��ִ��� �˻�!
								cnt ++;
							}
						}
						if(cnt == color_tag.length) { //*
							System.out.println("�÷����͸� ���");
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
							System.out.println("�÷����͸� ���");
							System.out.println(AL.get(i).getGenre_tag());
							System.out.println(AL.get(i).getColor_tag());
							list.add(AL.get(i));
						}
					}
				}
			}
		}
		
		//adpost list�� ����
		adpostDAO adao = new adpostDAO();
		ArrayList<adpostVO> AD_AL = adao.allpost();
		ArrayList<adpostVO> adlist = new ArrayList<adpostVO>();
		
		//adpost list �±� �˻�
		for (int i = 0; i < AD_AL.size(); i++) {
			String post_region = AD_AL.get(i).getRegion();
			String post_genre = AD_AL.get(i).getGenre();
			String post_color = AD_AL.get(i).getColor();
			
			String[] post_regioin_ar = post_region.split("\\|");
			String[] post_genre_ar = post_genre.split("\\|");
			String[] post_color_ar = post_color.split("\\|");
			
			if(search_region_tag.contains(post_region)) {
				System.out.println("ad�������͸����");
				if(search_genre_tag.contains(post_genre)) {
					System.out.println("ad�帣���͸����");
					int cnt = 0;
					if(post_color_ar.length>color_tag.length) {
						for(int j = 0; j<color_tag.length;j++) {
							if(post_color.contains(color_tag[j])) { //���� �˻��� �±װ� post�±׿� ���ԵǾ��ִ��� �˻�!
								cnt ++;
							}
						}
						if(cnt == color_tag.length) { //*
							System.out.println("ad�÷����͸� ���");
							System.out.println(AD_AL.get(i).getGenre());
							System.out.println(AD_AL.get(i).getColor());
							adlist.add(AD_AL.get(i));
						}
					}else{
						for(int j = 0; j<color_tag.length;j++) {
							if(post_color.contains(color_tag[j])) {
								cnt ++;
							}
						}
						if(cnt == post_color_ar.length) { 	//*
							System.out.println("ad�÷����͸� ���");
							System.out.println(AD_AL.get(i).getGenre());
							System.out.println(AD_AL.get(i).getColor());
							adlist.add(AD_AL.get(i));
						}
					}
				}
			}
		}
		
			if(list!=null) {
				session.setAttribute("list", list);
			}
			if(adlist!=null) {
				session.setAttribute("adlist", adlist);
			}
			
			
			//�˻��� ����, �帣, ������ ��Ÿ������ �����ֱ�
			String search_region_tag_s = "#"+arrayJoin(" #",region_tag);
			String search_genre_tag_s = "#"+arrayJoin(" #",genre_tag);
			String search_color_tag_s = "#"+arrayJoin(" #",color_tag);
			
			session.setAttribute("rt", search_region_tag_s);
			session.setAttribute("gt", search_genre_tag_s);
			session.setAttribute("ct", search_color_tag_s);
			response.sendRedirect("allSearch.jsp");
		
		
	}//class ��
		
	public static String arrayJoin(String glue, String array[]) {
	    String result = "";

	    for (int i = 0; i < array.length; i++) {
	      result += array[i];
	      if (i < array.length - 1) result += glue;
	    }
	    return result;
	  }

}
