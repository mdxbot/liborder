<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="bluetooth_header.inc.jsp" %>
<form id="idFormList" name="formList" method="post" action="">
  <div class="filter_bar" style="width:99%;margin:1px;text-align:left;">
    <span style="color:white;width:55%;text-align:left;padding-left:5px">
        <span style="color:blue">当前位置：</span>首页 >> 植被数据管理 >> 植被数据列表与计算 </span>
    <span style="width:43%;text-align:right;">
	    <input style="font-size:12pt;width:80px;padding:3px" type="button" value="删除"/>
	    <input style="font-size:12pt;width:120px;padding:3px" type="button" value="计算叶面积指数"/>
	    <input style="font-size:12pt;width:120px;padding:3px" type="button" value="计算植被覆盖度"/>
	</span>
  </div>
  <table id="tblStudents" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;">
  <c:forEach items="${listBluetooth}" var="pojo" varStatus="stat">
    <c:choose>
      <c:when test="${stat.first}">
          <tr bgcolor="#C4EDFF">
      </c:when>
      <c:otherwise>
          <tr class='${(stat.count % 2) eq 0 ? "odd" : "even"}' onClick='javascript:selectStudent(${stat.count-1})'>
      </c:otherwise>
    </c:choose>
    <td width="5%">${pojo.sequence}</td>
    <td width="12%">${pojo.site}</td>
    <td width="13%">${pojo.name}</td>
    <td width="30%">
    <c:choose>
      <c:when test="${stat.first}">
          ${pojo.url}
      </c:when>
      <c:otherwise>
          <img style="width:40%;height:10%" src="callname/${pojo.url}" />
      </c:otherwise>
    </c:choose>
    </td>
    <td width="13%">${pojo.longitude}</td>
    <td width="13%">${pojo.latitude}</td>
    <td width="14%">${pojo.pitchAngle}</td>
  </tr>
  </c:forEach>  
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;">
  <tr>
    <td height="25" align="center">
    <div style="width: 99%; line-height: 24px; padding: 5px 0px; background: #fff;"> ${partedpageBar} </div>
    </td>
  </tr>
</table>
</form>

<%@ include file="footer.inc.jsp" %>
