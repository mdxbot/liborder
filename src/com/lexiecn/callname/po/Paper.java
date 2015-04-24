package com.lexiecn.callname.po;

import com.xxdw.platform.common.Pojo;

public class Paper extends Pojo {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4481779080563269323L;
	private String code;
	private String myname;
	private Integer mywidth;
	private Integer myheight;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMyname() {
		return myname;
	}
	public void setMyname(String myname) {
		this.myname = myname;
	}
	public Integer getMywidth() {
		return mywidth;
	}
	public void setMywidth(Integer mywidth) {
		this.mywidth = mywidth;
	}
	public Integer getMyheight() {
		return myheight;
	}
	public void setMyheight(Integer myheight) {
		this.myheight = myheight;
	}
}