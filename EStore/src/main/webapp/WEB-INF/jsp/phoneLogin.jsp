<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>手机号登录</title>
<link href="${root }/css/common.css" rel="stylesheet" type="text/css" />
<link href="${root }/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <jsp:include page="comm/header.jsp"/> 
	<div class="container login">
		<div class="span12">
			<div class="ad">
				<img src="${root }/image/login.jpg" width="500" height="330" alt="会员登录"
					title="手机号登陆">
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
									<th>手&nbsp;机&nbsp;号:</th>
									<td><input type="text" id="phoneNumber" name="phoneNumber"
										class="text" maxlength="20"><span id="error" style="color:red;"></span></td>
								</tr>
								<th>
														验证码:
													</th>
														<td>
														<span class="fieldSet">
											<input type="text" id="ucode" name="ucode" class="text captcha" maxlength="4" autocomplete="off">
											<img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/code.do" title="点击更换验证码" onclick="qie(this)">
										<span id="captchaImageError" style="color:red"></span>
										</span>
													</td>
								<tr>
									<th>手机验证码:</th>
									<td><input type="password" id="password" name="password"
										class="text" maxlength="8" autocomplete="off">
										<input type="button" value="点击获取短信验证码" onclick="getPhoneCode()">
										</td>
								</tr>
									
								<!-- <tr>
									<th>&nbsp;</th>
									<td><label> <input type="checkbox"
											id="isRememberUsername" name="isRememberUsername"
											value="true">记住用户名
									</label> <label> &nbsp;&nbsp;<a>找回密码</a>
									</label></td>
								</tr> -->
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
	    <script type="text/javascript" src="${root}/js/cookie_util.js"></script>
	 <script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
	 <script type="text/javascript">
	  $("#btn").click(function(){
		 var phoneNumber = $("#phoneNumber").val();
		var phoneCode = $("#password").val();
	//	var code = $("#ucode").val();
		alert(phoneNumber+" "+phoneCode);
		$.ajax({
			"url":"${root}/user/phoneLogin1.do",
			"type":"post",
			"dataType":"json",
			data:{"phoneNumber":phoneNumber,"phoneCode":phoneCode},
			success:function(result){
				var data = result.error_code;
				alert(data)
			    if(data==1){
				alert(result.error_msg);
				var user = result.error_msg;
				  var username_cookie = user.username;
				  var name_cookie = user.name;
				  var id_cookie = user.id;
				  addCookie("password",password,2);
				  addCookie("username_cookie",username_cookie,2);
				  addCookie("name_cookie",name_cookie,2); 
				  addCookie("id_cookie",id_cookie,2);
			    	location.href="${pageContext.request.contextPath}/item/index.html";	
			    }
			    if(data==0){
			    	alert(result.error_msg);
			    	location.href="${pageContext.request.contextPath}/user/phoneLogin.html";
			    }
			   
			    
			}
	
		})
	 });
	 </script>
	 <script type="text/javascript">
		function qie(_this) {
			_this.src = "${pageContext.request.contextPath}/code.do?" + new Date();
		}
	 </script>
	 <script type="text/javascript">
		function getPhoneCode(){
		//	alert("短信验证码");
			var phoneNumber= $("#phoneNumber").val();
			alert(phoneNumber);
			$.ajax({
				"url":"${root}/user/phoneLogin.do",
				"type":"post",
				"dataType":"json",
				data:{"phoneNumber":phoneNumber},
				success:function(){
					var code = result.error_code;
					if(code==0){
						alert(result.error_msg);
					}else{
						var user = result.error_msg;
						  var username_cookie = user.username;
						  var name_cookie = user.name;
						  var id_cookie = user.id;
						  addCookie("password",password,2);
						  addCookie("username_cookie",username_cookie,2);
						  addCookie("name_cookie",name_cookie,2); 
						  addCookie("id_cookie",id_cookie,2);
						  location.href="${pageContext.request.contextPath}/item/index.html";	
					}
				}
				
			})
		}
		
	 </script>
</body>
</html>