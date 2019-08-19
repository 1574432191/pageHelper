<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统</title>
<link type="text/css" rel="stylesheet" href="${root}/css/style.css" />
<link href="${root}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${root}/css/product.css" rel="stylesheet" type="text/css"/>
<link href="${root}/css/cart.css" rel="stylesheet" type="text/css"/>
<%-- <script type="text/javascript" src="${root}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${root}/js/menu.js"></script> --%>
</head>
<body>
<div class="top"></div>
<div id="header">
	<div class="logo">***后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="">张山</a></li>
			<li><a href="">修改密码</a></li>
			<li><a href="">设置</a></li>
			<li><a href="">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li><img src="${root}/image/home.png"></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">系统公告</a></li>
								<li>></li>
								<li><a href="#">最新公告</a></li>
								<li>></li>
								<li><a href="${root}/admin/addEmp.do">添加员工</a></li>
						</ul>
			</div>
			<div class="main">
		<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				
			</div>
				<table id="table" style="text-align: center;">
					<tbody>
					<tr>
						<th>用户</th>
						<th>密码</th>
						<th>姓名</th>
						<th>年龄</th>
						<th>性别</th>
						<th>职位</th>
						<th>修改密码</th>
						<th>职位修改</th>
						<th>删除</th>
					</tr>
					
						<!-- <tr>
							<td width="60">
								<input type="hidden" name="id" value="22"/>
								<img src=""/>
							</td>
							<td>
								<a target="_blank"><s:property value="product.pname"/></a>
							</td>
							<td>
								100
							</td>
							<td class="quantity" width="60">
								<input type="text" name="count" value="1" maxlength="4" onpaste="return false;"/>
								<div>
									<span class="increase">&nbsp;</span>
									<span class="decrease">&nbsp;</span>
								</div>
							</td>
							<td width="140">
								<span class="subtotal">￥100</span>
							</td>
							<td>
								<a href="./cart_removeCart.action?pid=1" class="delete">删除</a>
							</td>
						</tr>
					 -->
				</tbody>
			</table>
			</div>
		</div>
</div>


<!-- <script>navList(12);</script> -->
<script type="text/javascript" src="${root}/js/cookie_util.js"></script>
<script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		"url":"${root}/admin/toIndex.do",
		"type":"post",
		"dataType":"json",
		success:function(result){
			var code = result.error_code;
			//alert(result.error_msg);
			if(code==1){
				$.each(result.error_msg,function(index,lim){
					//alert(lim.url);
					 $("#nav_dot").append($("<dl></dl>").html($("<div><h2 style='text-align:center;'><a href='"+lim.url+"'>"+lim.info+"</a><h2></div>")))
				})
				
			}
		}
	})
})

$(function(){
	$.ajax({
		"url":"${root}/admin/empInfo1.do",
		"type":"post",
		"dataType":"json",
		success:function(result){
			$.each(result.error_msg,function(index,admin){
			//	alert(admin.role.role);
			
				$("<tr></tr>").attr("named",admin.id).attr("id",admin.id).
	    		 append($("<td width='50'></td>").html(admin.username)).
	    		 append($("<td width='50'></td>").html(admin.password)).
	    		 append($("<td width='100'></td>").html(admin.name)).
	    		  append($("<td width='100'></td>").html(admin.age)).
	    		   append($("<td width='100'></td>").html(admin.sex)).
	    		    append($("<td width='100'></td>").html(admin.role.role)).
	    		    append($("<td width='100'><button typy='button' id='update' class='update' onclick='updatePassword("+admin.id+")'>修改密码</td>")).
	    		       append($("<td width='100'><button typy='button' id='update' class='update' onclick='updateRole("+admin.id+")'>修改职位</td>")).
	    		       append($("<td width='100'></td>").html($("<button type='button' onclick='delectEmps("+admin.id+" )' >删除</button>")))
	    		.appendTo("#table")
			})
		}
	})
})

function updatePassword(id){
//	window.prompt("这里给提示","这里是默认值");
	var password=prompt("请输入修改后的密码","")
	if(password==""){
		alert("密码不能为空")
		return false;
	}
//	alert(id+" ++"+password);
	
	$.ajax({
		"url":"${root}/admin/updatePassword.do",
		"type":"post",
		"dataType":"json",
		data:{"id":id,"password":password},
		success:function(result){
			location.href="${root}/admin/emp.do";
		}
	})
}


function delectEmps(id){
	var  bol = confirm("确认删除？ ")
	$.ajax({
		"url":"${root}/admin/deleteEmps.do",
		"type":"post",
		"dataType":"json",
		data:{"id":id},
		success:function(result){
			location.href="${root}/admin/emp.do"
		}
	})
	
}

function updateRole(id){
	var rid=prompt("请输入职位编号：董事长（1），总经理（2），组长（3），员工（4）","");
	if(rid==""){
		alert("职位名称不能为空")
		return false;
	}
	var  bol = confirm("确认修改？ ")
	$.ajax({
		"url":"${root}/admin/updateRole.do",
		"type":"post",
		"dataType":"json",
		data:{"id":id,"rid":rid},
		success:function(result){
			location.href="${root}/admin/emp.do";
		}
	})
}
</script>

</body>
</html>