<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
request.setCharacterEncoding("gbk");
String username = request.getParameter("username");
String email = request.getParameter("email");
%>
<html>
<head>
<title>结果</title>
</head>
<body>
    <p>您注册的信息是：</p>
    <ol>
        <li>姓名：<%=username%></li>
        <li>Email:<%=email%></li>
    </ol>    
</body>
</html>

