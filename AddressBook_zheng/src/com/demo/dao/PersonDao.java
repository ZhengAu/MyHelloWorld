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
	//��ѯ���е�person
	public List<Person> findAllPerson() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Person> list = new ArrayList<Person>();
		try {
			//1. ��ȡ���Ӷ���
			conn=JDBCUtils.getConnection();
			//2. sql���
			String sql = "select * from person";
			//3. ��ȡִ��SQL���Ķ���
			pstmt = conn.prepareStatement(sql);
			//4. ִ�в�������ȡ�����
			rs = pstmt.executeQuery();
			//5. ѭ��������װ��person����
			while(rs.next()){
				Person person = new Person();
				person.setId(rs.getString("id"));
				person.setName(rs.getString("name"));
				person.setBirthday(rs.getString("birthday"));
				person.setPhone(rs.getString("phone"));
				person.setEmail(rs.getString("email"));
				person.setMemo(rs.getString("memo"));
				//��װ��ɣ���ӵ�list��
				list.add(person);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			// 6. �ر���Դ
			JDBCUtils.release(conn, pstmt, rs);
		}
		//���ؽ��������һ��
		return list;
	}
	//ɾ����ϵ��
	public void deletePersonById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1.��ȡ����
			conn= JDBCUtils.getConnection();
			//2.sql���
			String sql = "delete from person where id = ?";
			//3.��ȡִ��SQL���Ķ���
			pstmt = conn.prepareStatement(sql);
			//4.���ò���
			pstmt.setString(1, id);
			//5.ִ��ɾ������
			@SuppressWarnings("unused")
			int row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JDBCUtils.release(conn, pstmt, null);
		}
				
		
	}
	//����û�
	public void addPerson(Person person) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = JDBCUtils.getConnection();
			String sql = "insert into person values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			//���ò���
			pstmt.setString(1, person.getId());
			pstmt.setString(2, person.getName());
			pstmt.setString(3, person.getBirthday());
			pstmt.setString(4, person.getPhone());
			pstmt.setString(5, person.getEmail());
			pstmt.setString(6, person.getMemo());
			//����
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtils.release(conn, pstmt, null);
		}
	}
	//����id��ѯ�û�
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
				//����ѯ���Ķ����װ��person��
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
	//����id������ϵ����Ϣ���������ɸ���
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
