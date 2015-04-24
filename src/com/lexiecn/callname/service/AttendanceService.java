package com.lexiecn.callname.service;

import java.util.List;

import com.lexiecn.callname.dao.AttendanceDao;
import com.lexiecn.callname.po.Attendance;
import com.xxdw.platform.common.KeyValue;

public class AttendanceService {
	private AttendanceDao 	attendanceDao;

	private static AttendanceService softwareService = null;
	private AttendanceService() {
		this.attendanceDao = AttendanceDao.getInstance();
	}
	
	public static AttendanceService getInstance() {
		if(softwareService == null) {
			softwareService = new AttendanceService();
		}
		return softwareService;
	}
	
	public static void setRollDir(String strRollDir) {
		AttendanceDao.setRollDir(strRollDir);
	}
	
	//---------------------------------------------------------
	public int getClassesNum() {
		return this.attendanceDao.getClassesNum();
	}
	
	public List<KeyValue<Integer, String>> getAllClasses() {
		return this.attendanceDao.getAllClasses();
	}
	
	public List<Attendance> findAllByClassId(int id) {
		return this.attendanceDao.findAllByClassId(id);
	}
	
	public boolean saveAllByClassId(int id, List<Attendance> list) {
		return this.attendanceDao.saveAllByClassId(id, list);
	}
}
