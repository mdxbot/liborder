package com.lexiecn.callname.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiecn.callname.po.Paper;
import com.xxdw.platform.db.DbUtil;

public class CommonDao {

	private static CommonDao commonDao = null;

	private CommonDao() {}

	public static CommonDao getInstance() {
		if (commonDao == null) {
			commonDao = new CommonDao();
		}
		return commonDao;
	}
	// ----------------------------------------------------------
	public List<Paper> getPaperCode() throws SQLException {

		String strSql = "SELECT * FROM t_paper ORDER BY f_code";
		return DbUtil.executeQuery(strSql, Paper.class);
	}	

	public void setAutoQuitTime(int number) throws SQLException {
		String strSql = "UPDATE t_setting SET f_intValue=" + number + ", f_updateTime=now() WHERE f_key='auto_quit_time'";
		DbUtil.executeUpdate(strSql);
	}

	public int getAutoQuitTime() throws SQLException {
		String strSql = "SELECT f_intValue FROM t_setting WHERE f_key='auto_quit_time'";
		return (Integer)DbUtil.executeScalar(strSql);
	}

	public void addHomepagePicture(String url) throws SQLException {
		String strSql = "UPDATE t_setting SET f_charValue='" + url + "' WHERE f_key='homepage_picture'";
		DbUtil.executeUpdate(strSql);
	}

	public String getHomepagePicture() throws SQLException {
		String strSql = "SELECT f_charValue FROM t_setting WHERE f_key='homepage_picture'";
		return (String)DbUtil.executeScalar(strSql);
	}
}
