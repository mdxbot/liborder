package com.lexiecn.callname.bean;

import com.xxdw.platform.controller.PartpageForm;

public class AttendanceForm extends PartpageForm {

    private String classId 		= "";
	private String order       	= "";
	private String stuId      	= "";
	private String mark       	= "";
	
	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}
	
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	@Override
	public boolean validate() {
		boolean flag = true ;
		
//		if(!this.username.matches("\\w[\\w\\d_]{4,24}")){
//			flag = false ;
//			this.errors.put("errUsername", "用户名应由字母、数字或下划线组成。") ;
//		}
//		if(!this.password.matches(".{5,25}")){
//			flag = false ;
//			this.errors.put("errPassword", "密码应为5-25字符。") ;
//		}
//		if(!this.myname.matches(".{2,25}")){
//			flag = false ;
//			this.errors.put("errMyname", "名称应为2-25字符。") ;
//		}
//		if(!this.phone.matches("[\\d, ]{11,30}")){
//            flag = false ;
//            this.errors.put("errPhone", "电话应仅含11-30个数字、逗号或空格字符。") ;
//        }
//		if(!this.email.matches(".{0,255}")){
//			flag = false ;
//			this.errors.put("errEmail", "Email格式不正确。");
//		}
		return flag ;
	}
}
