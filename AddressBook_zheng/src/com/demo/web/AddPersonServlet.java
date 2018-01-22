package com.demo.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.domain.Person;
import com.demo.service.PersonService;
import com.demo.utils.CommonUtils;

public class AddPersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置中文格式，可以读取中文数据的输入
		request.setCharacterEncoding("UTF-8");
		// 获取输入的数据
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String memo = request.getParameter("memo");
		//封装到person对象中
		Person person = new Person();
		person.setId(CommonUtils.getTimeForId());
		person.setName(name);
		person.setBirthday(birthday);
		person.setPhone(phone);
		person.setEmail(email);
		person.setMemo(memo);
		
		//添加到数据库中
		PersonService service = new PersonService();
		service.addPerson(person);
		//重定向到默认页面，即default.jsp页面
		response.sendRedirect(request.getContextPath());
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}