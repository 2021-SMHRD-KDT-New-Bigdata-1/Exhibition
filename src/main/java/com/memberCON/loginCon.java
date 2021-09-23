package com.memberCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.membersDAO;
import VO.membersVO;

@WebServlet("/loginCon")
public class loginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		membersDAO dao = new membersDAO();
		membersVO vo = dao.login(id,pw);
		
		
		if(vo!=null) {
			System.out.println("로그인 성공!");
			response.sendRedirect("Main.jsp");
			
			HttpSession session = request.getSession();
			session.setAttribute("vo", vo);
			
			
		}else {
			System.out.println("로그인 실패?");
		}
		
	}

}
