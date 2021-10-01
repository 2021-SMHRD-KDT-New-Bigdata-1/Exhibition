package com.schedCON;

import java.io.IOException;
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
		request.setCharacterEncoding("euc-kr");
		//int year = Integer.parseInt(request.getParameter("year"));
		String year_month = request.getParameter("year_month");
		String day = request.getParameter("day");

		String year = year_month.substring(0,4);
		String month = year_month.substring(7,9);

		Integer iyear = Integer.parseInt(year.trim());
		Integer imonth = Integer.parseInt(month.trim());
		Integer iday = Integer.parseInt(day.trim());
		System.out.println(iyear+imonth+iday);
		
		
		exhDAO edao = new exhDAO();
		ArrayList<exhVO> day_list = edao.selectDay(iyear, imonth, iday);
		
		if(day_list!=null) {
			System.out.println("DB 잘 다녀왔습니다 엄마~");
			for(int i = 0; i <day_list.size();i++) {
				System.out.println(day_list.get(i).getEx_seq());
			}
			//list 넘겨주깅
			HttpSession session = request.getSession();
			session.setAttribute("day_list", day_list);
		}
	}

}
