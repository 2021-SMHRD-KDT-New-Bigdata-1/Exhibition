package com.mypageCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.membersDAO;
import VO.membersVO;

@WebServlet("/modifyCon")
public class modifyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		membersVO vo = (membersVO)session.getAttribute("vo");
		
		request.setCharacterEncoding("euc-kr");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		
		membersDAO dao = new membersDAO();
		int cnt = dao.update(name, id, pw, tel,vo.getMB_nick());
		if(cnt>0) {
			System.out.println("회원정보 수정 완료~");
			
			//세션 재생성
			vo = (membersVO)session.getAttribute("vo");
			session.setAttribute("vo", new membersVO(name,id,pw,vo.getMB_nick(),tel,vo.getMB_type(),vo.getMB_bn()));
			
			response.sendRedirect("Main.jsp");
			
		}else {
			System.out.println("회원정보 수정 실패 ㅎ");
		}
	}

}
