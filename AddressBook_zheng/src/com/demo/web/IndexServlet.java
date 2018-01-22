package com.demo.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.domain.Person;
import com.demo.service.PersonService;

public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    PersonService service = new PersonService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ��ѯȫ������
		List<Person> list = service.findAllPerson();
		//���������
		request.setAttribute("list", list);
		//ת����home.jspҳ��
		request.getRequestDispatcher("home.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
