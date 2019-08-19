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
									<th>用户名/E-mail:</th>
									<td><input type="text" id="username" name="username"
										class="text" maxlength="20"><span id="error" style="color:red;"></span></td>
								</tr>
								<tr>
									<th>密&nbsp;&nbsp;码:</th>
									<td><input type="password" id="password" name="password"
										class="text" maxlength="20" autocomplete="off"></td>
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
									<th>&nbsp;</th>
									<td><label> <input type="checkbox"
											id="isRememberUsername" name="isRememberUsername"
											value="true">记住用户名
									</label> <label> &nbsp;&nbsp;<a href="${root}/user/findPassword.html">找回密码</a>
									</label></td>
								</tr>
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
		 var username = $("#username").val();
		var password = $("#password").val();
		var code = $("#ucode").val();
		//  var  obj = document.getElementsByName("isRememberUsername");
		   var bool = $("#isRememberUsername").is(':checked')
		$.ajax({
			"url":"${root}/user/login.do",
			"type":"post",
			"dataType":"json",
			data:{"username":username,"password":password,"code":code},
			success:function(result){
				var data = result.error_code;
			//	alert(data)
			    if(data==0){				
				  var user = result.error_user;
				  var username_cookie = user.username;
				  var name_cookie = user.name;
				  var id_cookie = user.id;
			//	  alert("login"+username_cookie+"  ="+name_cookie+"  "+id_cookie);
				  if(bool==true){
					//  alert("进来了");
					  addCookie("password",password,2);
					  addCookie("username_cookie",username_cookie,2);
					  addCookie("name_cookie",name_cookie,2); 
					  addCookie("id_cookie",id_cookie,2);
				  }else{
					 // alert("没进来");
				  addCookie("username_cookie",username_cookie,2);
				  addCookie("name_cookie",name_cookie,2); 
				  addCookie("id_cookie",id_cookie,2);
				  }
				  
				 
			    	location.href="${pageContext.request.contextPath}/item/index.html";	
			    }
			    if(data==-2){
			    	location.href="${pageContext.request.contextPath}/user/login.html";
			    	$("#captchaImageError").html(result.error_msg);
			    }
			    if(data==-1){
                    location.href="${pageContext.request.contextPath}/user/login.html"
	//		    	alert(result.error_msg);
			    	$("#error").html(result.error_msg);
				   	return false;
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
	 <script>
	  $(function(){
		  var username = getCookie("username_cookie");
	//	  alert(username);
		  if(username!=null){
			  var chk = document.getElementById("isRememberUsername");
			 // alert(chk.checked);
			 $("#username").html(username);
			 chk.checked=true;
		  }else{
			  chk.checked=false;
		  }
	  })
	 </script>
</body>
</html>