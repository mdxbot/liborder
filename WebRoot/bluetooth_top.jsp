<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<base href="<%=basePath%>bg/" target="_top"/> 
<link href="<%=basePath%>/css/Admincss.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/bluetooth_style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="1002" height="60" background="<%=basePath%>/images/web_title.jpg">
	    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	    <td width="60%" align="right" style="font-size:12pt; color:#5686b0;">
	       <table width="30%" border="0" align="right" cellpadding="0" cellspacing="0">
	          <tr>
	            <td width="10%" align="left"><img src="<%=basePath%>/images/admin-19.jpg" width="16" height="12" /></td>
	            <td width="90%" align="left">欢迎您：<span class="NewsInfoTime" style="font-size:12pt">${user.username}</span>
	            &nbsp;</td>
	          </tr>
	        </table>
	     </td>
	     <td width="15%" style="font-size:12px; color:#5686b0;">
	        <a href="loginlogout_logout.action"><input type="button" value="退出系统" /></a>
	     </td>
	     <td width="25%" style="font-size:12px; color:#5686b0;">
		     <div id="linkweb" style="font-size:12pt"></div>
	        <script>setInterval("linkweb.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
	        </script>
	     </td>
	     </tr>
	    </table>
    </td>
    <td background="<%=basePath%>/images/admin-13.jpg">&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="1" bgcolor="#0084C4"></td>
  </tr>
</table>
</body>
</html>

