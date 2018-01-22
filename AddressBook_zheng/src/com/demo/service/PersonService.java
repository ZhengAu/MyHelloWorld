package com.demo.service;

import java.util.List;
import com.demo.dao.PersonDao;
import com.demo.domain.Person;

public class PersonService {
	PersonDao dao = new PersonDao();
	
	// ��ѯ���е�person
	public List<Person> findAllPerson() {
		List<Person> list = dao.findAllPerson();
		return list;
	}
	//ɾ����ϵ��
	public void deletePersonById(String id) {
		dao.deletePersonById(id);
		
	}
	//����û�
	public void addPerson(Person person) {
		dao.addPerson(person);
	}
	//����id��ѯ�û�
	public Person findPersonById(String id) {
		Person person = null;
		person = dao.findPersonById(id);
		return person;
	}
	//����id������ϵ����Ϣ
	public void updatePersonById(Person person) {
		dao.updatePersonById(person);
		
	}

}
