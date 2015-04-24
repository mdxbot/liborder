<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>/" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>点名提问系统</title>
</head>
<frameset rows="62,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="bluetooth_top.action" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
  <frameset rows="*" cols="215,*" framespacing="0" frameborder="no" border="0">
    <frame src="bluetooth_left.action" name="leftFrame" scrolling="yes" noresize="noresize" id="leftFrame" />
    <frame src="bluetooth_main.action" name="mainFrame" id="mainFrame" />
  </frameset>
  <noframes></noframes>
</frameset>

</html>
