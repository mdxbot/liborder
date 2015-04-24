
//validation.js

function platform_input_check(frm) {
	if(frm.password.value != frm.password2.value) {
		alert("两次输入的密码不一致！");
		return false;
	}
	return true;
}

function platform_input_delete(frm, action) {
	if(confirm("您确定要删除该用户吗？")) {
		frm.action = action;
		frm.submit();
	}
}

function user_input_check() {
	if(frm.password.value != frm.password2.value) {
		alert("两次输入的密码不一致！");
		return false;
	}
	return true;
}

function plant_input_check(frm) {
	var rs = true;
	/*$(':text.norm', frm).each(function(i) {
		if($.trim(this.value) != '' && !/^[\d]{1,4}(\.\d{1,2})?$/.test(this.value)) {
			alert("数字格式不正确");
			this.focus();
			rs = false;
		}
	});*/
	return rs;
}

function setting_input_check(frm) {
	return true;
}
