<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>实验室预约管理系统</title>
<base href="<%=basePath%>" target="_self"/> 
<link href="css/Admincss.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.op.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
$(document).ready(function() {
    // 设置输入表单各列的对齐及宽度
    $('#idVerifycode').click(function(){
        $('#idVerifycode').attr("src", "<%=basePath%>bg/verifycode.jsp");
        //err($('#idVerifycode').attr("src"));
    });
    
    /*$('#idTestJSON').click(function(){
    	// $.post("loginlogout_getUserList.action", function(jsonData) {
    		//alert(jsonData);return;
    	$.getJSON("loginlogout_getUserList.action", function(jsonData) { 
    		if(jsonData.err == 'SUCCESS') {
    			$('#idUsers').loadSelect(jsonData.data);
            }
        }); 
    	*/
    	// $.ajaxDo 用于自动提交表单数据
    	/*$.ajaxDo("loginlogout_getUserList.action", null, function(jsonData){
	        //alert(jsonData.result);return;
	        if(jsonData.err == 'SUCCESS') {
	            //alert(jsonData.data);
	            //$('#code').val(jsonData.data);
	            $('idUsers').loadSelect(jsonData.data);
	        }
	    }, "json", null);
    });*/
});
    
function check(frm) {
	//frm.action="loginlogout_login.action?id=" + encodeURIComponent('中国');
	//alert(frm.action);
	if(frm.username.value == '') {
		alert("请输入用户名!");
		return false;
	}
	return true;
}    
    
-->
</script>
</head>

<body>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:100px;">
  <tr>
    <td width="323"><img src="images/admin-1.jpg" width="323" height="43" /></td>
    <td width="389" style="background:url('images/admin-2.jpg')" class="err" align="right">
        ${formBean.errors.err}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><img src="images/admin-3.jpg" width="290" height="43" /></td>
  </tr>
  <tr>
    <td style="background:url('images/admin-4.jpg')"></td>
    <td style="background:url('images/admin-5.jpg')">
        <form id="form1" name="form1" method="post" action="loginlogout_login.action" onsubmit="javascript:check(this);">
		<table width="90%" border="0" cellpadding="0" cellspacing="6">
		<tr>
		  <td width="9%" class="TextLine-height">&nbsp;</td>
		  <td width="18%">用户名：  </td>
		  <td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" />
		  <span class="err">${formBean.errors.errUsername}</span>
		  </td>
		</tr>
		<tr>
		  <td class="TextLine-height">&nbsp;</td>
		  <td>密&nbsp;&nbsp;码</td>
		  <td><input name="password" type="password" class="Userbox1" id="password" />
		  &nbsp;<span class="err">${formBean.errors.errPassword}</span></td>
		</tr>
		<tr>
		  <td class="TextLine-height">&nbsp;</td>
		  <td>验证码</td>
		  <td><input name="authcode" type="text" class="UserCodebox" id="authcode" />
		    <span class="NewsInfoTime">&nbsp;&nbsp;
		    <img id="idVerifycode" src="verifycode.jsp" style="width:52;height:18;vertical-align:center"/>
		    </span><span class="alert">${formBean.errors.errAuthcode}</span>
		  </td>
		</tr>		
		<tr>
		  <td class="TextLine-height">&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><input type="image" src="images/admin-10.jpg" style="width:94;height:25" />&nbsp;&nbsp;<img src="images/admin-11.jpg" width="94" height="25" /></td>
		</tr>
		<!-- 
		<tr><td colspan="3">
		  <select id="idUsers"><option value="__none__">未选择</option></select>
		  <input id="idTestJSON" type="button" value="测试JSON"/>
		  </td>
		</tr>
		 -->
		</table>
		</form>
    </td>
    <td><img src="images/admin-6.jpg" width="290" height="139" /></td>
  </tr>
  <tr>
    <td><img src="images/admin-7.jpg" width="323" height="97" /></td>
    <td><img src="images/admin-8.jpg" width="389" height="97" /></td>
    <td><img src="images/admin-9.jpg" width="290" height="97" /></td>
  </tr>
</table>
</body>
</html>
