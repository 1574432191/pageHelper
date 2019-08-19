<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员登录</title>
<link href="${root }/css/common.css" rel="stylesheet" type="text/css" />
<link href="${root }/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <jsp:include page="comm/header.jsp"/> 
	<div class="container login">
		<div class="span12">
			<div class="ad">
				<img src="${root }/image/login.jpg" width="500" height="330" alt="会员登录"
					title="会员登录">
			</div>
		</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<a href="${root }/user/login.html"><strong>用户登陆</strong></a><strong>|</strong>
						<a href="${root }/user/phoneLogin.html"><strong>手机登陆</strong></a>
					</div>
					<form id="loginForm" method="post" novalidate="novalidate">
						<table>
							<tbody>
								<tr>
									<th>用户名:</th>
									<td><input type="text" id="username" name="username" value=${username}
										class="text" maxlength="20"><span id="error" style="color:red;"></span></td>
								</tr>
								
									
									<tr>
									<th>输入新密码:</th>
									<td><input type="password" id="password" name="password"
										class="text" maxlength="20"><span id="error" style="color:red;"></span></td>
								</tr>
								
								<tr>
									<th>确认密码:</th>
									<td><input type="text" id="rePassword" name="rePassword"
										class="text" maxlength="20"><span id="error" style="color:red;"></span></td>
								</tr>
									
										</span>
													</td>
								
								<tr>
									<th>&nbsp;</th>
									<td><input type="button" class="submit" value="登 录" id="btn" >
									</td>
								</tr>
								<tr class="register">
									<th>&nbsp;</th>
									<td>
										<dl>
											<dt>还没有注册账号？</dt>
											<dd>
												立即注册即可体验在线购物！ <a href="./会员注册.htm">立即注册</a>
											</dd>
										</dl>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	   <jsp:include page="comm/footer.jsp"/> 
	 <script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
<%-- 	 <script type="text/javascript" src="${root}/js/cookie_utils.js"></script> --%>
	 <script type="text/javascript">
	  $("#btn").click(function(){
		 var username = $("#username").val();
		var password = $("#password").val();
		var rePassword= $("#rePassword").val();
//		alert(username+" "+password);
		if(password==rePassword){
			$.ajax({
				"url":"${root}/user/alterPassWord.do",
				"type":"post",
				"dataType":"json",
				data:{"username":username,"password":password},
				success:function(){	
					alert("密码修改成功");
				    	location.href="${pageContext.request.contextPath}/user/login.html";	  
				}
		
			})
			
		}
	 });
	 </script>
	
</body>
</html>