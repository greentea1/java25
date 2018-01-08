package com.kaishengit.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaishengit.entity.Admin;
import com.kaishengit.exception.ServiceException;
import com.kaishengit.service.BookService;

public class DelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin != null) {
			//���տͻ�������
			String id = req.getParameter("id");
	
			BookService bookService = new BookService();
			
			// ����service����ɾ��
			try {
				bookService.delBook(id);
				// �ض�����ת��/list
				resp.sendRedirect("/list");
			} catch(ServiceException e) {
				// �ֶ�����404
				resp.sendError(404, e.getMessage());
			}
		} else {
			//û�е�¼����������ص�¼ҳ��
			resp.sendRedirect("/login");
		}
	}

}