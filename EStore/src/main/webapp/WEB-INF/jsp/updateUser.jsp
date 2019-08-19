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
            	<a href="${root}/user/updateUser.html" class="on">修改个人信息</a>
                <a href="${root}/user/updatePassWord.html" >修改密码</a>
                 <a href="${root}/user/address.html">收货地址管理</a>
                   <a href="${root}/user/userorders.html" >查看订单</a>
                <a href="${root}/user/userphoto.html">查看历史头像</a>
                
            </dd>
            </dl>
            
        </div>
        <div class="right">
        	<dl class="dl01">
            	<dt><img src="${root}/image/ico04.jpg"/></dt>
                <dd>
					<table width="725" border="0" cellpadding="0" cellspacing="0">
                      
                      <tr>
                       <!--  <td>还没有上传头像？ 点击<a href="#">上传头像</a><a class="save" href="#">保存</a></td> -->
                        
                        <form action="${root}/user/upPhoto.do" method="post" enctype="multipart/form-data">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="file" name="file"  width="120px">
	<input type="submit"value="头像上传">
                        </form>
                        
                    
                      </tr>
                    </table>
                    <img src="${root}/image/face.jpg"/>
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
				<table>
					<tbody>
						
						
					</tbody>
				</table>
			</form>
			<form>
				<table>
					<tbody>
						<tr>
							<td class="title" colspan="2"><h5>信息修改</h5></td>

						</tr>
						<!-- <tr>
							<th>
								<span class="requiredField"></span>用户名:
							</th>
							<td>
								<input type="text" id="username" name="username" class="text" maxlength="20" />	
								<span id="usernameinfo"></span>
							</td>
						</tr> -->
						<tr>
							<th>
								<span class="requiredField"></span>E-mail:
							</th>
							<td>
								<input type="text" id="email" name="email" class="text" maxlength="200" />
								<span id="emailinfo"></span>
							</td>
						</tr>
						<tr>
							<th>
								姓名:
							</th>
							<td>
								<input type="text" id="realname" name="realname" class="text" maxlength="200" />
								<span id="realnameinfo"></span>
							</td>
						</tr>
						<tr>
							<th>
								性别:
							</th>
							<td>
									<span class="fieldSet">
											<label>
												<input type="radio" name="sex" value="男" />男
											</label>
											<label>
												<input type="radio" name="sex" value="女" />女
											</label>
									</span>
									<span id="sexinfo"></span>
							</td>
						</tr>
						<tr>
							<th>
								出生日期:
							</th>
							<td>
									<input type="date" id="birthday" name="birthday" class="text" />
									<span id="birthdayinfo"></span>
							</td>
						</tr>
						
						<tr>
							<th>
								地址:
							</th>
							<td>
								<p>
						省<select style="width: 80px;" id="province"
							onblur="_getCity(this);">
							<option value="1">--请选择--</option>
						</select> 市<select style="width: 80px;" id="city" onblur="_getArea(this);">
							<option value="1">--请选择--</option>
						</select> 区/县<select style="width: 80px;" id="area">
							<option value="1">--请选择--</option>
						</select>
					</p>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text" id="realaddress" name="realaddress" class="text" maxlength="200" placeholder="详细地址"/></td>
						</tr>
						
						
						<tr>
							<td colspan="2" class="button">
								<button id="buttonsub" type="button" style="padding: 10px;color: #ffffff;background-color: #b31d04;" onclick="updateUser()">确认修改</button>
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
	 function updateUser(){
		 var id = getCookie("id_cookie");
//		 alert(id);
		 var email =$("#email").val();
		 var name =$("#realname").val();
		 var sex = $("input[type=radio]:checked").val();
		 var birthday = $("#birthday").val();
		 var addr= $("#realaddress").val();
		 var province = $("#province option:selected").text();
		 var city = $("#city option:selected").text();
		 var area = $("#area option:selected").text();
		 var address = province+"省"+city+"市"+area+addr;
		 $.ajax({
			 "url":"${root}/user/updateUser.do",
				"type":"post",
				"dataType":"json",
				data:{"email":email,"name":name,"sex":sex,"birthday":birthday,"address":address,"id":id},
				success:function(result){
					alert("更新"+result.error_msg);
					
					  addCookie("name_cookie",name,2); 
					  addCookie("id_cookie",id,2);
					location.href="${root}/user/userInfo1.html";
				}
		 })
		 
		 
	 }
	 </script>
	
	 <script type="text/javascript">
	  /*省市区三级联动*/
	  $(function(){
		  $.ajax({
			  url:"${root}/province/data/getProvince.do?parentid=0",
			  type:"post",
			  dataType:"json",
			  success:function(result){
				  var provinceList=$.parseJSON(result.error_msg);
		//		  alert(provinceList);
				  for(var i=0;i<provinceList.length;i++){
					  $("<option></option>").attr("value",provinceList[i].codeid).html(provinceList[i].cityname).appendTo($("#province"));
				  }
			  }
		  })
	  })
	  function _getCity(_this){
		  var parentid=_this.value;
		  //alert(parentid);
		  var sendData={"parentid":parentid};
		  $.ajax({
			  url:"${root}/province/data/getProvince.do",
			  data:sendData,
			  dataType:"json",
			  success:function(result){
				  var provinceList=$.parseJSON(result.error_msg);
				  for(var i=0;i<provinceList.length;i++){
					  $("<option></option>").attr("value",provinceList[i].codeid).html(provinceList[i].cityname).appendTo($("#city"));
				  }
			  }
		  })
	  }
	  function _getArea(_this){
		  var parentid=_this.value;
//		 alert(parentid);
		  $.ajax({
			  url:"${root}/province/data/getProvince.do",
			  type:"post",
			  data:{"parentid":parentid},
			  dataType:"json",
			  success:function(result){
				  var provinceList=$.parseJSON(result.error_msg);
				  for(var i=0;i<provinceList.length;i++){
					  $("<option></option>").attr("value",provinceList[i].codeid).html(provinceList[i].cityname).appendTo($("#area"));
				  }
			  }
		  })
	  }
	  var address = null;
	  function output_val(){
		 var province = $("#province option:selected").text();
		 if(province=="--请选择--"){
			 alert("请选择省份");
			 return false;
		 }		
		 var city = $("#city option:selected").text();
		 if(city=="--请选择--"){
			 alert("请选择城市");
			 return false;
		 }
	
		 var area = $("#area option:selected").text();
		 if(area=="--请选择--"){
			 alert("请选择区域");
			 return false;
		 }
		 $("#realaddress").text(province+"省"+city+"市"+area);
	  }
	 </script>
	 
</body>
</html>