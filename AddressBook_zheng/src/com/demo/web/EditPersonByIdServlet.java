package com.demo.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.domain.Person;
import com.demo.service.PersonService;

public class EditPersonByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PersonService service = new PersonService();
		String id = request.getParameter("id");
		Person person = null;
		//根据id查询用户，展示在编辑页面
		person = service.findPersonById(id);
		//封装到request域中
		request.setAttribute("person", person);
		//封装到域中的数据，重定向后，还可以找得到吗？
		//response.sendRedirect(request.getContextPath()+"/edit.jsp");
		request.getRequestDispatcher("/edit.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}