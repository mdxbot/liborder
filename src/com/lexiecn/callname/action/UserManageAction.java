package com.lexiecn.callname.action;

import java.sql.SQLException;
import java.util.List;

import com.lexiecn.callname.po.User;
import com.lexiecn.callname.service.UserService;
import com.xxdw.platform.controller.Action2;

public class UserManageAction extends Action2{
	
	public String list(){
		UserService serv = UserService.getInstance();
		
		List<User> list = null;
		try {
			list = serv.getAllUser();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("listUsers", list);
		request.setAttribute("listUsers", list);
		request.setAttribute("listSize", list.size());
		
		return SUCCESS;
	}
}
