package com.lexiecn.callname.po;

import com.xxdw.platform.common.Pojo;

public class Student extends Pojo{

	private static final long serialVersionUID = -7109849600603943801L;
	private int id;
	private String sclass;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getSclass() {
		return sclass;
	}
	
	public void setSclass(String sclass) {
		this.sclass = sclass;
	}
	
}
