package com.addressbook.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.addressbook.domain.Person;
import com.addressbook.service.PersonService;
import com.addressbook.utils.CommonUtils;
import com.google.gson.Gson;

public class PersonServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	PersonService service = new PersonService();
	
	/**
	 * 显示模糊查询后的数据 
	 */
	public void showSearchPersonByUsername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		List<Person> personList = null;
		personList = service.showSearchPersonByUsername(username);
		Gson gson = new Gson();
		String json = gson.toJson(personList);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
	
	//模糊查询
	public void searchPersonByUsername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		List<Object> usernameList = null;
		usernameList = service.searchPersonByUsername(username);
		Gson gson = new Gson();
		String json = gson.toJson(usernameList);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
	/**
	 * 修改信息 
	 */
	public void editPersonById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]> properties = request.getParameterMap();
		Person person = new Person();
		try {
			BeanUtils.populate(person, properties);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		service.editPersonById(person);
		response.sendRedirect(request.getContextPath()+"/admin/home.jsp");
	}
	/**
	 * 查询某联系人信息，展示并编辑
	 */
	public void findPersonByIdForEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Person person = null;
		person = service.findPersonByIdForEdit(id);
		Gson gson = new Gson();
		String json = gson.toJson(person);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
	/**
	 * 删除联系人
	 */
	public void deletePersonById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		service.deletePersonById(id);
		response.sendRedirect(request.getContextPath()+"/admin/home.jsp");
	}
	/**
	 * 添加联系人
	 */
	public void addPerson(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Map<String, String[]> properties = request.getParameterMap();
		Person person = new Person();
		try {
			BeanUtils.populate(person, properties);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		person.setId(CommonUtils.getTimeForId());
		service.addPerson(person);
		response.sendRedirect(request.getContextPath()+"/admin/home.jsp");
	}
	//校验用户名是否存在
	public void checkUsername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		boolean isUsernameExist = false;
		isUsernameExist = service.checkUsername(username);
		response.getWriter().write("{\"isUsernameExist\":"+isUsernameExist+"}");
	}
	
	//展示全部列表
	public void personList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Person> personList = null;
		personList = service.findAllPerson();
		Gson gson = new Gson();
		String json = gson.toJson(personList);
		response.setCharacterEncoding("UTF-8");//设置中文格式
		response.getWriter().write(json);
	}
	
}