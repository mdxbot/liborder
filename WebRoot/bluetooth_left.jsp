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
<link href="<%=basePath%>/css/Admincss.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/bluetooth_style.css" rel="stylesheet" type="text/css" />
<script language=JavaScript src="<%=basePath%>/js/left-menu-bluetooth.js"></script>
<style type="text/css">
body {
	background-image: url(<%=basePath%>/images/admin-15.jpg);
	background-repeat: repeat-y;
	background-position:left;
}
</style>
</head>
<body>
<table width="190" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" valign="bottom" background="<%=basePath%>/images/admin-16.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(1)">用户及权限管理</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM1" style="width:100%;padding:10px;DISPLAY: block">
          <c:forEach items="${listClasses}" var="kv" varStatus="stat">
          <div>
              <img src="<%=basePath%>/images/index-7.jpg" width="3" height="3" />
              <a href="bluetooth_list.action?classId=${kv.key}" target="mainFrame">${kv.value}</a>
          </div>
          </c:forEach>
      </div>
      </td>
  </tr>
</table>
<table width="190" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" valign="bottom" background="<%=basePath%>/images/admin-16.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink"  style="font-size:12pt" onclick="javascript:ShowFLT(2)">基础资料管理</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM2" style="width:100%;padding:10px;DISPLAY: none">
          <c:forEach items="${listClasses}" var="kv" varStatus="stat">
          <div>
              <img src="<%=basePath%>/images/index-7.jpg" width="3" height="3" />
              <a href="bluetooth_list.action?classId=${kv.key}" target="mainFrame">${kv.value}</a>
          </div>
          </c:forEach>
      </div>
      </td>
  </tr>
</table>
<table width="190" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" valign="bottom" background="<%=basePath%>/images/admin-16.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(3)">植被数据管理</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM3" style="width:100%;padding:10px;DISPLAY: none">
          <c:forEach items="${listClasses}" var="kv" varStatus="stat">
          <div style="height:36px;padding-top:16px">
              <img src="<%=basePath%>/images/index-7.jpg" width="3" height="3" />
              <a href="bluetooth_list.action?classId=${kv.key}" target="mainFrame">${kv.value}</a>
          </div>
          </c:forEach>
      </div>
      </td>
  </tr>
</table>
<table width="190" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" valign="bottom" background="<%=basePath%>/images/admin-16.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(5)">系统管理</a></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr></tr>
        <tr id="LM4" style="DISPLAY: none">
          <td><table width="94%" border="0" align="center" cellpadding="0" cellspacing="2" style="margin:4px 0 4px 0;">
            <tr>
              <td width="9%" align="center" class="TextLine-height"><img src="<%=basePath%>/images/index-7.jpg" width="3" height="3" /></td>
              <td width="91%" class="TextLine-height"><a href="admin_setup.jsp" target="mainFrame">系统参数设置</a></td>
            </tr>
            <tr>
              <td align="center" class="TextLine-height"><img src="<%=basePath%>/images/index-7.jpg" width="3" height="3" /></td>
              <td class="TextLine-height"><a href="admin_pw.jsp" target="mainFrame">修改密码</a></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
