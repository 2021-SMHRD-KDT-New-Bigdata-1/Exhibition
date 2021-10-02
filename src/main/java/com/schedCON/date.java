package com.schedCON;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.exhDAO;
import VO.exhVO;

@WebServlet("/date")
public class date extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		exhDAO edao = new exhDAO();
		
		request.setCharacterEncoding("euc-kr");
		String main_root = request.getParameter("int");
		
		Integer iyear = 0;
		Integer imonth = 0;
		Integer iday = 0;
		ArrayList<exhVO> day_list = new ArrayList<>();
		
		if(main_root==null) {
			String year_month = request.getParameter("year_month");
			String day = request.getParameter("day");
	
			String year = year_month.substring(0,4);
			String month = year_month.substring(7,9);
	
			iyear = Integer.parseInt(year.trim());
			imonth = Integer.parseInt(month.trim());
			iday = Integer.parseInt(day.trim());
			System.out.println(iyear+"년"+imonth+"월"+iday+"일 일정정보를 검색합니다..");
			day_list = edao.selectDay(iyear, imonth, iday);
			if(day_list!=null) {
				System.out.println("DB 잘 다녀왔습니다 엄마~");}
		
		}else {
			
			LocalDate now = LocalDate.now();
			int lcyear = now.getYear();
			int monthValue = now.getMonthValue();
			int dayOfMonth = now.getDayOfMonth();
			day_list = edao.selectDay(lcyear, monthValue, dayOfMonth);
			System.out.println("현재 날짜 일정정보를 검색합니다");
		}
		
		if(day_list!=null) {
			for(int i = 0; i <day_list.size();i++) {
				System.out.println(day_list.get(i).getEx_seq());
			}
			//list 넘겨주깅
			HttpSession session = request.getSession();
			session.setAttribute("day_list", day_list);
			response.sendRedirect("schedSearch.jsp");
		}
	}

}
