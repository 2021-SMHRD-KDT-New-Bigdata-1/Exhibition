package com.adCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.adsaveDAO;
import DAO.saveDAO;

@WebServlet("/adsavememo")
public class adsavememo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		int seq1 = Integer.parseInt(request.getParameter("seq"));
		String nick = request.getParameter("nick");
		String memo = request.getParameter("message");
		
		adsaveDAO adsdao = new adsaveDAO();
		int cnt = adsdao.memo(seq1, nick,memo);
		if(cnt>0) {
			System.out.println("메모 저장 완료! ");
			response.sendRedirect("saveOneAdPost.jsp?seq="+seq1);
		}else {
			System.out.println("메모 저장 안돼따!");
		}
	}

}
