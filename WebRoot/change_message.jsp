<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="bluetooth_header.inc.jsp" %>
<form id="idFormList" name="formList" method="post" action="">
  <div class="filter_bar" style="width:99%;margin:1px;text-align:left;">
    <span style="color:white;width:55%;text-align:left;padding-left:5px">
        <span style="color:blue">当前位置：</span>首页 >> 公告管理 >> 修改公告</span>
    <span style="width:43%;text-align:right;">
	    <input style="font-size:12pt;width:80px;padding:3px" type="button" value="修改"/>
	    <input style="font-size:12pt;width:80px;padding:3px" type="button" value="取消"/>
	</span>
  </div>
</form>
 <table id="users" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;">
  <tr style="line-height:30px;">
    	<td>公告编号</td>
    	<td>内容</td>
    </tr>
  <c:forEach items="${listUsers}" var="user" varStatus="stat">
  <tr>
    <td width="20%">${user.account}</td>
    <td width="10%">${user.type}</td>
  </tr>
  </c:forEach>  
</table>

<%@ include file="footer.inc.jsp" %>