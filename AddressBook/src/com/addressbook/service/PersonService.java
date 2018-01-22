package com.addressbook.service;

import java.sql.SQLException;
import java.util.List;

import com.addressbook.dao.PersonDao;
import com.addressbook.domain.Person;

public class PersonService {
	PersonDao dao = new PersonDao();

	public List<Person> findAllPerson() {
		List<Person> personList = null;
		try {
			personList = dao.findAllPerson();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return personList;
	}

	public boolean checkUsername(String username) {
		Long isUsernameExist = 0L;
		try {
			isUsernameExist = dao.checkUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//>0,表存在，不可用，返回false；否则返回true，即表示可用
		return isUsernameExist>0?false:true;
	}

	public void addPerson(Person person) {
		try {
			dao.addPerson(person);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void deletePersonById(String id) {
		try {
			dao.deletePersonById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Person findPersonByIdForEdit(String id) {
		Person person = null;
		try {
			person = dao.findPersonByIdForEdit(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return person;
	}

	public void editPersonById(Person person) {
		try {
			dao.editPersonById(person);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Object> searchPersonByUsername(String username) {
		List<Object> list = null;
		try {
			list=dao.searchPersonByUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Person> showSearchPersonByUsername(String username) {
		List<Person> personList = null;
		try {
			personList = dao.showSearchPersonByUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return personList;
	}
	
}
