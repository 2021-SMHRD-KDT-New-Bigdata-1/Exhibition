package com.savepostCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.saveDAO;

@WebServlet("/delsaveBookmark")
public class delsaveBookmark extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		int seq = Integer.parseInt(request.getParameter("seq"));
		String nick = request.getParameter("nick");
		
		saveDAO dao = new saveDAO();
		int cnt = dao.delSave(seq, nick);
		if(cnt>0) {
			System.out.println("삭제 성공");
			response.sendRedirect("onepost.jsp?seq="+seq);
		}else {
			System.out.println("삭제 실패");
		}
	
	}

}
