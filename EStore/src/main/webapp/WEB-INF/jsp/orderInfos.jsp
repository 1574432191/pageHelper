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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="comm/header.jsp"/>
<div class="container cart">
		<div class="span24">
			<table id="table">
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
			</table>
			<dl id="giftItems" class="hidden" style="display: none;">
			</dl>
			<div class="total">
				<em id="promotion"></em> 商品金额: <strong id="effectivePrice">￥0.00元</strong>
			</div>
			<div class="span24">
			  <p>
				 <div id="orderid"></div><br>
				 <div id="createtime"></div><br>
				 <div id="totalprice"></div><br>
				 <div id="receivename"></div><br>
				 <div id="address"></div><br>
				 <div id="phone"></div><br>
				 <div id="status"></div><br>	         
			  </p>
			  <p>
						选择银行：<br /> <input type="radio" name="pd_FrpId"
							value="ICBC-NET-B2C" checked="checked" /> 支 付 宝  <img
							src="${root}/bank_img/zhifubao.jpg" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行 <img
							src="${root}/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行 <img
							src="${root}/bank_img/abc.bmp" align="middle" /> <br /> <input
							type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行 <img
							src="${root}/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
						<img src="${root}/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行 <img
							src="${root}/bank_img/ccb.bmp" align="middle" /> <br /> <input
							type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行 <img
							src="${root}/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
						<img src="${root}/bank_img/cmb.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId"
							value="ICBC-NET-B2C"/>工商银行 <img
							src="${root}/bank_img/icbc.bmp" align="middle" />
					</p>
					<hr/>
					<p style="text-align: right">
					<input type="button" onclick="AllOrders()" value="查看所有订单">
						<a onclick="alipay()">
							<img src="${root}/images/finalbutton.gif" width="204" height="51"
							border="0" />
						</a>
					</p>
				</div>
		        <hr />
		</div>
	</div>
	<jsp:include page="comm/footer.jsp" />
	
	<script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
  <script type="text/javascript" src="${root}/js/cookie_util.js"></script>
  <script type="text/javascript">
  $(function(){
	  var uid = ${uid};
	  var oid = ${oid};
	//  alert(uid+" = "+id);
	  $.ajax({
		  url:"${root}/order/data/getOrderInfos.do",
		  type:"post",
		  dataType:"json",
		  data:{"uid":uid,"id":oid},
		  success:function(result){
			  var code=result.error_code;
			//  alert(code+" + "+result.error_msg);
			  var list = result.error_msg;
			  $.each(list,function(index,orderItems){
		    		$("<tr></tr>").attr("id",orderItems.id).attr("named","page"). 
		    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+orderItems.item.titleimage+"'>")).
		    		 append($("<td width='150'></td>").html($("<a href='${root}/item/iteminfo.html/"+orderItems.item.id+"'>"+orderItems.item.name+"</a>"))).
		    		 append($("<td width='50'></td>").html(orderItems.item.estoreprice)).
		    		 append($("<td width='50'></td>").html(orderItems.buynum)).
		    		 append($("<td width='50' id='price'></td>").html(orderItems.item.estoreprice*orderItems.buynum))
		    		.appendTo("#table")
		    	});
		    	var o =result.error_msg1;
		//    	alert(o);
		    	$("#effectivePrice").html("￥:"+o.totalprice);
		    	$("#orderid").html("订单编号:"+o.id);
		    	$("#createtime").html("订单创建时间:"+o.createtime);
		    	$("#totalprice").html("订单总金额:"+"￥"+o.totalprice);
		    	$("#receivename").html("收件人姓名:"+o.receivename);
		    	$("#address").html("收货地址:"+o.address);
		    	$("#phone").html("联系电话:"+o.phone);
		    	$("#status").html(o.status==0?"订单状态:未支付":"订单状态:已支付");
		    
	   },
			  
		  
	  });
  })
  </script>
   <script>
  function AllOrders(){
	  var uid = getCookie("id_cookie");
	  location.href="${root}/order/myorder.html/"+uid+"";
  }
  
  function alipay(){
	  var id = getCookie("id_cookie");
//	  alert(id);
	  var orderid=$("#orderid").text();
	  var totalprice=$("#totalprice").text();
	  
	  var orderid=orderid.slice(5);
      var totalprice=totalprice.slice(7);
      var sendData={"orderId":orderid,"money":totalprice,"id":id};
	 $.ajax({
		   url:"${root}/order/data/alipay.do",
		   type:"post",
		   dataType:"json",
		   data:sendData,
		   success:function(result){
			//   alert(result.error_msg);
			   location.href="${root}/order/test.html";
		   }
	  })
  }
  </script>
</body>
</html>