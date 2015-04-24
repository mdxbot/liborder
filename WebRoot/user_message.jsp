<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="bluetooth_header.inc.jsp" %>

<script type="text/javascript">
function Cmd(v){
    for(var i = 1; i <= 3; i++){
        if(i == v)
            document.getElementById("table" + i).style.display = "";
        else
            document.getElementById("table" + i).style.display = "none";
    }
     
}
</script>

<form id="idFormList" name="formList" method="post" action="">
  <div class="filter_bar" style="width:99%;margin:1px;text-align:left;">
    <span style="color:white;width:55%;text-align:left;padding-left:5px">
        <span style="color:blue">当前位置：</span>首页 >> 用户信息管理 >> 用户信息</span>
    <span style="width:43%;text-align:right;">
	    <input style="font-size:12pt;width:80px;padding:3px" type="button" value="删除用户" onclick="Cmd(1);" />
	    <input style="font-size:12pt;width:90px;padding:3px" type="button" value="添加新用户" onclick="Cmd(2);"/>
	    <input style="font-size:12pt;width:100px;padding:3px" type="button" value="修改用户信息" onclick="Cmd(3);"/>
	</span>
  </div>
</form>
<table id="table1" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;">
  <tr style="line-height:30px;">
        <td></td>
    	<td>账号</td>
    	<td>用户类别</td>
    	<td>姓名</td>
    	<td>email</td>
    	<td>联系电话</td>
    </tr>
  <c:forEach items="${listUsers}" var="user" varStatus="stat">
  <tr>
    <td><input type='checkbox' name="checkbox" id="checkbox" value="${list.linkId }"></input></td>
    <td width="20%">${user.account}</td>
    <td width="10%">${user.type}</td>
    <td width="10%">${user.name}</td>
    <td width="25%">${user.email}</td>
    <td width="25%">${user.telephone}</td>
  </tr>
  </c:forEach>  
	
	</table>
<table id="table2" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;display:none;">
        <tr style="line-height:30px;">
       
    	<td width="18%">账号:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="" /></td>
    	</tr>

    	<tr>
    	
    	<td width="18%">姓名:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="" /></td>
    	</tr>
    	<tr>
    	
    	<td width="18%">email:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="" /></td>
    	</tr>
    	<tr>
    	
    	<td width="18%">联系电话:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="" /></td>
    </tr>
    <tr>
    <td><input style="font-size:12pt;width:80px;padding:3px" type="button" value="添加" onclick="Cmd(1)" /></td>
    <td><input style="font-size:12pt;width:80px;padding:3px" type="button" value="取消" onclick="Cmd(1)" /></td>
    </tr>
 
</table>

<table id="table3" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;display:none;">
        <tr style="line-height:30px;">
       
    	<td width="18%">账号:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
    	</tr>

    	<tr>
    	
    	<td width="18%">姓名:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
    	</tr>
    	<tr>
    	
    	<td width="18%">email:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
    	</tr>
    	<tr>
    	
    	<td width="18%">联系电话:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
    </tr>
    <tr>
    <td><input style="font-size:12pt;width:80px;padding:3px" type="button" value="修改" onclick="Cmd(1)" /></td>
    <td><input style="font-size:12pt;width:80px;padding:3px" type="button" value="取消" onclick="Cmd(1)" /></td>
    </tr>
 
</table>
<%@ include file="footer.inc.jsp" %>
