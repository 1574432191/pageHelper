<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
</head>
<body>
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
									<th>邮箱号:</th>
									<td><input type="text" id="email" name="email"
										class="text" maxlength="20"><span id="error" style="color:red;"></span></td>
								</tr>
								
									
									<tr>
									<th>邮箱验证码:</th>
									<td><input type="text" id="emailPassword" name="emailPassword"
										class="text" maxlength="10" autocomplete="off">
										<input type="button" id="emailButton" value="点击获取邮箱验证码" onclick="sendEmail()">
										<span style=display:none id="getEmail" ></span>
										<span style=display:none id="getUsername" ></span>
										</td>
								</tr>
								
								<tr>
									<th>&nbsp;</th>
									<td><input type="button" class="submit" value="提交" id="btn" >
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
		var emailPassword = $("#emailPassword").val();
		var getEmail = $("#getEmail").html();
		var getUsername = $("#getUsername").html();
		alert(emailPassword+"  "+getEmail+"  "+getUsername)
		if(emailPassword==getEmail){
		
				location.href="${root}/user/alterPassword.html/"+getUsername;
			
			
		}else{
			alert("验证码输入错误");
		}

		
	 });
	 </script>
	 <script type="text/javascript">
		function sendEmail(){
			var email = $("#email").val();
			alert("dddd"+email)
			$.ajax({
				"url":"${root}/user/findPassWord.do",
				"type":"post",
				"dataType":"json",
				data:{"email":email},
				success:function(result){
					var code = result.error_code
					alert("后端传来"+result.error_msg)
					if(code==0){
						$("#getEmail").html(result.error_msg);
						$("#getUsername").html(result.error_user);
						
					}else{
						alert(result.error_msg)
					}
				}
			})
		}
	 </script>
</body>
</html>