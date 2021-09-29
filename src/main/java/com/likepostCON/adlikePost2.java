package com.likepostCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.adpostDAO;
import DAO.postDAO;

@WebServlet("/adlikePost2")
public class adlikePost2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		int seq = Integer.parseInt(request.getParameter("seq"));
		String nick = request.getParameter("nick");
		
		//내가 이미 좋아요를 눌렀는지 확인
		adpostDAO dao = new adpostDAO();
		String like_origin = dao.likeselect(seq);
		
		if(like_origin.contains(nick)) {
			//기존에 좋아요 누름 - > 취소가 되도록
			//cnt-1
			int cnt3 = dao.likeminus(seq,nick);
			if(cnt3>0) {
				System.out.println("좋아요 취소 성공!");
				
				//그리고 rv_like_nick에서도 이름을 없애주기
				int cnt4 = dao.likenickUpdate(seq,like_origin.replace(nick, ""));
				if(cnt4>0) {
					//이름 추가 성공
					System.out.println("이름 삭제 성공!");
					response.sendRedirect("adOnePost.jsp?seq="+seq);
				}else {
					System.out.println("좋아요취소는 눌렀는데 이름 삭제는 실패..");
					response.sendRedirect("adOnePost.jsp?seq="+seq);
				}
			}
			
		}else {
			//기존에 좋아요 안누름
			int cnt = dao.likeplus(seq,nick);
			if(cnt>0) {
				//좋아요 성공적으로 DB에 +1
				System.out.println("좋아요 성공!");
				
				//rv_like_nick에 이름 추가해주기
				int cnt2 = dao.likenickUpdate(seq,like_origin+nick);
				if(cnt2>0) {
					//이름 추가 성공
					System.out.println("이름 추가 성공!");
					response.sendRedirect("adOnePost.jsp?seq="+seq);
				}else {
					System.out.println("좋아요는 눌렀는데 이름 추가는 실패..");
					response.sendRedirect("adOnePost.jsp?seq="+seq);
				}
			}else {
				System.out.println("좋아요 실패..?");
				response.sendRedirect("adOnePost.jsp?seq="+seq);
			}
		}
	
	}

}
