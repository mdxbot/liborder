package com.lexiecn.callname.po;

import java.sql.Date;

import com.xxdw.platform.common.Pojo;

public class Order extends Pojo{

	private static final long serialVersionUID = -5436150319268865801L;
	private int id;
	private int laboratory_id;
	private int user_id;
	private Date order_time;
	private String experiment;
	private int num;
	private Date begin;
	private Date end;
	private String state;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
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
	
	public Date getOrder_time() {
		return order_time;
	}
	
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	
	public String getExperiment() {
		return experiment;
	}
	
	public void setExperiment(String experiment) {
		this.experiment = experiment;
	}
	
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
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
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
}
