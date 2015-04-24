<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<base href="<%=basePath%>" target="_self"/> <!-- base标签作用于非以'/'开头的url -->
<link href="<%=basePath%>/css/Admincss.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/bluetooth_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.js" ></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.corner.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.dimensions.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.op.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bbs/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
<!--
$(document).ready(function() {
	// 设置输入表单格式
	$('table.form_input tr').each(function(i) {
		$(this).find('td:first').css({width:'25%',textAlign:'right'});
		$(this).find('td:last').css({width:'35%',textAlign:'left',color:'red'});
	});
	$('table.form_input tr:last td').css({textAlign:'center'});
	
	// 隐藏空的分页栏
	if($.trim($('.page_bar').text()) == '') {
		$('.page_bar').hide();
	}
	
	// 错误信息用Dialog显示
	/*if($('.result_bar .alert').length > 0) {
		var msg = $('.result_bar span.alert').text();
		if(msg != null) {
			$('.result_bar span.alert').jlmModal({ttl:'提示',wdth:400,hght:180})
		}
	}*/
});

// para 为额外参数，若para不为空须保证id不为空
function doAction(action, id, confirmStr, para) {
	var frm = document.forms[0];
	
	frm.action = action + ((id == null) ? "" : "?id=" + id) + ((para == null) ? "" : "&para=" + para);
	if(confirmStr != null && !confirm(confirmStr)) return;
	frm.submit();
}
-->
</script>
</head>
<body>

