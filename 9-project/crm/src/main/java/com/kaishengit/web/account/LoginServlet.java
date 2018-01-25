package com.kaishengit.web.account;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaishengit.entity.Account;
import com.kaishengit.exception.ServiceException;
import com.kaishengit.service.AccountService;
import com.kaishengit.web.BaseServlet;

@WebServlet("/login")
public class LoginServlet extends BaseServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward("account/login", req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String remember = req.getParameter("remember");
	
		AccountService service = new AccountService();
		Map<String,Object> res = new HashMap<>();
		try { 
			Account account = service.login(username, password);
			res.put("state", "success");
			res.put("data", account);
			sendJson(res,resp);
			
		}catch(ServiceException e) {
			res.put("state", "error");
			res.put("message", e.getMessage());
			sendJson(res,resp);
		}
		
	}
	
	
}
