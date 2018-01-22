package com.demo.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.domain.Person;
import com.demo.service.PersonService;

public class UpdatePersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置中文格式，可以读取中文数据的输入
		request.setCharacterEncoding("UTF-8");
		// 获取输入的数据
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String memo = request.getParameter("memo");
		//封装到person中
		Person person = new Person();
		person.setId(id);
		person.setName(name);
		person.setBirthday(birthday);
		person.setPhone(phone);
		person.setEmail(email);
		person.setMemo(memo);
		
		//更新到数据库中
		PersonService service = new PersonService();
		service.updatePersonById(person);
		
		response.sendRedirect(request.getContextPath());
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}