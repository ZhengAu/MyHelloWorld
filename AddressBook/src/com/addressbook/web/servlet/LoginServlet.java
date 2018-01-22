package com.addressbook.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.addressbook.domain.Root;
import com.addressbook.service.LoginService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Root root = null;
		LoginService service = new LoginService();
		root = service.login(username,password);
		if(root!=null){
			request.getSession().setAttribute("root", root);
			response.sendRedirect(request.getContextPath()+"/admin/home.jsp");
		}else{
			request.setAttribute("error", "’À∫≈ªÚ’ﬂ√‹¬Î¥ÌŒÛ");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}