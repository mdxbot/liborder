<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="header.inc.jsp" %>
<script type="text/javascript">
<!--
var classId = "${classId}";
var studentNum = "${listSize}"; // 包含头部
var order = 0;
var line;
var stuId = 0;
var stuName;
var curMark;
var orderKind = "RAND";

function nextOrder() {
    if (orderKind == "RAND") {
    	order = Math.floor(Math.random() * (studentNum - 1) + 1);
    }
    else if (orderKind == "FORWARD") {
        if(order >= studentNum)
            ;//order = 1;
        else
            ++order;
    }
    else { // "BACKWARD"
        if(order <= 1)
            ;//order = studentNum - 1;
        else
            --order;
    }
}

function nextStudent() {
    nextOrder();
    line = $('#tblStudents tr')[order];
    stuId = $(line).find('td:eq(1)').html();
    stuName = $(line).find('td:eq(2)').html();
    curMark = $(line).find('td:last').html();
    if (curMark == 'Q' || curMark == 'X') {
    	nextStudent();
    }
}

function showDlg(ord) 
{
    orderKind = ord;
    if (orderKind == "FORWARD") {
    	order = 0;
    }
    else if (orderKind == "BACKWARD") {
    	order = studentNum;
    }
    nextStudent();
    selectStudent(order);
}

function addMark(mark) {
	if (mark == "N") {
		nextStudent();
		selectStudent(order);
		return;
	}
	else if (mark == "CLOSE") {
		   $.hideExistedFloating('#idFloatingContent');
	}
	else {
		var url = "<%=basePath%>/attendance_addMarkAjax.action?order=" + order + "&classId=" + classId + "&stuId=" + stuId + "&mark=" + mark;
		$.getJSON(url, function(jsonData) { 
            if(jsonData.err == 'SUCCESS') {
            	$('#idCurMark').html("已设：" + jsonData.msg);

                line = $('#tblStudents tr')[order];
                if (jsonData.msg == 'Q' || jsonData.msg == 'X' || jsonData.msg == '0') {
                    $(line).find('td:last').html(jsonData.msg);
                }
                else {
                	if (jsonData.msg == 'L') {
                		jsonData.msg = '-2';
                	}
                    var m = parseInt($(line).find('td:last').html());
                    $(line).find('td:last').html(parseInt(jsonData.msg) + m);
                }
            }
        });

		//document.location = url;
	}
}

var previousLine = null;
function selectStudent(which) {
    order = parseInt(which);

    line = $('#tblStudents tr')[order];
    if (previousLine != null) {
        $(previousLine).find('td').css({'color':'#295c95','font-size':'12px'});
    }
    previousLine = line;
    $(line).find('td').css({'color':'red','font-size':'24px'});

    stuId = $(line).find('td:eq(1)').html();
    stuName = $(line).find('td:eq(2)').html();
    curMark = $(line).find('td:last').html();

    $('#idStuId').html(stuId);
    $('#idStuName').html(stuName);
    $('#idCurMark').html("");
    $.showExistedFloating('#idFloatingContent');
}

-->
</script>
<form id="idFormList" name="formList" method="post" action="">
  <div class="filter_bar" style="width:100%;margin:8px;text-align:center;">
    <!-- <a style="font-size:18pt;" href="attendance_"></a>  -->
    <input style="font-size:18pt;width:180px" type="button" value="随机" onClick="showDlg('RAND');" />
    <input style="font-size:18pt;width:180px" type="button" value="正序" onClick="showDlg('FORWARD');" />
    <input style="font-size:18pt;width:180px" type="button" value="反序" onClick="showDlg('BACKWARD');" />
  </div>
  <table id="tblStudents" width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#ffffff" class="list" style="margin:8px;">
  <c:forEach items="${listAttendance}" var="pojo" varStatus="stat">
    <c:choose>
      <c:when test="${stat.first}">
          <tr bgcolor="#C4EDFF">
      </c:when>
      <c:otherwise>
          <tr class='${(stat.count % 2) eq 0 ? "odd" : "even"}' onClick='javascript:selectStudent(${stat.count-1})'>
      </c:otherwise>
    </c:choose>
    <td width="5%">${pojo.sequence}</td>
    <td width="20%">${pojo.id}</td>
    <td width="10%">${pojo.name}</td>
    <c:forEach items="${pojo.marks}" var="elem">
        <td>${elem}</td>
    </c:forEach>
  </tr>
  </c:forEach>  
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:12px;">
  <tr>
    <td height="25" align="center">
    <div style="width: 99%; line-height: 24px; padding: 5px 0px; background: #fff;"> ${partedpageBar} </div>
    </td>
  </tr>
</table>
</form>
<!-- floating content begin -->
<div id="idFloatingContent" class="floating_area" style="position:absolute;display:none;border:2px blue solid;background-color:#eee;width:520px;height:240px;text-align:center">
	<table width='100%' height='100%' border='0'>
	<tr><td align='center' valign='middle' width="65%">
		<div id='idStuId' style='padding:5px;font-size:24pt;color:red'></div>
		<div id='idStuName' style='padding:5px;font-size:24pt;color:red'></div>
		<div id='idCurMark' style='padding:5px;font-size:24pt;color:green'></div>
		</td>
		<td align='center' valign='middle'>
		<div style='padding:5px;'><input style='font-size:14pt' type='button' value='+1' onClick='javascript:addMark(1);'/></div>
		<div style='padding:5px;'><input style='font-size:14pt' type='button' value='+2' onClick='javascript:addMark(2);'/></div>
		<div style='padding:5px;'><input style='font-size:14pt' type='button' value='+5' onClick='javascript:addMark(5);'/></div>
		<div style='padding:5px;'><input style='font-size:14pt' type='button' value='-2' onClick='javascript:addMark(-2);'/></div>
		<div style='padding:5px;'></div>
		</td>
	</tr>
	<tr><td colspan='2'>
		<input style='font-size:14pt' type='button' value='请假' onClick="javascript:addMark('Q');"/> 
		<input style='font-size:14pt' type='button' value='旷课' onClick="javascript:addMark('X');"/> 
		<input style='font-size:14pt' type='button' value='迟到' onClick="javascript:addMark('L');"/>
		<input style='font-size:14pt' type='button' value='还原' onClick="javascript:addMark('0');"/>
		<input style='font-size:14pt' type='button' value='下一个' onClick="javascript:addMark('N');"/> 
		<input style='font-size:14pt' type='button' value='关闭' onClick="javascript:addMark('CLOSE');"/> 
	    </td>
    </tr>
    </table>
</div>
<!-- floating content begin -->

<%@ include file="footer.inc.jsp" %>
