package com.lexiecn.callname.po;

import com.xxdw.platform.common.Pojo;

public class CourseGrade extends Pojo{

	private static final long serialVersionUID = -3528920998610457239L;
	private int id;
	private int student_id;
	private int course_id;
	private int grade;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getStudent_id() {
		return student_id;
	}
	
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	
	public int getCourse_id() {
		return course_id;
	}
	
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	
	public int getGrade() {
		return grade;
	}
	
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}