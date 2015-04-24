package com.lexiecn.callname.bean;

import com.xxdw.platform.controller.Form;

public class LoginForm extends Form {

	private String username;
	private String password;
	private String authcode;
	
	public LoginForm() {
		this.setUsername("") ;
		this.setPassword("") ;
		this.setAuthcode("") ;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}
	
	public void setAuthcode(String authcode) {
		this.authcode = authcode;
	}

	public String getAuthcode() {
		return authcode;
	}
	
	@Override
	public boolean validate() {
		boolean flag = true ;
		
		/*if(!this.username.matches("\\w[\\w\\d_]{0,20}")){
			flag = false ;
			this.errors.put("errUsername", "用户名格式错") ;
		}
		
		if(!this.password.matches(".{5,25}")){
			flag = false ;
			this.errors.put("errPassword", "密码格式错") ;
		}
		*/
		return flag ;
	}
}
