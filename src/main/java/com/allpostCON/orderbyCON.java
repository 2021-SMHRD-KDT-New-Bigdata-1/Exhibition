package com.allpostCON;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

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

@WebServlet("/orderbyCON")

public class orderbyCON extends HttpServlet{
		//����...�����..
		
	
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//�켱 ��� allpost�� �������°� ���Ծ���
		postDAO pdao = new postDAO();
		ArrayList<postVO> all_list = pdao.allpost();
		
		//���ɺо� ������ ����� ��� - all.jsp���� ���͸��� �ż� ��
		String nick = request.getParameter("nick");
		membersDAO mdao = new membersDAO();
		ArrayList<membersVO> AL = mdao.checklike(nick);
		
		//�ش� 60limmm�� ���ɺо߸� �켱 ������
		String region  = AL.get(0).getLike_region_tag();
		String genre = AL.get(0).getLike_genre_tag();
		String color = AL.get(0).getLike_color_tag();
//		String[] ar_region = region.split("\\|");
//		String[] ar_genre = genre.split("\\|");
		String[] ar_color = color.split("\\|");
		
		//���ı���??? 1����-2�帣-3�÷�
		ArrayList<postVO> orderList = new ArrayList<postVO>();
		
		for (int i = 0; i < all_list.size(); i++) { //��� post�� ���鼭 �±׿� �󸶳� �´��� cnt�� ��
			int cnt = 0;
			if(region.contains(all_list.get(i).getRegion_tag())) {
				cnt++;
			}
			if(genre.contains(all_list.get(i).getGenre_tag())) {
				cnt++;
			}
			//�� ���� ������ black, white, yellow�� 
			for (int j = 0; j < ar_color.length; j++) {
				if(all_list.get(i).getColor_tag().contains(ar_color[j])) { //post �±׿� black�� ����? +1, white�� ����? +1..�̷���
					cnt++;
				}
			}
			
			//����Ʈ ������
			orderList.add(new postVO(
					all_list.get(i).getSeq(),
					all_list.get(i).getContent(),
					all_list.get(i).getCnt(),
					all_list.get(i).getNick(),
					all_list.get(i).getTitle(),
					all_list.get(i).getRegion_tag(),
					all_list.get(i).getGenre_tag(),
					all_list.get(i).getColor_tag(),
					all_list.get(i).getComment(),
					all_list.get(i).getLike_nick(),
					cnt)); 
		}//for�� ��
		//���� cnt �������� ������ ������ϴµ�.. -> �˰����� ¥..? �� �׳� �˰����� ¥..
		//Collections.sort(orderList, new comparator());
		//System.out.println(orderList);
		
		ArrayList<postVO> order5 = new ArrayList<postVO>();
		ArrayList<postVO> order4 = new ArrayList<postVO>();
		ArrayList<postVO> order3 = new ArrayList<postVO>();
		ArrayList<postVO> order2 = new ArrayList<postVO>();
		ArrayList<postVO> order1 = new ArrayList<postVO>();
		ArrayList<postVO> order0 = new ArrayList<postVO>();
		
		for (int k = 0; k < orderList.size(); k++) {
			if(orderList.get(k).getLike_tag_cnt()==5) {
				order5.add(orderList.get(k));
			}else if(orderList.get(k).getLike_tag_cnt()==4) {
				order4.add(orderList.get(k));
			}else if(orderList.get(k).getLike_tag_cnt()==3) {
				order3.add(orderList.get(k));
			}else if(orderList.get(k).getLike_tag_cnt()==2) {
				order2.add(orderList.get(k));
			}else if(orderList.get(k).getLike_tag_cnt()==1) {
				order1.add(orderList.get(k));
			}else {
				order0.add(orderList.get(k));
			}
		}
		ArrayList<postVO> order_join = new ArrayList<postVO>();
		order_join.addAll(order5);
		order_join.addAll(order4);
		order_join.addAll(order3);
		order_join.addAll(order2);
		order_join.addAll(order1);
		order_join.addAll(order0);
		
		HttpSession session = request.getSession();
		session.setAttribute("list", order_join);
		response.sendRedirect("allorderby.jsp");
	}

}
