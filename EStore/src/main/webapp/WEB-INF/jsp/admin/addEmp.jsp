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
						</ul>
			</div>
			<div class="main">
			<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				
			</div>
			<form action="${root}/admin/addEmps.do" method="post" enctype="multipart/form-data">
			<p>
				请选择公司职位<select style="width: 120px;" name="role">
							<option value="1">董事长</option>
							<option value="2">总经理</option>
							<option value="3">组长</option>
							<option value="4">员工</option>	
				</select>
				</p>
				<p>
				用户名：<input id="username" name="username" type="text"
							value="" style="width: 150px" /> 
				密码：&nbsp;<input name="password" id="password" type="text"
							value="" style="width: 150px" />  
							
				姓名：<input id="name" name="name" type="text"
							value="" style="width: 150px" /> <br />
				</p>
				<p>
				年龄：<input name="age" id="age" type="text" value="" style="width: 150px" />
				性别：<input name="sex" id="sex" type="text" value="" style="width: 150px" />
				
				</p>				
				<input type="submit" value="确认添加该员工">	
				  </form>  		
			</div>
		</div>
</div>
<!-- <div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  来源:<a href="http://h2design.taobao.com/" target="_blank">氢设计</a></p></div> -->
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
</script>
<script type="text/javascript">
$(function(){
	var pid=0;
	  $.ajax({
		  url:"${root}/category/data/getCategory.do",
		  type:"post",
		  dataType:"json",
		  data:{"pid":pid},
		  success:function(result){
			  var categoryList=result.error_msg;
			//  alert(categoryList)
			  for(var i=0;i<categoryList.length;i++){
				  $("<option></option>").attr("value",categoryList[i].id).html(categoryList[i].type).appendTo($("#category"));
			  }
		  }
	  })
})

  function _getcategory(_this){
	  var pid=_this.value;
	//  alert(pid);
	  var sendData={"pid":pid};
	  $.ajax({
		  url:"${root}/category/data/getCategory.do",
		  data:sendData,
		  dataType:"json",
		  success:function(result){
			  var categoryList=result.error_msg;
			  for(var i=0;i<categoryList.length;i++){
				  $("<option></option>").attr("value",categoryList[i].id).html(categoryList[i].type).appendTo($("#categoryname"));
			  }
		  }
	  })
  }
  
</script>
<script type="text/javascript">
	function addItems(){
		var category = $("#categoryname").val();
		var name = $("#name").val();
		var marketprice = $("#marketprice").val();
		var estoreprice =$("#estoreprice").val();
		var num = $("#num").val();
		var production_date = $("#production_date").val();
		var production_date = $("#production_date").val();
		var expiry_date = $("#expiry_date").val();
		var description = $("#description").val();
		
		
	}
</script>
</body>
</html>