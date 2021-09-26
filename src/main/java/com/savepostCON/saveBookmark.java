package com.savepostCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.saveDAO;

@WebServlet("/saveBookmark")
public class saveBookmark extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		int seq = Integer.parseInt(request.getParameter("seq"));
		String nick = request.getParameter("nick");
		
		saveDAO dao = new saveDAO();
		
		//이미 저장이 되어있는지 확인한 후, 없다면 저장하기!
		boolean result = dao.check(seq,nick);
		if(result == false) {
			int cnt = dao.save(seq, nick);
			if(cnt>0) {
				System.out.println("저장 성공");
				response.sendRedirect("onepost.jsp?seq="+seq);
			}else {
				System.out.println("저장 실패");
			}
		}else {
			System.out.println("이미 저장되어있어영~~ 중복저장 안됌"); //alert띄울 수 없나영?
			response.sendRedirect("onepost.jsp?seq="+seq);
		}
	}

}
