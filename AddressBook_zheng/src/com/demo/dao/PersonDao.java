package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.domain.Person;
import com.demo.utils.JDBCUtils;

public class PersonDao {
	//查询所有的person
	public List<Person> findAllPerson() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Person> list = new ArrayList<Person>();
		try {
			//1. 获取连接对象
			conn=JDBCUtils.getConnection();
			//2. sql语句
			String sql = "select * from person";
			//3. 获取执行SQL语句的对象
			pstmt = conn.prepareStatement(sql);
			//4. 执行操作，获取结果集
			rs = pstmt.executeQuery();
			//5. 循环，并封装到person类中
			while(rs.next()){
				Person person = new Person();
				person.setId(rs.getString("id"));
				person.setName(rs.getString("name"));
				person.setBirthday(rs.getString("birthday"));
				person.setPhone(rs.getString("phone"));
				person.setEmail(rs.getString("email"));
				person.setMemo(rs.getString("memo"));
				//封装完成，添加到list中
				list.add(person);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			// 6. 关闭资源
			JDBCUtils.release(conn, pstmt, rs);
		}
		//返回结果集给上一层
		return list;
	}
	//删除联系人
	public void deletePersonById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1.获取连接
			conn= JDBCUtils.getConnection();
			//2.sql语句
			String sql = "delete from person where id = ?";
			//3.获取执行SQL语句的对象
			pstmt = conn.prepareStatement(sql);
			//4.设置参数
			pstmt.setString(1, id);
			//5.执行删除操作
			@SuppressWarnings("unused")
			int row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JDBCUtils.release(conn, pstmt, null);
		}
				
		
	}
	//添加用户
	public void addPerson(Person person) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = JDBCUtils.getConnection();
			String sql = "insert into person values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			//设置参数
			pstmt.setString(1, person.getId());
			pstmt.setString(2, person.getName());
			pstmt.setString(3, person.getBirthday());
			pstmt.setString(4, person.getPhone());
			pstmt.setString(5, person.getEmail());
			pstmt.setString(6, person.getMemo());
			//插入
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtils.release(conn, pstmt, null);
		}
	}
	//根据id查询用户
	public Person findPersonById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Person person = new Person();
		try {
			conn = JDBCUtils.getConnection();
			String sql = "select * from person where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				//将查询到的对象封装在person中
				person.setId(rs.getString("id"));
				person.setName(rs.getString("name"));
				person.setBirthday(rs.getString("birthday"));
				person.setPhone(rs.getString("phone"));
				person.setEmail(rs.getString("email"));
				person.setMemo(rs.getString("memo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return person;
	}
	//根据id更新联系人信息，姓名不可更新
	public void updatePersonById(Person person) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = JDBCUtils.getConnection();
			String sql = "update person set birthday=?, phone=?, email=?,memo=? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, person.getBirthday());
			pstmt.setString(2, person.getPhone());
			pstmt.setString(3, person.getEmail());
			pstmt.setString(4, person.getMemo());
			pstmt.setString(5, person.getId());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JDBCUtils.release(conn, pstmt, null);
		}
		
	}

}
