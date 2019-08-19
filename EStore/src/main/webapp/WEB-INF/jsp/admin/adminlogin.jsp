<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
     <link href="${root}/css/admin_login.css"  rel="stylesheet" type="text/css"  charset="utf-8"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理</title>
</head>
<body>
<div class="admin_login_wrap">
    <h1>后台管理</h1>
    <div class="adming_login_border">
        <div class="admin_input">
            <form action="index.html" method="post">
                <ul class="admin_items">
                    <li>
                        <label for="user">用户名：</label>
                        <input type="text" name="username"  id="user" size="40" class="admin_input_style" />
                    </li>
                    <li>
                        <label for="pwd">密码：</label>
                        <input type="password" name="pwd"  id="pwd" size="40" class="admin_input_style" />
                    </li>
                    <li>
                        <input type="button" tabindex="3" onclick="login()" value="提交" class="btn btn-primary" />
                    </li>
                </ul>
            </form>
        </div>
    </div>
    <p class="admin_copyright"><a tabindex="5" href="http://h2design.taobao.com/" target="_blank">返回首页</a> &copy; 2014 Powered by <a href="http://h2design.taobao.com/" target="_blank">氢设计</a></p>
</div>
<script type="text/javascript" src="${root}/js/cookie_util.js"></script>
<script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
<script>
  function login(){
	  var username = $("#user").val();
	  var password = $("#pwd").val();
//	  alert(username+"  "+password);
	  $.ajax({
		  "url":"${root}/admin/toLogin.do",
			"type":"post",
			"dataType":"json",
			data:{"username":username,"password":password},
			success:function(result){
				var code = result.data;
				if(code==0){
					alert(result.msg);
					location.href="${root}/admin/login.do";
				}else if(code==1){
					alert(result.msg);
					location.href="${root}/admin/login.do";
				}else{
					alert(result.msg);
					 addCookie("username",username,2);
					location.href="${root}/admin/index.do";
				}
			}
	  })
  }
</script>
</body>
</html>