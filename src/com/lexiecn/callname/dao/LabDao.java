package com.lexiecn.callname.dao;

import java.sql.SQLException;
import java.util.List;

import com.lexiecn.callname.po.Laboratory;
import com.xxdw.platform.db.DbUtil;

public class LabDao {

	private static LabDao labDao = null;

	private LabDao() {
	}

	public static LabDao getInstance() {
		if (labDao == null) {
			labDao = new LabDao();
		}
		return labDao;
	}

	// ----------------------------------------------------------

	public List<Laboratory> getAllLab() throws SQLException {
		String strSql = "SELECT * FROM t_laboratory ORDER BY f_name";
		return DbUtil.executeQuery(strSql, Laboratory.class);
	}

	public List<Laboratory> findAllByManagerId(String id) throws SQLException {
		String strSql = "SELECT * FROM t_laboratory where f_user_id='" + id
				+ "'";
		return DbUtil.executeQuery(strSql, Laboratory.class);
	}

	public Laboratory getLabByAddress(String address) throws SQLException {
		String strSql = "SELECT * FROM t_laboratory where f_address='"
				+ address + "'";
		List<Laboratory> lab = DbUtil.executeQuery(strSql, Laboratory.class);
		if (lab.isEmpty()) {
			return null;
		} else {
			return lab.get(0);
		}
	}

	public Laboratory getLabById(int id) throws SQLException {
		String strSql = "SELECT * FROM t_laboratory where f_id='" + id + "'";
		List<Laboratory> lab = DbUtil.executeQuery(strSql, Laboratory.class);
		if (lab.isEmpty()) {
			return null;
		} else {
			return lab.get(0);
		}
	}

	public int setLabInfo(int id, String name, String address, int managerId,
			String introduction, int capacity) throws SQLException {
		String strSql = "UPDATE t_laboratory SET f_name='" + name
				+ "', f_address='" + address + "', f_user_id='" + managerId
				+ "', f_introduction='" + introduction + "', f_capacity='"
				+ capacity + "' WHERE f_id='" + id + "'";
		return DbUtil.executeUpdate(strSql);
	}

	public int addLab(String name, String address, int managerId,
			String introduction, int capacity) throws SQLException {
		String strSql = "INSERT INTO t_laboratory (f_name, f_address, f_user_id, f_introduction, f_capacity) VALUES ('"
				+ name + "', '" + address + "', '" + managerId + "', '"
				+ introduction + "', '" + capacity + "')";
		return DbUtil.executeUpdate(strSql);
	}

	public int deleteLab(int id) throws SQLException {
		String strSql = "DELETE FROM t_lab WHERE f_id='" + id + "'";
		return DbUtil.executeUpdate(strSql);
	}

	/*
	 * public List<Laboratory> findAllByOpenTime(Date begin, Date end) throws
	 * SQLException { String strSql =
	 * "SELECT * FROM t_laboratory WHERE f_id=(SELECT DISTINCT f_laboratory_id FROM t_lab_open_time where DATEDIFF([hour], f_end , "
	 * + begin + ")<0 AND DATEDIFF([hour], f_begin , " + end + ")>0)"; return
	 * DbUtil.executeQuery(strSql, Laboratory.class); }
	 */

}
