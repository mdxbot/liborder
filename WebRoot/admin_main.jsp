<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="<%=basePath%>/css/Admincss.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="3" class="border" style="margin-top:15px;">
      <tr align="center">
        <td height="25" colspan="2" bgcolor="#F7F7F7" class="title"><strong></strong></td>
      </tr>
      <tr>
        <td class="title2" height="23" colspan="2"><span class="TextLine-height">欢迎您使用: <font face="Verdana, Arial, Helvetica, sans-serif"><b>实验室预约管理系统</b></font><font ></span></td>
      </tr>
      <tr class="tdbg">
        <td width="100%" height="23" colspan="2"><span class="TextLine-height">当前使用版本：<font face="Verdana, Arial, Helvetica, sans-serif"><b>毕设第一版</b></font></span></td>
      </tr>
      
    </table></td>
  </tr>
</table>
</body>
</html>
