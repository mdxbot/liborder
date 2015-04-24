<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="bluetooth_header.inc.jsp" %>

<script type="text/javascript">
function Cmd(){
	var a= document.getElementById("userid"); a.value=""
	var b= document.getElementById("username"); b.value="";
	var c= document.getElementById("useremail"); c.value="";
	var d= document.getElementById("usernum"); d.value="";
}
</script>

<form id="idFormList" name="formList" method="post" action="">
  <div class="filter_bar" style="width:99%;margin:1px;text-align:left;">
    <span style="color:white;width:55%;text-align:left;padding-left:5px">
        <span style="color:blue">当前位置：</span>首页 >> 个人信息 >> 修改</span>
    <span style="width:43%;text-align:right;">
	    <input style="font-size:12pt;width:80px;padding:3px" type="button" value="确认提交"/>
	    <input style="font-size:12pt;width:80px;padding:3px" type="button" value="退出" onclick="Cmd();"/>
	</span>
  </div>
</form>
<table id="users" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;">
        <tr style="line-height:30px;">
       <br></br>
    	<td width="18%">账号:</td><td width="73%"><input name="userid" type="text" class="Userbox1" id="userid" value="${formBean.username}" /></td>
    	</tr>

    	<tr>
    	
    	<td width="18%">姓名:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
    	</tr>
    	<tr>
    	
    	<td width="18%">email:</td><td width="73%"><input name="useremail" type="text" class="Userbox1" id="useremail" value="${formBean.username}" /></td>
    	</tr>
    	<tr>
    	
    	<td width="18%">联系电话:</td><td width="73%"><input name="usernum" type="text" class="Userbox1" id="usernum" value="${formBean.username}" /></td>
    </tr>
 
</table>

<%@ include file="footer.inc.jsp" %>
