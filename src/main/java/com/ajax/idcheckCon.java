package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.membersDAO;

@WebServlet("/idcheckCon")
public class idcheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String data = request.getParameter("id");
		
		membersDAO dao = new membersDAO();
		
		boolean check = dao.idcheck(data);
		PrintWriter out = response.getWriter();
		out.print(check);
	}

}
