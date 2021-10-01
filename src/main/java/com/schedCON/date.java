package com.schedCON;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.exhDAO;
import VO.exhVO;

@WebServlet("/date")
public class date extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		System.out.println(year+"년"+month+"월"+day+"일 일정을 검색합니다...");
		
		exhDAO edao = new exhDAO();
		ArrayList<exhVO> day_list = edao.selectDay(year, month, day);
		
		if(day_list!=null) {
			System.out.println("DB잘 다녀옴");
			for(int i = 0; i <day_list.size();i++) {
				System.out.println(day_list.get(i).getEx_seq());
			}
			}
	}
	
	

}
