
//jquery.op.js

$(document).ready(function() {
	if (!document.all)
        document.all = document.getElementsByTagName("*");
    $('input[readonly]').css('background-color', '#eeeeee');
    $.enter2tab();
    $.forbidBackspace();
    $('body').append('<form id="__viewstate_form" name="__viewstate_form"><input type="hidden" id="__viewstate" name="__viewstate" value="" /></form><div id="debug"></div>');
    
    $.createFloatingDiv(240, 60);
    $("#__idFloatingDiv").ajaxStart(function(){
        //$(this).show();
    	$.showLoadingMsg();
    }).ajaxComplete(function(){
        //$(this).hide();
    	$.hideLoadingMsg();
    });
    
    $('input.auto_select').focus(function() {
    	this.select();
    });
});

//=========================================================
$.fn.emptySelect = function() {
    return this.each(function() {
        if(this.tagName == 'SELECT') this.options.length = 0;
    });
};

$.fn.loadSelect = function(optionsDataArray) {
    return this.emptySelect().each(function() {
        if(this.tagName == 'SELECT') {
            var selectElement = this;
            $.each(optionsDataArray, function(index, optionData) {
                var opt = new Option(optionData.value, optionData.key);
                if($.browser.msie) {
                    selectElement.add(opt);
                }
                else {
                    selectElement.add(opt, null);
                }
            });
        }
    });
};

$.fn.jlmModal = function(options) {
    var options = $.extend({ttl:'',wdth:400,hght:180}, options||{}); 
    
    return this.each(function() {
        var $obj = $(this);        
        $obj.addClass('jqmDialog');        
        
        var wrapper = "<div class='jqmdTL'><div class='jqmdTR'><div class='jqmdTC jqDrag'>" + options.ttl + "</div></div></div>\n";
        wrapper += "<div class='jqmdBL'><div class='jqmdBR'><div class='jqmdBC'><div class='jqmdInner'>\n";
        wrapper += "<div class='jqmdContent'></div>\n"; //content here
        wrapper += "</div></div></div></div>\n";
        wrapper += "<input type='image' src='../images/icons/blank.gif' class='jqmdX jqmClose' />\n";
        
        var pre = $obj.html();
        $obj.html('');
        $obj.append(wrapper);
        $('.jqmdContent', $obj).html(pre);
        
        $obj.width(options.wdth);
        $('.jqmdBC', $obj).height(options.hght);
        $('.jqmdInner', $obj).height(options.hght-16);
        
        // Close Button Highlighting. IE doesn't support :hover. Surprise?
        $('input.jqmdX', $obj)
        .hover(
            function(){ $(this).addClass('jqmdXFocus'); }, 
            function(){ $(this).removeClass('jqmdXFocus'); })
        .focus( 
            function(){ this.hideFocus=true; $(this).addClass('jqmdXFocus'); })
        .blur( 
            function(){ $(this).removeClass('jqmdXFocus'); });
    });
};

///////////////////////////////////////////////////////////
$.traceHTML = function(name, value) {
    var pre = $('#debug').html();
    $('#debug').html(pre + "<br/>\n" + name + ' : ' + value);
};

$.traceText = function(name, value) {
    var pre = $('#debug').text();
    if(arguments.length > 2 && arguments[2] == 'REPLACE')
        $('#debug').text(name + ' : ' + value);
    else
        $('#debug').text(pre + "\n" + name + ' : ' + value);
};

$.isArray = function(o) {   
  return Object.prototype.toString.call(o) === '[object Array]';    
};

// 克隆javascript对象
$.clone = function(data) {
    var obj;
    
    if(typeof(data) == 'object') {
        obj = $.isArray(data) ? [] : {};
        $.each(data, function(key, value) {
            if(typeof(value) == 'object')
                obj[key] = $.clone(value);
            else 
                obj[key] = value;
        });
    }
    else obj = data;
    
    return obj;
};

// 回车转制表符
$.enter2tab = function() {
    $(':text,:password').bind('keydown', function() {
        if(event.keyCode==13 /*&& this.value != ''*/) event.keyCode=9;
    });
};

// 屏蔽退格键
$.forbidBackspace = function() {
    $(document).bind('keydown', function() {
    	if(event.keyCode!=8) return true;
        var _obj = event.srcElement || event.target; // 获取事件源类型
        var _t = _obj.type || _obj.getAttribute("type");
        // 不屏蔽的情况：源类型为text、textarea、password中一种，且其不为readOnly或disabled        
        return (_t == "text" || _t == "textarea" || _t == "password") && !_obj.readOnly && !_obj.disabled;
    });
};

/*$.trim = function(str) {
    str = str.replace(/^\s+/, '');
    str = str.replace(/\s+$/, '');
    return str;
}*/

// 计算字符数
$.length = function(encoding) {
    var totalLength = 0;
    var i;
    var charCode;
    
    if(encoding == 'utf8') {
    	for (i = 0; i < s.length; i++) {
    		charCode = s.charCodeAt(i);
    		if (charCode < 0x007f) {
    		    totalLength = totalLength + 1;
    		} else if ((0x0080 <= charCode) && (charCode <= 0x07ff)) {
    		    totalLength += 2;
    		} else if ((0x0800 <= charCode) && (charCode <= 0xffff)) {
    		    totalLength += 3;
    		}
    	}
    }
    else {//if(encoding == 'gbk' || encoding == 'gb2312' || encoding == 'gb18030') {
    	for (i = 0; i < s.length; i++) {
    		charCode = s.charCodeAt(i);
    		if (charCode <= 0x007f) {
    		    totalLength = totalLength + 1;
    		} else {
    		    totalLength += 2;
    		}
    	}
    }
    
    return totalLength;
};

$.submit_to = function(frm, action) {
	if(typeof(frm) != 'object' || frm.tagName != 'FORM') {
		alert(frm.tagName);
		return;
	}
	
	frm.action = action;
	frm.submit();
};

//=========================================================
$.getAjaxPara = function(wrapper) {
	var post_str = '__ajax_used__=yes';
	
    if(!wrapper || typeof(wrapper)!='object') {
    	return post_str;
    }
    
	var allElements = wrapper.getElementsByTagName("*");
	for(var i = 0; i < allElements.length; i++)
    {
        var elem = allElements[i];
        switch(elem.tagName)
        {
            case "INPUT":
                switch(elem.type)
                {
                    case "checkbox":
                    case "radio":
                        if(elem.checked)
                        {
                            post_str += '&' + elem.name + '=' + encodeURIComponent(elem.value);
                        }
                        break;
                    case "text":
                    case "password":
                    case "hidden":
                        post_str += '&' + elem.name + '=' + encodeURIComponent(elem.value);
                        break;
                    default:
                        break;
                }//type
                break;
            case "SELECT":
                for(var j = 0; j < elem.options.length; j++)
                {
                    if (elem.options[j].selected == true)
                        post_str += '&' + elem.name + '=' + encodeURIComponent(elem.options[j].value);
                }
                break; 
            case "TEXTAREA":
                post_str += '&' + elem.name + '=' + encodeURIComponent(elem.value);
                break;
        }//tagName
    }//for
	
	return post_str;
};

// ************************************************
// 第一个参数是响应的目标页面的url
// 第二个参数是检查函数
// 第三个参数是回调函数
// 第四个参数是响应数据的类型，指定响应数据如何解析
// 第五个参数是视图数据所在的表单或要提交的数据容器，若未提供则以第一个form为容器
// ************************************************
$.ajaxDo = function(target_url, func_check, func_resp)
{
    // 执行客户端验证
    if(typeof(func_check) == 'function' && !func_check()) return;
    // 检查参数
    if(typeof(func_resp) != 'function') {alert("$.ajaxDo() parameter error!");return; }
    
    var dt = 'text';
    if(arguments.length > 3) dt = arguments[3];
    var container = document.forms[0];
    if(arguments.length > 4) container = arguments[4];
    
    var url_para = $.getAjaxPara(container);
    //alert(e.urlPara);
    $.ajax({   
        url: target_url,
        type: 'POST',
        data: url_para,
        dataType: dt,
        success: function(resp) {func_resp(resp);} 
    }); 
};

//////////////////////////////////////////////////////////////////////////////////
// 浮动对话框
$.createFloatingDiv = function(width, height) {
	var divFloatingDiv = '<div id="__idFloatingDiv" align="center" ';
    divFloatingDiv += 'style="position:absolute;z-index:99;display:none;width:' + width + 'px; height:' + height + 'px;';
    //divFloatingDiv += 'left:50%;top:50%;margin:-' + height / 2 + 'px 0 0 -' + width / 2 + 'px;';
    divFloatingDiv += 'padding:15px; border:1px solid blue;background-color:#eee";text-align:center;vertical-align:center >';
    divFloatingDiv += '&nbsp;</div>';
    //alert(divFloatingDiv);
    $('body').append(divFloatingDiv);
    var scrollLeft = document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft;
    var scrollTop = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
    var left = $(window).width() / 2 - parseInt(width) / 2 + parseInt(scrollLeft);
    var top = $(window).height() / 2 - parseInt(height) / 2 + parseInt(scrollTop);
    $('#__idFloatingDiv').css('left', left + "px").css('top', top + "px");
};

$.showFloatingDiv = function(html, width, height) {
	//alert($('#__idFloatingDiv').length);
	if($('#__idFloatingDiv').length == 0) {
		$.createFloatingDiv(width, height);
	}
	else {
		if (width != null && height != null) {
			$('#__idFloatingDiv').css('width', width + "px");
			$('#__idFloatingDiv').css('height', height + "px");
		}
		var height = $('#__idFloatingDiv').height();
		var scrollTop = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
	    var top = $(window).height() / 2 - parseInt(height) / 2 + parseInt(scrollTop);
        $('#__idFloatingDiv').css('top', top + "px");
	}
	$('#__idFloatingDiv').html(html);
	$('#__idFloatingDiv').show();
};

$.hideFloatingDiv = function() {
	$('#__idFloatingDiv').hide();
};

$.showExistedFloating = function(idExisted) {
    if ($(idExisted).length == 0) return;

    var width = $(idExisted).width();
    var height = $(idExisted).height();
    var scrollLeft = document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft;
    var scrollTop = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
    var left = $(window).width() / 2 - parseInt(width) / 2 + parseInt(scrollLeft);
    var top = $(window).height() / 2 - parseInt(height) / 2 + parseInt(scrollTop);
    $(idExisted).css('left', left + "px").css('top', top + "px");
    $(idExisted).show();
};

$.hideExistedFloating = function(idExisted) {
    $(idExisted).hide();
};

$.showLoadingMsg = function() {
	$.showFloatingDiv('<image border="0" src="images/loading.gif" /> 处理中，请稍候...');
};
$.hideLoadingMsg = function() {
	$.hideFloatingDiv();
};

////////////////////////////////////////////////////////////////////////////////////
// 专用于180项目

// 分页函数
function toPage(page){
	var pageIndex = document.getElementById('__idCurrentPage'); 
    var pageForm = pageIndex.form;
    pageIndex.value = page;
    pageForm.submit();
}

function doInputPage(maxPageNum, page){ 
    //var page = document.getElementById('__idInputPage');
    if(page.value == null){
    	alert('请输入页号');
        page.focus();
    } 
    if(page.value > maxPageNum){
        alert("页号不能大于总页数");
        page.focus();
        return;
    }
    var pattern=/^[0-9]{1,20}$/; 
    if(!pattern.exec(page.value)){
    	alert('页号应为数字!');
        page.value='';
        page.focus();
        return;
    }
    toPage(page.value);
}

function search() {
	var pageIndex = document.getElementById('__idCurrentPage'); 
    var pageForm = pageIndex.form;
    pageIndex.value = '1';
    pageForm.submit();
}
//--------------------------------------------------------------

// ckeditor用
jQuery.fn.extend({  
    getCurPos: function(){  
        var e=$(this).get(0);  
        e.focus();  
        if(e.selectionStart){    //FF  
            return e.selectionStart;  
        }  
        if(document.selection){    //IE  
            var r = document.selection.createRange();  
            if (r == null) {  
                return e.value.length;  
            }  
            var re = e.createTextRange();  
            var rc = re.duplicate();  
            re.moveToBookmark(r.getBookmark());  
            rc.setEndPoint('EndToStart', re);  
            return rc.text.length;  
        }  
        return e.value.length;  
    },  
    setCurPos: function(pos) {  
        var e=$(this).get(0);  
        e.focus();  
        if (e.setSelectionRange) {  
            e.setSelectionRange(pos, pos);  
        } else if (e.createTextRange) {  
            var range = e.createTextRange();  
            range.collapse(true);  
            range.moveEnd('character', pos);  
            range.moveStart('character', pos);  
            range.select();  
        }  
    }          
});


