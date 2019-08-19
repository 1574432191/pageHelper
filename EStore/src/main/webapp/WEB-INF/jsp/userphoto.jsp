<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="${root}/css/style2.css" type="text/css" rel="stylesheet" />
<link href="${root}/css/common.css" rel="stylesheet" type="text/css">
<link href="${root}/css/cart.css" rel="stylesheet" type="text/css">
<link href="${root}/css/mycss.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息管理</title>
</head>
<body>
<jsp:include page="comm/header.jsp"/>


    <div class="m_d">
    	<div class="left">
        	<dl><dt>账户管理</dt>
            <dd>
            	<a href="${root}/user/userInfo1.html" >个人资料</a>
            	<a href="${root}/user/updateUser.html" >修改个人信息</a>
                <a href="${root}/user/updatePassWord.html">修改密码</a>
                 <a href="${root}/user/address.html" >收货地址管理</a>
                  <a href="${root}/user/userorders.html" >查看订单</a>
               <a href="${root}/user/userphoto.html" class="on">查看历史头像</a>
                
            </dd>
            </dl>
            
        </div>
        <div class="right">
        	<dl class="dl01">
            	<dt><img src="${root}/image/ico04.jpg"/></dt>
                <dd>
					<table id="photoTable" width="725" border="0" cellpadding="0" cellspacing="0">
                      
                    <!--  <dt id="photo"></dt> -->
               <%--      <img src="${root}/image/xj.jpg"/></dt>  --%>
                    </table>
                </dd>
            </dl>
           <div id="middle">

		<div class="user-left">


			<div class="user-info" id="userinfo">
				<!-- ajax加载用户信息 -->
			</div>
		</div>

		<div class="user-right user-edit">

			<form>
				<table id="hisTable">
					
				</table>
			</form>
			

			
		</div>
	</div>
<jsp:include page="comm/footer.jsp"/>
<script type="text/javascript">

Date.prototype.format = function(format) {  
    var o = {  
        "M+" : this.getMonth() + 1, // month  
        "d+" : this.getDate(), // day  
        "h+" : this.getHours(), // hour  
        "m+" : this.getMinutes(), // minute  
        "s+" : this.getSeconds(), // second  
        "q+" : Math.floor((this.getMonth() + 3) / 3),
        "S" : this.getMilliseconds()  
    // millisecond  
    } 
    if (/(y+)/.test(format)) {  
        format = format.replace(RegExp.$1, (this.getFullYear() + "")  
                .substr(4 - RegExp.$1.length));  
    }  
  
    for ( var k in o) {  
        if (new RegExp("(" + k + ")").test(format)) {  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]  
                    : ("00" + o[k]).substr(("" + o[k]).length));  
        }  
    }  
    return format; 
}

		$(function(){
			var id = getCookie("id_cookie");
		//	alert(id);
			$.ajax({
				"url":"${root}/user/findUserInfo.do",
				"type":"post",
				"dataType":"JSON",
				"data":{"id":id},
				success:function(result){
					var code = result.error_code;
					if(code==0){
						var user = result.error_msg;						
						$("#photoTable").html($("<img src='${root}/image/"+user.photo+"'/>").attr("width",100));
			
						
					}
						
				}
					
				
			})
		})
</script>
<script type="text/javascript">
  $(function(){
	  var uid = getCookie("id_cookie"); 
	  $.ajax({
		  "url":"${root}/user/findPhoto.do",
			"type":"post",
			"dataType":"JSON",
			"data":{"uid":uid},
			success:function(result){
				var list = result.error_msg;
				var code = result.error_code;
				if(code==0){
					$.each(list,function(index,photo){
						$("<tr></tr>").attr("id",photo.id).attr("named","liPage").
						 append($("<td width='60'></td>").html($("<img src='${root}/image/"+photo.photo+"'/>").attr("width",180)))
						 .appendTo("#hisTable")
					})
				}
			}
	  })
  })

</script>
</body>
</html>