package com.lexiecn.callname.action;

import java.sql.SQLException;
import java.util.List;

import com.lexiecn.callname.bean.LoginForm;
import com.lexiecn.callname.po.User;
import com.lexiecn.callname.service.AttendanceService;
import com.lexiecn.callname.service.UserService;
import com.xxdw.platform.common.KeyValue;
import com.xxdw.platform.controller.Action2;

public class LoginLogoutAction extends Action2 {
	private static final String TOP = "top";
	private static final String LEFT = "left";
	private static final String MAIN = "main";

	private LoginForm formBean;

	public void setFormBean(LoginForm formBean) {
		this.formBean = formBean;
	}

	public LoginForm getFormBean() {
		return formBean;
	}

	public String testPerformance() {
		System.out.println("testPerformance");
		LoginForm vo = (LoginForm) this.formBean;
		User user = (User) vo.toPojo(User.class);
		request.setAttribute("user", user);
		return "test";
	}

	public String login() {
		String verifycode = (String) this.session.getAttribute("verifycode");
		UserService userService = UserService.getInstance();

		if (!formBean.getAuthcode().equals(verifycode)) {
			formBean.setErrorMsg("errAuthcode", "验证码错误");
			return INPUT;
		}
		if (!this.formBean.validate()) {
			return INPUT;
		}

		LoginForm vo = (LoginForm) this.formBean;
		User user = null;
		try {
			if (userService.getUserInfo(vo.getUsername())!=null) {
				user = userService.getUserInfo(vo.getUsername());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (!(user != null && vo.getPassword().equals(user.getPassword()))) {
			formBean.setErrorMsg("err", "用户名和密码不匹配。");
			return INPUT;
		}

		this.setUser(user);
		return SUCCESS;
	}

	public String logout() {
		this.session.invalidate();
		return HOMEPAGE;
	}

	public String top() {
		request.setAttribute("user", this.getUser());
		return TOP;
	}

	public String left() {
		AttendanceService.setRollDir(this.getSystemOption("roll_dir"));
		AttendanceService serv = AttendanceService.getInstance();
		List<KeyValue<Integer, String>> list = serv.getAllClasses();
		request.setAttribute("listClasses", list);
		request.setAttribute("user", this.getUser());
		// request.setAttribute("mapClasses", KeyValue.toMap(list));
		return LEFT;
	}

	public String main() {
		return MAIN;
	}
}
