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
<title>实验室预约管理系统</title>
<link href="<%=basePath%>/css/Admincss.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/bluetooth_style.css" rel="stylesheet" type="text/css" />
<script language=JavaScript src="<%=basePath%>/js/left-menu-bluetooth.js">
</script>
<style type="text/css">
body {
	background-image: url(<%=basePath%>/images/admin-15.jpg);
	background-repeat: repeat-y;
	background-position:left;
}
</style>
</head>
<body>
<c:if test="${user.type=='A'}">
<table width="190" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" valign="bottom" background="<%=basePath%>/images/admin-16.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(1)">用户信息管理</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM1" style="width:100%;padding:10px;DISPLAY: none" >          
     <a href="user_list.action" target="mainFrame">用户信息</a></br>
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
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink"  style="font-size:12pt" onclick="javascript:ShowFLT(2)">实验室管理</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM2" style="width:100%;padding:10px;DISPLAY: none">
      <a href="lab_message.jsp" target="mainFrame">实验室信息列表</a></br>
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
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(3)">个人信息管理</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM3" style="width:100%;padding:10px;DISPLAY: none">
      <a href="person_message.jsp" target="mainFrame">修改</a></br>
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
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(4)">公告管理</a></td>
          </tr>
        </table></td>
      </tr>
    </table>
     <div id="LM4" style="width:100%;padding:10px;DISPLAY: none">
     <a href="change_message.jsp" target="mainFrame">修改公告</a></br>
      </div>
      </td>
  </tr>
 </table>
</c:if>

<c:if test="${user.type=='L'}">
<table width="190" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" valign="bottom" background="<%=basePath%>/images/admin-16.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(1)">审批预约信息</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM1" style="width:100%;padding:10px;DISPLAY: none">
      <a href="check_order.jsp" target="mainFrame">查看预约记录</a></br>
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
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink"  style="font-size:12pt" onclick="javascript:ShowFLT(2)">维护实验室信息</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM2" style="width:100%;padding:10px;DISPLAY: none">
      <a href="change_open.jsp" target="mainFrame">实验室信息查询</a></br>
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
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(3)">个人信息管理</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM3" style="width:100%;padding:10px;DISPLAY: none">
      <a href="person_message.jsp" target="mainFrame">修改</a></br>
      </div>
      </td>
  </tr>
</table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr></tr>
        <tr id="LM4" style="DISPLAY:none">
          <td><table width="94%" border="0" align="center" cellpadding="0" cellspacing="2" style="margin:4px 0 4px 0;">
            <tr>
              <td width="9%" align="center" class="TextLine-height"><img src="<%=basePath%>/images/index-7.jpg" width="3" height="3" /></td>
              <td width="91%" class="TextLine-height"><a href="admin_setup.jsp" target="mainFrame">系统参数设置</a></td>
            </tr>
           
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</c:if>
<c:if test="${user.type=='S'}">
<table width="190" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" valign="bottom" background="<%=basePath%>/images/admin-16.jpg" ><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(1)">个人信息管理</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM1" style="width:100%;padding:10px;DISPLAY: none">
      <a href="person_message.jsp" target="mainFrame">修改个人信息</a></br>
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
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink"  style="font-size:12pt" onclick="javascript:ShowFLT(2)">预约实验</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM2" style="width:100%;padding:10px;DISPLAY: none">
      <a href="student_order.jsp" target="mainFrame">预约</a></br>
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
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(3)">成绩查询</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM3" style="width:100%;padding:10px;DISPLAY: none">
      <a href="score_search.jsp" target="mainFrame">查询</a></br>
      </div>
      </td>
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
</c:if>
<c:if test="${user.type=='T'}">
<table width="190" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" valign="bottom" background="<%=basePath%>/images/admin-16.jpg"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(1)">个人信息管理</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM1" style="width:100%;padding:10px;DISPLAY: none">
      <a href="person_message.jsp" target="mainFrame">修改</a></br>
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
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink"  style="font-size:12pt" onclick="javascript:ShowFLT(2)">预约实验</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM2" style="width:100%;padding:10px;DISPLAY: none">
          <a href="set_experiment.jsp" target="mainFrame">设置实验室信息</a></br>
          <a href="check_stuorder.jsp" target="mainFrame">查询预约记录</a>
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
            <td width="90%" height="25" class="LeftTitle"><a href="javascript:void(null)" class="Menulink" style="font-size:12pt" onclick="javascript:ShowFLT(3)">成绩录入</a></td>
          </tr>
        </table></td>
      </tr>
      </table>
      <div id="LM3" style="width:100%;padding:10px;DISPLAY: none">
      <a href="score_insert.jsp" target="mainFrame">成绩录入</a></br>
      </div>
      </td>
  </tr>
</table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr></tr>
        <tr id="LM4" style="DISPLAY:none">
          <td><table width="94%" border="0" align="center" cellpadding="0" cellspacing="2" style="margin:4px 0 4px 0;">
            <tr>
              <td width="9%" align="center" class="TextLine-height"><img src="<%=basePath%>/images/index-7.jpg" width="3" height="3" /></td>
              <td width="91%" class="TextLine-height"><a href="admin_setup.jsp" target="mainFrame">系统参数设置</a></td>
            </tr>
           
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>

</c:if>
</body>
</html>
