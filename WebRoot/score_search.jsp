<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="bluetooth_header.inc.jsp" %>
<script type="text/javascript">
function Cmd(v){
        if(v == 1)
            document.getElementById("table1").style.display = "";
        else
            document.getElementById("table1").style.display = "none";
     
}
</script>

<form id="idFormList" name="formList" method="post" action="">
  <div class="filter_bar" style="width:99%;margin:1px;text-align:left;">
    <span style="color:white;width:55%;text-align:left;padding-left:5px">
        <span style="color:blue">当前位置：</span>首页 >> 成绩查询 >> 成绩</span>
    <span style="width:43%;text-align:right;">
	    
	    <input style="font-size:12pt;width:120px;padding:3px" type="button" value="查询" onclick="Cmd(1);"/>
	</span>
  </div>
  
<table id="table1" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px; display:none;">
  <tr style="line-height:30px;">
    	<td>选课记录编号</td>
    	<td>学号</td>
    	<td>姓名</td>
    	<td>成绩</td>
    </tr>
  <c:forEach items="${listCourse_grade}" var="user" varStatus="stat">
  <tr>
    <td width="20%">$course_id}</td>
    <td width="10%">${course_grade.student_id}</td>
    <td width="10%">${course_grade.name}</td>
    <td width="10%">${course_grade}</td>
  </tr>
  </c:forEach>  
</table>

<%@ include file="footer.inc.jsp" %>
