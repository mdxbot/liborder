<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="bluetooth_header.inc.jsp" %>
<form id="idFormList" name="formList" method="post" action="">
  <div class="filter_bar" style="width:99%;margin:1px;text-align:left;">
    <span style="color:white;width:55%;text-align:left;padding-left:5px">
        <span style="color:blue">当前位置：</span>首页 >> 审批预约信息 >> 查看预约记录</span>
    <span style="width:43%;text-align:right;">
	    <input style="font-size:12pt;width:80px;padding:3px" type="button" value="提交"/>
	    <input style="font-size:12pt;width:80px;padding:3px" type="button" value="退出"/>
	</span>
  </div>
</form>
<table id="order" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;">
  <tr style="line-height:30px;">
    	<td>预约ID</td>
    	<td>实验室ID</td>
    	<td>预约人ID</td>
    	<td>预约时间</td>
    	<td>实验内容</td>
    	<td>实验人数</td>
    	<td>开始时间</td>
    	<td>结束时间</td>
    	<td>审核状态</td>
    </tr>
  <c:forEach items="${listorder}" var="user" varStatus="stat">
  <tr>
    <td width="20%">${order.id}</td>
    <td width="10%">${order.laboratory_id}</td>
    <td width="10%">${order.user_id}</td>
    <td width="25%">${order.orderTime}</td>
    <td width="25%">${order.experiment}</td>
    <td width="25%">${order.num}</td>
    <td width="25%">${order.begin}</td>
    <td width="25%">${order.end}</td>
    <td width="25%"><select name="pass"><option value="0">0</option><option value="1">1</option></select></td>
  </tr>
  </c:forEach>  
</table>

<%@ include file="footer.inc.jsp" %>