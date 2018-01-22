package com.addressbook.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.addressbook.domain.Root;
import com.addressbook.utils.DataSourceUtils;

public class LoginDao {
	public Root login(String username, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from root where username = ? and password = ?";
		return runner.query(sql, new BeanHandler<Root>(Root.class), username,password);
	}

}
