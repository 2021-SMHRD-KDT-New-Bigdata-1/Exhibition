package com.postingCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.postDAO;

@WebServlet("/commentCON")
public class commentCON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		request.setCharacterEncoding("euc-kr");
		int seq = Integer.parseInt(request.getParameter("seq"));
		String comment = request.getParameter("comment");
		
		//���� ��� �ҷ�����
		postDAO dao = new postDAO();
		String c_origin = dao.selectComment(seq);
		
		//���ο� ��� �߰��ϱ�
		String c_new = c_origin+"|"+comment;
		int cnt = dao.updateComment(seq,c_new);
		
		if(cnt>0) {
			//���ο� ��� �߰� ����
			String[] commentlist = c_new.split("\\|");
			HttpSession session = request.getSession();
			session.setAttribute("commentlist", commentlist);
			response.sendRedirect("onepost.jsp?seq="+seq);
		}
		
	}

}
