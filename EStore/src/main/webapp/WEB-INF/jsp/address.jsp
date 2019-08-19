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
            	<a href="${root}/user/userInfo1.html">个人资料</a>
            	<a href="${root}/user/updateUser.html" >修改个人信息</a>
                <a href="${root}/user/updatePassWord.html">修改密码</a>
                 <a href="${root}/user/address.html" class="on">收货地址管理</a>
                 <a href="${root}/user/userorders.html" >查看订单</a>
                 <a href="${root}/user/userphoto.html">查看历史头像</a>
                
            </dd>
            </dl>
            
        </div>
        <div class="right">
        	<dl class="dl01">
            	<dt><img src="${root}/image/ico04.jpg"/></dt>
                <dd>
					<table id="photoTable" width="725" border="0" cellpadding="0" cellspacing="0">
                      
                    <!--  <dt id="photo"></dt> -->
               <%--      <img src="${root}/image/xj.jpg"/></dt>  --%>
                    </table>
                  
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
				<table id="addressTable">
					<tbody>
						<tr>
							<td class="title" colspan="2"><h5>地址管理</h5></td>
						</tr>
						<!-- <tr>
							<th>
								<span class="requiredField"></span>E-mail:
							</th>
							<td>
							<span id="emailinfo"></span>
							</td>
						</tr>
						<tr>
							<th>
								姓名:
							</th>
							<td>
							<span id="realnameinfo"></span>
							</td>
						</tr>
						<tr>
							<th>
								性别:
							</th>
							<td>
									<span id="sex" ></span>
							</td>
						</tr>
						<tr>
							<th>
								出生日期:
							</th>
							<td>

									<span id="birthdayinfo"></span>
							</td>
						</tr> -->
						
						<!--  <tr>
							<th>
								地址:
							</th>
							<td><span id="realaddress"></span></td>					
						</tr>  -->
						
					</tbody>
				</table>
			</form>

			
		</div>
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
							
							<td><input type="text" id="realaddress1" name="realaddress1" class="text" maxlength="200" placeholder="详细地址"/></td>
						</tr>
						
		<input type="button" onclick="addAddress11()" value="添加收货地址">
	</div>
<jsp:include page="comm/footer.jsp"/>
<script type="text/javascript">

Date.prototype.format = function(format) {  
    var o = {  
        "M+" : this.getMonth() + 1, // month  
        "d+" : this.getDate(), // day  
        "h+" : this.getHours(), // hour  
        "m+" : this.getMinutes(), // minute  
        "s+" : this.getSeconds(), // second  
        "q+" : Math.floor((this.getMonth() + 3) / 3),
        "S" : this.getMilliseconds()  
    // millisecond  
    } 
    if (/(y+)/.test(format)) {  
        format = format.replace(RegExp.$1, (this.getFullYear() + "")  
                .substr(4 - RegExp.$1.length));  
    }  
  
    for ( var k in o) {  
        if (new RegExp("(" + k + ")").test(format)) {  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]  
                    : ("00" + o[k]).substr(("" + o[k]).length));  
        }  
    }  
    return format; 
}
 
		$(function(){
			var id = getCookie("id_cookie");
		//	alert(id);
			$.ajax({
				"url":"${root}/user/findUserInfo.do",
				"type":"post",
				"dataType":"JSON",
				"data":{"id":id},
				success:function(result){
					var code = result.error_code;
					if(code==0){
						var user = result.error_msg;
						var dateStr=new Date(user.birthday);
						//alert(user.photo);
						/* $("#realnameinfo").html(user.name);
						$("#emailinfo").html(user.email);
						$("#birthdayinfo").html(dateStr.format("yyyy-MM-dd hh:mm:ss"));
						$("#sex").html(user.sex);
						$("#realaddress").html(user.address); */
						$("#photoTable").html($("<img src='${root}/image/"+user.photo+"'/>").attr("width",100));
			
						
					}
						
				}
					
				
			})
		}) 
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
	 <script type="text/javascript">
	 	function addAddress11(){
	 		var uid = getCookie("id_cookie");
	 		var addr= $("#realaddress1").val();
	 		//alert(addr);
			 var province = $("#province option:selected").text();
			 var city = $("#city option:selected").text();
			 var area = $("#area option:selected").text();
			 if(province=="--请选择--"||city=="--请选择--"||area=="--请选择--"){
				 alert("请选择城市")
				 return false;
			 }
			 if(addr==""){
				 alert("请填写详细地点")
				 return false;
			 }
			 var address = province+"省"+city+"市"+area+addr;
			 $.ajax({
				 "url":"${root}/user/addAddress.do",
					"type":"post",
					"dataType":"JSON",
					"data":{"uid":uid,"address":address},
					success:function(result){
						var code = result.error_code;
						if(code==0){
							alert(result.error_msg);
							location.href="${root}/user/address.html";
						}else{
							alert(result.error_msg);
						}
					}
			 })
	 	}
	 
	 </script>
	 <script type="text/javascript">
	  $(function(){
		   var uid = getCookie("id_cookie");
		//   alert(uid)
		   $.ajax({
			   "url":"${root}/user/findAddressOrderByTime.do",
				"type":"post",
				"dataType":"JSON",
				"data":{"uid":uid},
				success:function(result){
				//	alert(result.error_msg);
					var code = result.error_code;
					if(code==0){
						$.each(result.error_msg,function(index,addres){
							$("<tr></tr>").attr("id",addres.id).attr("named","liPage").			    	
				    		 append($("<td width='60'></td>").html(addres.address)).
				    		 append($("<td width='20'></td>").html($("<input>").attr("type","button").attr("value","删除").attr("id","deleteCart").attr("onclick","deleteAddress("+addres.id+")")))
				    		.appendTo("#addressTable")
						})
					}
				}
		   })
	  })
	  
	  function deleteAddress(id){
	var  bol = confirm("确认删除？ ")
//	 var uid = getCookie("id_cookie");
	 $.ajax({
		 "url":"${root}/user/deleteAddress.do",
			"type":"post",
			"dataType":"json",
			"data":{"id":id}, 
			success:function(result){
				alert(result.error_msg);
				location.href="${root}/user/address.html";
			}
	 })
}

	 
	 </script>
</body>
</html>