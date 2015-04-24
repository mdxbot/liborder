package com.lexiecn.callname.action;

import java.text.SimpleDateFormat;
import java.util.List;

import com.lexiecn.callname.bean.AttendanceForm;
import com.lexiecn.callname.po.Attendance;
import com.lexiecn.callname.service.AttendanceService;
import com.xxdw.platform.common.JsonResultVo;
import com.xxdw.platform.controller.Action2;

public class AttendanceAction extends Action2 {
	private AttendanceForm 	formBean	= null;

	public void setFormBean(AttendanceForm formBean) {
		this.formBean = formBean;
	}
	public AttendanceForm getFormBean() {
		return formBean;
	}

	public String list() {
		//AttendanceService.setRollDir(this.getSystemOption("roll_dir"));
		AttendanceService serv = AttendanceService.getInstance();
				
		String strClassId = request.getParameter("classId");
		int classId = -1;
		try {
			classId = Integer.parseInt(strClassId);
			if (classId < 0 || classId >= serv.getClassesNum()) {
				throw new NumberFormatException();
			}
		} catch (NumberFormatException e) {
			return ERROR;
		}
		
		List<Attendance> list = serv.findAllByClassId(classId);
		session.setAttribute("listAttendance", list);
		request.setAttribute("listAttendance", list);
		request.setAttribute("listSize", list.size());
		request.setAttribute("classId", classId);
		
		return SUCCESS;
	}
	
	public String addMarkAjax() {
		JsonResultVo jsonVo = new JsonResultVo(JsonResultVo.ERR_FAIL, "");
		if (addMark()) {
			jsonVo.setErr(JsonResultVo.ERR_SUCCESS);
			jsonVo.setMsg(this.formBean.getMark());
		}
		this.print(jsonVo);
		return null;
	}
	
	public String addMarkHtml() {
		if (addMark()) {
			@SuppressWarnings("unchecked")
			List<Attendance> list = (List<Attendance>) session.getAttribute("listAttendance");
			request.setAttribute("listAttendance", list);
			request.setAttribute("listSize", list.size());
			request.setAttribute("classId", this.formBean.getClassId());
			
			return SUCCESS;
		}
		
		return ERROR;
	}
	
	private boolean addMark() {
		AttendanceService serv = AttendanceService.getInstance();
		
		String strClassId = this.formBean.getClassId();
		String strOrder = this.formBean.getOrder();
		String strMark = this.formBean.getMark();
		int order = 0;
		int classId = -1;
		try {
			classId = Integer.parseInt(strClassId);
			order = Integer.parseInt(strOrder);
			if (classId < 0 || classId >= serv.getClassesNum()) {
				throw new NumberFormatException();
			}
		} catch (NumberFormatException e) {
			return false;
		}
		
		@SuppressWarnings("unchecked")
		List<Attendance> list = (List<Attendance>) session.getAttribute("listAttendance");
		if (list == null || order < 0 || order >= list.size()) {
			return false;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String today = sdf.format(new java.util.Date());
		Attendance atte = list.get(0);
		String[] marks = atte.getMarks();
		int i;
		for(i = 0; i < marks.length; i++) {
			if (marks[i].equals(today)) break;
		}
		if (i == marks.length) {
			System.out.println("Column number error.");
			return false;
		}

		atte = list.get(order);
		marks = atte.getMarks();
		if (strMark.equals("REMOVE")) {	// 标记未修
			atte.setStatus("NO");
		}
		else if (strMark.equals("0")) {	// 还原
			marks[i] = "0";
		}
		else if (marks[i].equals("X") || marks[i].equals("Q")) {
			if (strMark.equals("L")) {
				marks[i] = "-2";	// 迟到扣2分
			} 
			else {
				return false;
			}
		}
		else {	// 原先是分数
			if (strMark.equals("X") || strMark.equals("Q")) {
				marks[i] = strMark;
			}
			else {
				try {
					int m = Integer.parseInt(marks[i]);
					int mark = Integer.parseInt(strMark.equals("L") ? "-2" : strMark);
					m += mark;
					marks[i] = m + "";
				} catch (NumberFormatException e) {
					return false;
				}
			}
		}
		
		return serv.saveAllByClassId(classId, list);
	}
}
