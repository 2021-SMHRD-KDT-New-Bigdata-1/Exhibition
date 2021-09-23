package com.memberCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.membersDAO;
import VO.membersVO;

@WebServlet("/joinCon")
public class joinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nick");
	String tel = request.getParameter("tel");
	String bn = request.getParameter("bn");
	String TF = "";
	if(bn.equals("")) {
	      TF = "Normal";
	   }else {
	      TF = "Business";
	   }

	
	membersVO vo = new membersVO(nick,id,pw,tel,name,TF,bn);
	
	membersDAO dao = new membersDAO();
	
	int cnt = dao.join(vo);
	if(cnt>0) {
		System.out.println("회원가이 ㅂ성공");
		response.sendRedirect("Main.jsp");
	}
	}

}
