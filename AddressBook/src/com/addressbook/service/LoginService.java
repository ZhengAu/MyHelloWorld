package com.addressbook.service;

import java.sql.SQLException;

import com.addressbook.dao.LoginDao;
import com.addressbook.domain.Root;

public class LoginService {
	LoginDao dao = new LoginDao();
	public Root login(String username, String password) {
		Root root = null;
		try {
			root = dao.login(username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return root;
	}

}
