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
                <a href="${root}/user/updatePassWord.html" class="on">修改密码</a>
                 <a href="${root}/user/address.html">收货地址管理</a>
                   <a href="${root}/user/userorders.html" >查看订单</a>
                <a href="${root}/user/userphoto.html">查看历史头像</a>
                
            </dd>
            </dl>
            
        </div>
       
        	
          

		<div class="user-right user-edit">

		
			
			<form>
				<table id="pwdshow">
					<tbody>
						<tr>
							<td class="title" colspan="2"><h5>密码修改</h5></td>
						</tr>
						<tr>
							<td class="label">原密码</td>
							<td><input id="oldpassword" type="password" class="text"
								placeholder="原密码" name="pwd"><span id="opwd"></span></td>
						</tr>
						<tr>
							<td class="label">新密码</td>
							<td><input type="password" class="text"
								placeholder="新密码" name="newpwd" id="newpassword"><span id="npwd"></span></td>
						</tr>
						<tr>
							<td class="label">确认新密码</td>
							<td><input type="password" class="text"
								placeholder="确认新密码" name="rnpwd" id="rnewpassword"><span id="rnpwd"></span></td>
						</tr>
						<tr>
							<td colspan="2" class="button">
								<button id="passwordbutton" type="button" style="padding: 10px;color: #ffffff;background-color: #b31d04;"  onclick="updatePassword()">确认修改</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
<jsp:include page="comm/footer.jsp"/>
  <script type="text/javascript" src="${root}/js/cookie_util.js"></script>
	 <script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
  function updatePassword(){
	  var password =$("#oldpassword").val();
	  var newPassword=$("#newpassword").val();
	  var rnewpassword = $("#rnewpassword").val();
	  var username = getCookie("username_cookie");
	  $.ajax({
			"url":"${root}/user/updatePassword.do",
			"type":"post",
			"dataType":"JSON",
			"data":{"password":password,"newPassword":newPassword,"rnewpassword":rnewpassword,"username":username},
	  		success:function(result){
	  			var code = result.error_code;
	  			if(code==0){
	  				$("#opwd").html(result.error_msg);
	  			}else if(code==1){
	  				$("#rnpwd").html(result.error_msg);
	  			}else{
	  				alert(result.error_msg);
	  				location.href="${root}/user/userInfo1.html";
	  			}
	  			
	  		}
	  
	  })
  }

</script>
</body>
</html>