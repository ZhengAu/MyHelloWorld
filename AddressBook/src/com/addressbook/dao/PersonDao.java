package com.addressbook.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.addressbook.domain.Person;
import com.addressbook.utils.DataSourceUtils;

public class PersonDao {
	
	public Long checkUsername(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from person where username = ?";
		Long query = (Long) runner.query(sql, new ScalarHandler(), username);
		return query;
	}

	/**
	 * 查询全部联系人信息
	 * @throws SQLException 
	 */
	public List<Person> findAllPerson() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from person";
		return runner.query(sql, new BeanListHandler<Person>(Person.class));
	}
	
	
	/**
	 * 删除某个联系人信息
	 * @throws SQLException 
	 */
	public void deletePersonById(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "delete from person where id = ?";
		runner.update(sql, id);
	}
	
	/**
	 * 添加联系人信息
	 */
	public void addPerson(Person person) throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into person values(?,?,?,?,?,?,?,?)";
		Object[] params = {person.getId(),person.getUsername(),person.getBirthDate(),person.getGender(),
				person.getTelephone(),person.getEmail(),person.getQq(),person.getRemarks()};
		runner.update(sql, params);
	}
	

	public Person findPersonByIdForEdit(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from person where id = ?";
		return runner.query(sql, new BeanHandler<Person>(Person.class), id);
	}

	public void editPersonById(Person person) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update person set username=?,birthDate=?,gender=?,telephone=?,email=?,qq=?,remarks=? where id=?";
		Object[] params = {person.getUsername(),person.getBirthDate(),person.getGender(),person.getTelephone(),
				person.getEmail(),person.getQq(),person.getRemarks(),person.getId()};
		runner.update(sql, params);
	}

	//查询单列username
	public List<Object> searchPersonByUsername(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from person where username like ? limit 0,5";
		List<Object> query = runner.query(sql, new ColumnListHandler("username"),"%"+username+"%");
		return query;
	}
	//显示所有查询的数据
	public List<Person> showSearchPersonByUsername(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from person where username like ?";
		List<Person> personList = runner.query(sql, new BeanListHandler<Person>(Person.class), "%"+username+"%");
		return personList;
	}
	
}
