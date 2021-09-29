package com.adCON;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.adpostDAO;
import DAO.postDAO;

@WebServlet("/adlikePostSaveLink")
public class adlikePostSaveLink extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		int seq = Integer.parseInt(request.getParameter("seq"));
		String nick = request.getParameter("nick");
		
		//���� �̹� ���ƿ並 �������� Ȯ��
		adpostDAO adao = new adpostDAO();
		String like_origin = adao.likeselect(seq);
		
		
		if(like_origin.contains(nick)) {
			//������ ���ƿ� ���� - > ��Ұ� �ǵ���
			//cnt-1
			int cnt3 = adao.likeminus(seq,nick);
			if(cnt3>0) {
				System.out.println("���ƿ� ��� ����!");
				
				//�׸��� rv_like_nick������ �̸��� �����ֱ�
				int cnt4 = adao.likenickUpdate(seq,like_origin.replace(nick, ""));
				if(cnt4>0) {
					//�̸� �߰� ����
					System.out.println("�̸� ���� ����!");
					response.sendRedirect("saveOneAdPost.jsp?seq="+seq);
				}else {
					System.out.println("���ƿ���Ҵ� �����µ� �̸� ������ ����..");
					response.sendRedirect("saveOneAdPost.jsp?seq="+seq);
				}
			}
			
		}else {
			//������ ���ƿ� �ȴ���
			int cnt = adao.likeplus(seq,nick);
			if(cnt>0) {
				//���ƿ� ���������� DB�� +1
				System.out.println("���ƿ� ����!");
				
				//rv_like_nick�� �̸� �߰����ֱ�
				int cnt2 = adao.likenickUpdate(seq,like_origin+nick);
				if(cnt2>0) {
					//�̸� �߰� ����
					System.out.println("�̸� �߰� ����!");
					response.sendRedirect("saveOneAdPost.jsp?seq="+seq);
				}else {
					System.out.println("���ƿ�� �����µ� �̸� �߰��� ����..");
					response.sendRedirect("saveOneAdPost.jsp?seq="+seq);
				}
			}else {
				System.out.println("���ƿ� ����..?");
				response.sendRedirect("saveOneAdPost.jsp?seq="+seq);
			}
		}
	
	}
	

}