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
<title>我的订单界面</title>
</head>
<body>
<jsp:include page="comm/header.jsp"/> 
<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<ul>
					
					<li  class="current"></li>
					<li  ></li>
				</ul>
			</div>
	
		
				<table  id="table">
					<tbody>
					<tr>				
						<th>订单日期</th>
						<th>订单金额</th>
						<th>收件人</th>
						<th>联系方式</th>
						<th>支付状态</th>
						<th>订单详情</th>
						<th>操作</th>
					</tr>
				</tbody>
		</table>
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
<script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
  <script type="text/javascript" src="${root}/js/cookie_util.js"></script>

<script type="text/javascript">
    $(function(){
    	var uid = ${uid};
    	$.ajax({
    		"url":"${root}/order/data/findAllOrder.do",
			"type":"post",
			"dataType":"json",
			data:{"uid":uid},
			success:function(result){
				var orders = result.error_msg;
		//		alert(orders);
				$.each(orders,function(index,order){
					 $("<tr></tr>").attr("named",order.id).attr("id",order.id).
		    		 append($("<td width='30'></td>").html(order.createtime)).
		    		 append($("<td width='60'></td>").html(order.totalprice)).
		    		 append($("<td width='60'></td>").html(order.receivename)).
		    		 append($("<td width='60'></td>").html(order.phone)).
		    		 append($("<td width='60' ></td>").html(order.status==0?"未支付":"已支付")).
		    		 append($("<td width='100'></td>").html($("<a href='${root}/order/findOrderInfo.html/"+order.uid+"/"+order.id+"'>查看订单详情</a>"))).
		    		 append($("<td width='50'></td>").html($("<a href='javascript:void(0)' onclick='deleteCartById("+order.id+")'>删除</a>")))
		    		.appendTo("#table")
				})
				
			}
    	})
    })
  
</script>
<script type="text/javascript">
		function deleteCartById(id){
			$.ajax({
				"url":"${root}/order/data/deleteOrder.do",
				"type":"post",
				"dataType":"json",
				"data":{"id":id},
				success:function(result){
					alert("删除成功");
					location.reload();
				}
			})
		}
		

</script>
</body>
</html>