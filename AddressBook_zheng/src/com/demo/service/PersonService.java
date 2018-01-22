package com.demo.service;

import java.util.List;
import com.demo.dao.PersonDao;
import com.demo.domain.Person;

public class PersonService {
	PersonDao dao = new PersonDao();
	
	// 查询所有的person
	public List<Person> findAllPerson() {
		List<Person> list = dao.findAllPerson();
		return list;
	}
	//删除联系人
	public void deletePersonById(String id) {
		dao.deletePersonById(id);
		
	}
	//添加用户
	public void addPerson(Person person) {
		dao.addPerson(person);
	}
	//根据id查询用户
	public Person findPersonById(String id) {
		Person person = null;
		person = dao.findPersonById(id);
		return person;
	}
	//根据id更新联系人信息
	public void updatePersonById(Person person) {
		dao.updatePersonById(person);
		
	}

}
