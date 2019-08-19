<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="${root }/items/index.html"> <img
				src="${root }/image/logo.png" width="180" height="50px" alt="">
			</a>
		</div>
	</div>
	<div class="span9">
		<div class="headerAd">
			<img src="${root }/image/header.jpg" width="320" height="50"
				alt="正品保障" title="正品保障">
		</div>
	</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul id="headerLogin">
				
				  <li id="headerLogin" class="headerLogin" style="display: list-item;">
				  <a id="headerUserName" onclick="userInfo()"> <span style="color: red;">|</span></a>
				  |</li>
				<li id="headerRegister" class="headerRegister"
						style="display: list-item;"><a href="${root }/user/regist.html">注册</a>|</li>
			    <li><a>会员中心</a> |</li>
				<li><a>关于我们</a> |</li>
				<li><a  id="exitLogin" onclick="exit()">退出</a></li>
			</ul>
		</div>
		<div class="cart">
			<a href="${root }/cart/shoppingCard1.html">购物车</a>
		</div>
		<div class="phone">
			客服热线: <strong>96008/53277764</strong>
		</div>
	</div>
	<div class="span24">
		<ul class="mainNav">
			<li><a href="${root }/item/index.html">首页</a> |</li>
			<li><a href="${root }/item/sort.html">定制套餐</a> |</li>
			<li><a>安全频道</a> |</li>
			<li><a>亿家卡</a> |</li>
			<li><a>蔬菜基地</a> |</li>
			<li><a>节气养生</a> |</li>
			<li><a>便民服务</a> |</li>

		</ul>
	</div>

</div>
<script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${root}/js/cookie_util.js"></script>
<script  type="text/javascript">
     $(function(){
 //   	 var username = getCookie("username_cookie");
    	 var name = getCookie("name_cookie");
    	 var id = getCookie("id_cookie");
    
   // 	 alert(name+" cookie "+username+"  "+ id); 
         if(name != null){
              $("#headerUserName").text(name);
         }else{
        	 
        	 $("#headerUserName").text("登录"); 
         }
         
     })
     
     
      function exit(){
    	 delCookie("username_cookie");
    	 delCookie("name_cookie");
    	 delCookie("id_cookie");
    	 location.href="${pageContext.request.contextPath}/user/login.html";
     }
     function userInfo(){
    	 var id = getCookie("id_cookie");
    	 if(id!=null){
    		 location.href="${root}/user/userInfo.html/"+id+"";  		 
    	 }else{
    		 location.href="${pageContext.request.contextPath}/user/login.html"; 
    	 }
     } 
</script>


