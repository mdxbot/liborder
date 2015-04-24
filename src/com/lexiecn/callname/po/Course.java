package com.lexiecn.callname.po;

import java.sql.Date;

import com.xxdw.platform.common.Pojo;

public class Course extends Pojo{
	
	private static final long serialVersionUID = 8580784380346776142L;
	private int id;
	private String name;
	private int laboratory_id;
	private int user_id;
	private Date begin;
	private Date end;
	private String introduction;
	private int num;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getLaboratory_id() {
		return laboratory_id;
	}
	
	public void setLaboratory_id(int laboratory_id) {
		this.laboratory_id = laboratory_id;
	}
	
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public Date getBegin() {
		return begin;
	}
	
	public void setBegin(Date begin) {
		this.begin = begin;
	}
	
	public Date getEnd() {
		return end;
	}
	
	public void setEnd(Date end) {
		this.end = end;
	}
	
	public String getIntroduction() {
		return introduction;
	}
	
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}

}
