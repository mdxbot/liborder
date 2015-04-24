<%@ page language="java" pageEncoding="utf-8"%>
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
        <span style="color:blue">当前位置：</span>首页 >> 维护实验室信息 >> 实验室信息查询</span>
    <span style="width:43%;text-align:right;">
        <input style="font-size:12pt;width:80px;padding:3px" type="button" value="查询" onclick="Cmd(1)"/>
	    <input style="font-size:12pt;width:80px;padding:3px" type="button" value="修改" onclick="Cmd(2)"/>
	    <input style="font-size:12pt;width:80px;padding:3px" type="button" value="取消"/>
	</span>
  </div>
</form>
 <table id="table3" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;display:none;">
  <tr style="line-height:30px;">
    	<td>实验室ID</td>
    	<td>实验室名称</td>
    	<td>地址</td>
    	<td>实验室管理员ID</td>
    	<td>可容纳人数</td>
    	<td>开始时间</td>
    	<td>结束时间</td>
       
    </tr>
  <c:forEach items="${listLaboratory}" var="user" varStatus="stat">
  <tr>
    <td width="20%">${laboratory.id}</td>
    <td width="10%">${laboratory.name}</td>
    <td width="10%">${laboratory.address}</td>
    <td width="25%">${laboratory.user_id}</td>
    <td width="25%">${laboratory.introduction}</td>
    <td width="25%">${laboratory.capacity}</td>
    <td width="25%">${laboratory.telephone}</td>
    <td width="25%">${laboratory.telephone}</td>
  </tr>
  </c:forEach>  
</table>

<table id="table1" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;display:none;">
        <tr style="line-height:30px;">
       
    	<td width="18%">实验室名称:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="" /></td>
    	</tr>

    	<tr>
    	
    	<td width="18%">地址:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="" /></td>
    	</tr>
    	<tr>
    	
    	<td width="18%">实验室管理员ID:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="" /></td>
    	</tr>
    	<tr>
    	
    	<td width="18%">可容纳人数:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="" /></td>
        </tr>
    
    <tr>
    <td><input style="font-size:12pt;width:80px;padding:3px" type="button" value="查询" onclick="Cmd(3)" /></td>
    <td><input style="font-size:12pt;width:80px;padding:3px" type="button" value="取消" onclick="" /></td>
    </tr>
 
</table>

<table id="table2" width="99%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:1px;display:none;">
        <tr style="line-height:30px;">

    	<td width="18%">实验室名称:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
    	</tr>
    	<tr>
    	
    	<td width="18%">地址:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
    	</tr>
    	<tr>
    	
    	<td width="18%">实验室管理员ID:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
        </tr>
        <tr>
        <td width="18%">可容纳人数:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
    	</tr>
    	<tr>
        <td width="18%">开始时间:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
    	</tr>
    	<tr>
        <td width="18%">结束时间:</td><td width="73%"><input name="username" type="text" class="Userbox1" id="username" value="${formBean.username}" /></td>
    	</tr>

    	<tr>
    <tr>
    <td><input style="font-size:12pt;width:80px;padding:3px" type="button" value="确定" onclick="Cmd(3)" /></td>
    <td><input style="font-size:12pt;width:80px;padding:3px" type="button" value="取消" onclick="Qmd()" /></td>
    </tr>
 
</table>


<%@ include file="footer.inc.jsp" %>