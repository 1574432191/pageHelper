<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<link href="${root}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${root}/css/product.css" rel="stylesheet" type="text/css"/>
<link href="${root}/css/cart.css" rel="stylesheet" type="text/css"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单页面</title>
</head>
<body>
<jsp:include page="comm/header.jsp"/> 

<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				
			</div>
	
		
				<table  id="table" >
					<tbody>
					<tr>
					    <th>选定</th>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
					
						<!-- <tr>
							<td width="60">
								<input type="hidden" name="id" value="22"/>
								<img src=""/>
							</td>
							<td>
								<a target="_blank"><s:property value="product.pname"/></a>
							</td>
							<td>
								100
							</td>
							<td class="quantity" width="60">
								<input type="text" name="count" value="1" maxlength="4" onpaste="return false;"/>
								<div>
									<span class="increase">&nbsp;</span>
									<span class="decrease">&nbsp;</span>
								</div>
							</td>
							<td width="140">
								<span class="subtotal">￥100</span>
							</td>
							<td>
								<a href="./cart_removeCart.action?pid=1" class="delete">删除</a>
							</td>
						</tr>
					 -->
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					商品金额: <strong id="effectivePrice" >￥0.00元</strong>
				</div>
			<form id="orderForm" action="./order_payOrder.action" method="post">
				<input type="hidden" name="order.oid" value=""/>
				<div class="span24">
					<p>
						<!-- 请选择地址：省<select style="width: 80px;" id="province"
							onblur="_getCity(this);">
							<option value="1">--请选择--</option>
						</select> 市<select style="width: 80px;" id="city" onblur="_getArea(this);">
							<option value="1">--请选择--</option>
						</select> 区/县<select style="width: 80px;" id="area">
							<option value="1">--请选择--</option>
						</select><br>  -->
						请选择地址：收货地址<select style="width: 180px;" id="province"
							>
							<option value="1">--请选择--</option></select><br />
					<!-- 	详细收货地址：<input id="address"  type="text"
							value="" style="width: 300px" onblur="output_val();" /> <br /> -->
						收货人&nbsp;&nbsp;&nbsp;：<input name="receivename" id="receivename" type="text"
							value="" style="width: 150px" /> <br /> 联系方式：<input
							name="phone" type="text" value="" style="width: 150px" />
					</p>
						<hr />
						<p>
							选择银行：<br/>
							<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
							<img src="${root}/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
							<img src="${root}/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
							<img src="${root}/bank_img/abc.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
							<img src="${root}/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
							<img src="${root}/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
							<img src="${root}/bank_img/ccb.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
							<img src="${root}/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
							<img src="${root}/bank_img/cmb.bmp" align="middle"/>
						</p>
						<hr />
						<p style="text-align:right">
						<input type="button" onclick="AllOrders()" value="查看所有订单">
							<a   onclick="confirmOrder()">
								<img src="${root}/images/finalbutton.gif" width="204" height="51" border="0" />
							</a>
						</p>
				</div>
			</form>
		</div>
		
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="${root}/image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
</div>
</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a href="#">关于我们</a>
						|
					</li>
					<li>
						<a href="#">联系我们</a>
						|
					</li>
					<li>
						<a href="#">诚聘英才</a>
						|
					</li>
					<li>
						<a href="#">法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a >SHOP++官网</a>
						|
					</li>
					<li>
						<a>SHOP++论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2015 网上商城 版权所有</div>
	</div>
</div>
<script type="text/javascript" src="${root}/js/cookie_util.js"></script>
<script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
  <script type="text/javascript">
  $(function(){
	  var uid = getCookie("id_cookie");
	  $.ajax({
		  url:"${root}/user/findAllAddress.do",
		  type:"post",
		  dataType:"json",
		  data:{"uid":uid},
		  success:function(result){
			  var address=result.error_msg;
	//		  alert(provinceList);
			  for(var i=0;i<address.length;i++){
				  $("<option></option>").attr("value",address[i].id).html(address[i].address).appendTo($("#province"));
			  }
		  }
	  })
  })
  
  
  
    $(function(){
    	var ids = ${ids};
    	var uid = getCookie("id_cookie");
   //  	alert(ids);
   /* $("<input>").attr("id","count").attr("value",cart.buynum).attr("onpaste","return false;").attr("maxlength",4)).append($("<div><span class='increase'>&nbsp;</span><span class='decrease'>&nbsp;</span> </div>") */
    	$.ajax({
    		"url":"${root}/cart/data/cartToOrder.do/"+ids+"/"+uid+"",
    		"type":"post",
    		"dataType":"json",
    		 success:function(result){
    			 var cartList = result.error_msg;
    		//	 alert(cartList);
    			 $.each(cartList,function(index,cart){
    				 $("<tr></tr>").attr("named",cart.gid).attr("id",cart.gid).
		    		 append($("<td width='30'></td>").html($("<input>").attr("type","checkbox").attr("value",cart.gid).attr("name","check").attr("onclick","addPrice("+cart.item.estoreprice*cart.buynum+")"))).
		    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+cart.item.titleimage+"'>")).
		    		 append($("<td width='100'></td>").html($("<a href='${root}/item/itemInfo.html/"+cart.item.id+"'>"+cart.item.name+"</a>"))).
		    		 append($("<td width='50'></td>").html(cart.item.estoreprice)).
		    		 append($("<td width='100'></td>").html(cart.buynum)).
		    		 append($("<td width='50' id='price'></td>").html(cart.item.estoreprice*cart.buynum)).
		    		 append($("<td width='50'></td>").html($("<a href='javascript:void(0)' onclick='deleteCartById("+cart.gid+")'>删除</a>")))
		    		.appendTo("#table")
    			 })
    		}
    	});
    })
  </script>
 <script>
 // 计算商品的总价钱
 function addPrice(price){
	 var obj = document.getElementsByName("check");
	 var sum=0;
	 for(i in obj){
		 if(obj[i].checked){
			 sum+=price;
		 }
	 }
	 $("#effectivePrice").text("￥"+sum+"元");
	 
 }
 
 </script>
  
  <script type="text/javascript">
   //  提交订单
        var uid = getCookie("id_cookie");
   		if(uid==null){
   			alert("用户未登录，请先登录")
   			location.href="${root}/user/login.html"
   		}
//		var address =$("#address").val();
        function confirmOrder(){
    	  var obj = document.getElementsByName("check");
  		var ids =[];
  		for(i in obj){
  			if(obj[i].checked){
  				ids.push(obj[i].value);
  			}
  		}
 // 		alert("选定商品"+ids);
  		if(ids.length==0){
  			alert("请选择商品");
  			return false;		
  		}
  		var address =$("#province option:selected").text();
  	//	alert("收货地址"+address)
		if(address=="--请选择--"){
			alert("请选择地址");
					
		}
		var receivename = $("#receivename").val();
	//alert("手机号="+phone)
		if(receivename==null){
			alert("请填写收货联系人姓名");		
		}
		var phone =$("input[name=phone]").val(); 
		alert(uid+"  "+address+"  "+phone);
		
		$.ajax({
			"url":"${root}/order/data/addOrder.do/"+ids+"",
			"type":"post",
			"dataType":"json",
			data:{"uid":uid,"address":address,"phone":phone,"receivename":receivename},
			success:function(result){
				var code = result.error_code;
				var oid = result.oid;
				alert()
				if(code==0){
					alert(result.error_msg);
					location.href="${root}/order/findOrderInfo.html/"+uid+"/"+oid+"";
				}else{
					alert("++"+result.error_msg);
					location.href="${root}/cart/shoppingCard1.html";
				}
				
			}
		})
   }
  </script>
  <script>
  function AllOrders(){
	  var uid = getCookie("id_cookie");
	  location.href="${root}/order/myorder.html/"+uid+"";
  }
  </script>
</body>
</html>