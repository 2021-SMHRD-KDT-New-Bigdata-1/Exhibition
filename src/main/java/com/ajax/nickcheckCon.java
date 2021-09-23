package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.membersDAO;

@WebServlet("/nickcheckCon")
public class nickcheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String data = request.getParameter("nick");
		
		membersDAO dao = new membersDAO();
		
		boolean check = dao.nickcheck(data);
		PrintWriter out = response.getWriter();
		out.print(check);
	}

}
