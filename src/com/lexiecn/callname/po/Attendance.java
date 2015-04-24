package com.lexiecn.callname.po;

import com.xxdw.platform.common.Pojo;

public class Attendance extends Pojo {	
	private static final long serialVersionUID = 7685926863311000038L;
	private String id;
	private String status; 
    private String sequence;
    private String name;
    private String[] marks;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatusText() {
		String text = "状态";
		
		if (status.equals("OK"))
			text = "正常";
		else if (status.equals("NO"))
			text = "未修";
		
		return text;
	}
	public String getSequence() {
		return sequence;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String[] getMarks() {
		return marks;
	}
	public void setMarks(String[] marks) {
		this.marks = marks;
	}
	public int getMarksNum() {
		return this.marks.length;
	}	
}
