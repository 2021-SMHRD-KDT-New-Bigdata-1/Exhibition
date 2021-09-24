package com.likepostCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.likeDAO;
import DAO.saveDAO;

/**
 * Servlet implementation class likePost
 */
@WebServlet("/likePost")
public class likePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		
		likeDAO dao = new likeDAO();
		int cnt = dao.like(seq);
		if(cnt>0) {
			System.out.println("저장 성공");
			response.sendRedirect("onepost.jsp?seq="+seq);
		}else {
			System.out.println("저장 실패");
		}
	}

}
