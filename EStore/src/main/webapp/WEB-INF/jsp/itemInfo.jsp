<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath }"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link href="${root}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${root}/css/product.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <jsp:include page="comm/header.jsp"/> 


<div class="container productContent">
		<div class="span6">
			<div class="hotProductCategory">
			
			<jsp:include page="comm/left.jsp"/>	
			</div>

		</div>
		<div class="span18 last">
			
			<div class="productImage">
					<a title="" style="outline-style: none; text-decoration: none;" id="zoom" href="http://image/r___________renleipic_01/bigPic1ea8f1c9-8b8e-4262-8ca9-690912434692.jpg" rel="gallery">
						<div class="zoomPad"><img style="opacity: 1;" title="" class="medium" id="itemImage"><div style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;" class="zoomPup"></div><div style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;" class="zoomWindow"><div style="width: 368px;" class="zoomWrapper"><div style="width: 100%; position: absolute; display: none;" class="zoomWrapperTitle"></div><div style="width: 0%; height: 0px;" class="zoomWrapperImage"><img src="%E5%B0%9A%E9%83%BD%E6%AF%94%E6%8B%89%E5%A5%B3%E8%A3%852013%E5%A4%8F%E8%A3%85%E6%96%B0%E6%AC%BE%E8%95%BE%E4%B8%9D%E8%BF%9E%E8%A1%A3%E8%A3%99%20%E9%9F%A9%E7%89%88%E4%BF%AE%E8%BA%AB%E9%9B%AA%E7%BA%BA%E6%89%93%E5%BA%95%E8%A3%99%E5%AD%90%20%E6%98%A5%E6%AC%BE%20-%20Powered%20By%20Mango%20Team_files/6d53c211-2325-41ed-8696-d8fbceb1c199-large.jpg" style="position: absolute; border: 0px none; display: block; left: -432px; top: 0px;"></div></div></div><div style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;" class="zoomPreload">Loading zoom</div></div>
					</a>	
			</div>
			<div class="name" id="itemName"></div>
			<div class="sn">
				<div >编号：<span id="bianhao"></span></div>
			</div>
			<div class="info">
				<dl>
					<dt>亿家价:</dt>
					<dd>
						<strong >￥：<span id="estorePrice"></span>元/份</strong>
							参 考 价：
							<del >￥<span id="marketPrice"></span>元/份</del>
					</dd>
				</dl>
					<dl>
						<dt>促销:</dt>
						<dd>
								<a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)">限时抢购</a>
						</dd>
					</dl>
					<dl>
						<dt>    </dt>
						<dd>
							<span>    </span>
						</dd>
					</dl>
			</div>
				<div class="action">
					
						<dl class="quantity">
							<dt>购买数量:</dt>
							<dd>
								<input id="quantity" name="quantity" value="1" maxlength="4" onpaste="return false;" type="text"/>
								<div>
									<span  id="increase" class="increase" onclick="addItem(this)">&nbsp;</span>
									<span id="decrease" class="decrease" onclick="decreaseTtem(this)">&nbsp;</span>
								</div>
							</dd>
							<dd>
								件
							</dd>
						</dl>
					<div class="buy">
							<input id="addCart" class="addCart" value="加入购物车" type="button"/>
				
					</div>
				</div>
			<div id="bar" class="bar">
				<ul>
						<li id="introductionTab">
							<a href="#introduction">商品介绍</a>
						</li>
						
				</ul>
			</div>
				
				<div id="introduction" name="introduction" class="introduction">
					<div class="title">
						<strong>商品介绍</strong>
					</div>
					<div>
					<h1 id="description" align="center"></h1><br>
						<img id="detail" style="width:600px;height:500px;align:center;"/>
					</div>
				</div>
				
				
				
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="/image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
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
// 商品的详情展示
$(function(){
	var id = ${id};
//	alert(id);
	$.ajax({
		"url":"${root}/item/data/findItemInfo.do",
		"type":"post",
		"dataType":"json",
		"data":{"id":id},
		success:function(result){
			var item = result.error_msg;
			if(result.error_code==0){;
			$("#itemName").text(item.name);
			$("#bianhao").text(item.id);
			$("#estorePrice").text(item.estoreprice);
			$("#marketPrice").text(item.marketprice);
			$("#itemImage").attr("src","${root}/image/"+item.titleimage);
			$("#detail").attr("src","${root}/image/"+item.titleimage);
			$("#description").text(item.description);
			}	
		}
	})
	
})
</script>
<script type="text/javascript">
function addItem(_this){
	var itemNumber = $("#quantity").val();
//	alert(itemNumber);
	if(itemNumber>99){
		return false;
	}
	itemNumber++;
	$("#quantity").val(itemNumber);
}
function decreaseTtem(_this){
	var itemNumber = $("#quantity").val();
//	alert(itemNumber);
	if(itemNumber<=1){
		return false;
	}
	itemNumber--;
//	$("#quantity").val(itemNumber); 这句话可以将给input标签里的value属性赋值
    document.getElementById("quantity").value=itemNumber;//这句话可以将给input标签里的value属性赋值
	
}

</script>
<script type="text/javascript">
$("#addCart").click(function(){
	 var username = getCookie("username_cookie");
//	 alert("购物车"+username);
	 if(username!=null){
		 var id =  $("#bianhao").html();;
		 var num = $("#quantity").val();
	//	 alert(id+" id和数量  "+num)
		 location.href="${root}/cart/shoppingCard.html?id="+id+"&num="+num;
	 }else{
		 alert("请先登录");
		 location.href="${root}/user/login.html";
	 }
	
})
</script>

</body>
</html>