package com.lexiecn.callname.dao;

import java.sql.SQLException;
import java.util.List;

import com.lexiecn.callname.po.User;
import com.xxdw.platform.db.DbUtil;

public class UserDao {

	private static UserDao userDao = null;

	private UserDao() {
	}

	public static UserDao getInstance() {
		if (userDao == null) {
			userDao = new UserDao();
		}
		return userDao;
	}

	// ----------------------------------------------------------

	public User getUserInfo(String account) throws SQLException {
		String strSql = "SELECT * FROM t_user WHERE f_account='" + account
				+ "'";
		List<User> user = DbUtil.executeQuery(strSql, User.class);
		if (user.isEmpty()) {
			return null;
		} else {
			return user.get(0);
		}
	}

	public List<User> findAllByType(String type) throws SQLException {
		String strSql = "SELECT * FROM t_user WHERE f_type ='" + type + "'";
		return DbUtil.executeQuery(strSql, User.class);
	}

	public List<User> getAllUser() throws SQLException {
		String strSql = "SELECT * FROM t_user";
		return DbUtil.executeQuery(strSql, User.class);
	}

	public int setUserInfo(String account, String password, String type,
			String name, String email, String telephone) throws SQLException {

		String strSql = "UPDATE t_user SET f_password='" + password
				+ "', f_type='" + type + "', f_name='" + name + "', f_email='"
				+ email + "', f_telephone='" + telephone
				+ "' WHERE f_account='" + account + "'";
		return DbUtil.executeUpdate(strSql);
	}

	public int addUser(String account, String password, String type,
			String name, String email, String telephone) throws SQLException {

		String strSql = "INSERT INTO t_user (f_account, f_password, f_type, f_name, f_email, f_telephone) VALUES ('"
				+ account + "', '" + password + "', '" + type + "', '"
				+ name + "', '" + email + "', '" + telephone + "');";
		return DbUtil.executeUpdate(strSql);
	}
	
	public int deleteUser(String account) throws SQLException{
		String strSql = "DELETE FROM t_user WHERE f_account='" + account +"'";
		return DbUtil.executeUpdate(strSql);
	}

}