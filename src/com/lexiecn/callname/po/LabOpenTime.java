package com.lexiecn.callname.po;

import java.sql.Date;

import com.xxdw.platform.common.Pojo;

public class LabOpenTime extends Pojo{
	
	private static final long serialVersionUID = 3644356249955811312L;
	private int id;
	private int laboratory_id;
	private Date begin;
	private Date end;
	
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

}
