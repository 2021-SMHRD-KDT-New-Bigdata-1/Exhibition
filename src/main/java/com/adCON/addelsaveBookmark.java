package com.adCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.adsaveDAO;
import DAO.saveDAO;

@WebServlet("/addelsaveBookmark")
public class addelsaveBookmark extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		int seq = Integer.parseInt(request.getParameter("seq"));
		String nick = request.getParameter("nick");
		
		adsaveDAO adsdao = new adsaveDAO();
		int cnt = adsdao.delSave(seq, nick);
		if(cnt>0) {
			System.out.println("삭제 성공");
			response.sendRedirect("adOnePost.jsp?seq="+seq);
		}else {
			System.out.println("삭제 실패");
		}
	}

}
