<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="bluetooth_header.inc.jsp" %>
<form id="idFormList" name="formList" method="post" action="">
  <div class="filter_bar" style="width:99%;margin:1px;text-align:left;">
    <span style="color:white;width:55%;text-align:left;padding-left:5px">
        <span style="color:blue">当前位置：</span>首页 >> 预约实验 >> 查询预约记录</span>
    <span style="width:43%;text-align:right;">
	
	</span>
  </div>
</form>
<table id="course_grade" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;">
  <tr style="line-height:30px;">
    	<td>选课记录编号</td>
    	<td>学号</td>
    	<td>姓名</td>
    	<td>实验名称</td>
    	<td>开始时间</td>
    	<td>结束时间</td>
    	
    </tr>
  <c:forEach items="${listCourse_grade}" var="user" varStatus="stat">
  <tr>
    <td width="20%">$course_grade.id}</td>
    <td width="10%">${course_grade.student_id}</td>
    <td width="10%">${course_grade.student_name}</td>
    <td width="10%">${course_nme}</td>
    <td width="10%">${course_begin}</td>
    <td width="10%">${course_end}</td>
    
  </tr>
  </c:forEach>  
</table>

<%@ include file="footer.inc.jsp" %>