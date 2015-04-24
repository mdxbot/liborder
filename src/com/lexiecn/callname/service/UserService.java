package com.lexiecn.callname.service;

import java.sql.SQLException;
import java.util.List;

import com.lexiecn.callname.dao.UserDao;
import com.lexiecn.callname.po.User;

public class UserService {

	private UserDao userDao;
	private static UserService userService = null;

	private UserService() {
		this.userDao = UserDao.getInstance();
	}

	public static UserService getInstance() {
		if (userService == null) {
			userService = new UserService();
		}
		return userService;
	}
	// ---------------------------------------------------------
	
	public User getUserInfo(String account) throws SQLException{
		return userDao.getUserInfo(account);
	}
	
	public List<User> getAllUser() throws SQLException{
		return userDao.getAllUser();
	}
}
