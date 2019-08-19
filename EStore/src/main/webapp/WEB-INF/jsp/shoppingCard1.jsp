<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="${root}/css/common.css" rel="stylesheet" type="text/css">
<link href="${root}/css/cart.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
</head>
<body>
  <jsp:include page="comm/header.jsp"/> 
  	<div class="container cart">
		<div class="span24">
			<div class="step step1">
				
			</div>
				<table id="table">
					<tbody><tr>
					    <th>选定</th>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
						<%-- <tr>
						    <td>
								<input type="radio" id="defualtAdd" name="defualtAdd">
							</td>
							<td width="60">
								<input type="hidden" name="id" value="22">
								<img src="${root}/image/dadonggua.jpg">
							</td>
							<td>
								<a target="_blank"> 有机蔬菜      大冬瓜...</a>
							</td>
							<td>
								￥298.00
							</td>
							<td class="quantity" width="60">
								1
							</td>
							<td width="140">
								<span class="subtotal">￥596.00</span>
							</td>
							<td>
								<a href="javascript:;" class="delete">删除</a>
							</td>
						</tr> --%>
				</tbody></table>
				<div class="pagination" id="page">
		<input type="button" id="upPage" value="上一页"  onclick="goUpPage()">
		<input type="button" id="nextPage" value="下一页" onclick="goNextPage()" >
		<input type="text" id="pageIndex" value="">
		<input type="button" id="but" value="跳转" onclick="tiaoZhuan()">
		<span id="pageCount"></span>
		<span id="theCount"></span>
	
			<!-- <span class="firstPage">&nbsp;</span>
			<span class="previousPage">&nbsp;</span>
				<span class="currentPage">1</span>
				<a href="javascript: $.pageSkip(2);">2</a>
			<a class="nextPage" href="javascript: $.pageSkip(2);">&nbsp;</a>
			
			<a class="lastPage" href="javascript: $.pageSkip(2);">&nbsp;</a> -->
	</div><br>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
				<em id="promotion"></em> <em> 登录后确认是否享有优惠 </em> 赠送积分: <em
					id="effectivePoint">0</em> 商品金额: <strong>￥<span id="effectivePrice">0</span>元</strong>
			</div>
				<div class="bottom">
					<a href="javascript:;" id="clear" class="clear" onclick="deleteAllCart()">清空购物车</a>
					<a  id="submit" class="submit" onclick="goToOrder()">提交订单</a>
				</div>
		</div>
	</div>
	   <jsp:include page="comm/footer.jsp"/> 
	   
	   <script type="text/javascript" src="${root}/js/cookie_util.js"></script>
	 <script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
	 <!-- <script type="text/javascript">
	     var isDefualtAdd = 0;//0表示不选中，1表示选定
	 $("input:radio").click(function(){
		 var $radio = $(this);
			if ($radio.data('waschecked') == true){
				$radio.prop('checked', false); $radio.data('waschecked', false);
				isDefualtAdd = 0;
			} else {
				$radio.prop('checked', true); $radio.data('waschecked', true);
				isDefualtAdd = 1;
			}
			
	
	 });
	 </script> -->
<script type="text/javascript">

// 这里是在添加时显示第一页物品
	$(function(){
			var uid = getCookie("id_cookie");
		$.ajax({
			"url":"${root}/cart/data/findByCount1.do",
			"type":"post",
			"dataType":"JSON",
			"data":{"uid":uid},
			success:function(result){
				var code = result.error_code;
				var cartList = result.error_msg ;
	//			alert("======="+cartList+"   "+code);
				if(code==1){
					var num1= result.buynum;
					//alert("xuanhuan")
					$.each(cartList,function(index,cartList){
					//	alert("循环遍历"+cartList.id);
						$("<tr></tr>").attr("id",cartList.id).attr("named","liPage").
			    		 append($("<td width='30'></td>").html($("<input>").attr("type","checkbox").attr("name","defualtAdd").attr("value",cartList.id).attr("onclick","add("+cartList.estoreprice*cartList.buynum+");"))).
			    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+cartList.titleimage+"'>")).
			    		 append($("<td width='150'></td>").html($("<a href='${root}/item/itemInfo.html/"+cartList.id+"' id='deleteCartId'>"+cartList.name+"</a>"))).
			    		 append($("<td width='50'></td>").html(cartList.estoreprice)).
			    		 append($("<td width='50'><input id='quantity' name='quantity' value="+cartList.buynum+" maxlength='4'  type='text' style='width:36px;'/><button typy='button' id='increase' class='increase' onclick='addItem("+cartList.estoreprice+")'>+</button>&nbsp;<button typy='button' id='decrease' class='decrease' onclick='decreaseTtem("+cartList.estoreprice+")'>-</button>&nbsp;</td>")).   		 
			    		 append($("<td width='50' id='price'></td>").html(cartList.estoreprice*cartList.buynum)).
			    		 append($("<td width='50'></td>").html($("<input>").attr("type","button").attr("value","删除").attr("id","deleteCart").attr("onclick","deleteCart("+cartList.id+")")))
			    		.appendTo("#table")
			    		
					})
					
					
				}else{
				//	alert("xuanhuan=0")
					$.each(cartList,function(index,cartList){
					//	alert("循环遍历"+cartList.id);
						$("<tr></tr>").attr("id",cartList.id).attr("named","liPage").
			    		 append($("<td width='30'></td>").html($("<input>").attr("type","checkbox").attr("name","defualtAdd").attr("value",cartList.id).attr("onclick","add("+cartList.estoreprice*cartList.buynum+");"))).
			    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+cartList.titleimage+"'>")).
			    		 append($("<td width='150'></td>").html($("<a href='${root}/item/itemInfo.html/"+cartList.id+"' id='deleteCartId'>"+cartList.name+"</a>"))).
			    		 append($("<td width='50'></td>").html(cartList.estoreprice)).
			    		 append($("<td width='50'><input id='quantity' name='quantity' value="+cartList.buynum+" maxlength='4'  type='text' style='width:36px;'/><button typy='button' id='increase' class='increase' onclick='addItem("+cartList.estoreprice+")'>+</button>&nbsp;<button typy='button' id='decrease' class='decrease' onclick='decreaseTtem("+cartList.estoreprice+")'>-</button>&nbsp;</td>")).
			    		 append($("<td width='50' id='price'></td>").html(cartList.estoreprice*cartList.buynum)).
			    		 append($("<td width='50'></td>").html($("<input>").attr("type","button").attr("value","删除").attr("id","deleteCart").attr("onclick","deleteCart("+cartList.id+")")))
			    		.appendTo("#table")
			    		
					})
				}
				
			}
		});
	})
</script> 
<script type="text/javascript">

//分页操作
$(function(){
	
	var uid = getCookie("id_cookie");
	
//	alert("ccccc"+pageIndex);
	$.ajax({
		"url":"${root}/cart/data/findCount.do",
		"type":"post",
		"dataType":"json",
		data:{"uid":uid},
		success:function(result){
			var code = result.error_code;
//			alert(result.error_msg);
			if(code==0){
				$("#pageCount").html("共"+result.error_msg+"页");	
				$("#theCount").html("当前为第"+1+"页");	
				$("#pageIndex").val("1")
			}
		}
	})
})

</script>
<!--跳转方法  -->
<script>
	function tiaoZhuan(){
		var pageIndex = $("#pageIndex").val();
		var uid = getCookie("id_cookie");
	//	alert(pageIndex);
		if(pageIndex==null){
			return false;
		}else{
			$.ajax({
				"url":"${root}/cart/data/findFY.do",
				"type":"post",
				"dataType":"json",
				"data":{"uid":uid,"pageIndex":pageIndex},
				success:function(result){
					$("tr[named=liPage]").remove();
					var code = result.error_code;
					var cartList = result.error_msg ;
					if(code==1){
						$.each(cartList,function(index,cartList){
							//	alert("循环遍历"+cartList.id);
								$("<tr></tr>").attr("id",cartList.id).attr("named","liPage").
			    		 append($("<td width='30'></td>").html($("<input>").attr("type","checkbox").attr("name","defualtAdd").attr("value",cartList.id).attr("onclick","add("+cartList.estoreprice*cartList.buynum+");"))).
			    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+cartList.titleimage+"'>")).
			    		 append($("<td width='150'></td>").html($("<a href='${root}/item/itemInfo.html/"+cartList.id+"' id='deleteCartId'>"+cartList.name+"</a>"))).
			    		 append($("<td width='50'></td>").html(cartList.estoreprice)).
			    		 append($("<td width='50'><input id='quantity' name='quantity' value="+cartList.buynum+" maxlength='4'  type='text' style='width:36px;'/><button typy='button' id='increase' class='increase' onclick='addItem("+cartList.estoreprice+")'>+</button>&nbsp;<button typy='button' id='decrease' class='decrease' onclick='decreaseTtem("+cartList.estoreprice+")'>-</button>&nbsp;</td>")).
			    		 append($("<td width='50' id='price'></td>").html(cartList.estoreprice*cartList.buynum)).
			    		 append($("<td width='50'></td>").html($("<input>").attr("type","button").attr("value","删除").attr("id","deleteCart").attr("onclick","deleteCart("+cartList.id+")")))
			    		.appendTo("#table")
					    		
							})
						$("#theCount").html("当前为第"+result.error_page+"页");	
						//$("#pageIndex").val(result.error_page);
					}
				},
			})
		}	
	}
		
</script>
<script >
    // 上一页功能
	function goUpPage(){
	   var pageIndex =$("#pageIndex").val();
	   var uid = getCookie("id_cookie");
	   $.ajax({
		   "url":"${root}/cart/data/upPage.do",
			"type":"post",
			"dataType":"json",
			"data":{"uid":uid,"pageIndex":pageIndex},
			success:function(result){
				var code = result.error_code;
				//alert(result.error_msg);
				var cartList = result.error_msg ;
				if(code==1){
					$("tr[named=liPage]").remove();
					$.each(cartList,function(index,cartList){
						//	alert("循环遍历"+cartList.id);
							$("<tr></tr>").attr("id",cartList.id).attr("named","liPage").
			    		 append($("<td width='30'></td>").html($("<input>").attr("type","checkbox").attr("name","defualtAdd").attr("value",cartList.id).attr("onclick","add("+cartList.estoreprice*cartList.buynum+");"))).
			    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+cartList.titleimage+"'>")).
			    		 append($("<td width='150'></td>").html($("<a href='${root}/item/itemInfo.html/"+cartList.id+"' id='deleteCartId'>"+cartList.name+"</a>"))).
			    		 append($("<td width='50'></td>").html(cartList.estoreprice)).
			    		 append($("<td width='50'><input id='quantity' name='quantity' value="+cartList.buynum+" maxlength='4'  type='text' style='width:36px;'/><button typy='button' id='increase' class='increase' onclick='addItem("+cartList.estoreprice+")'>+</button>&nbsp;<button typy='button' id='decrease' class='decrease' onclick='decreaseTtem("+cartList.estoreprice+")'>-</button>&nbsp;</td>")).
			    		 append($("<td width='50' id='price'></td>").html(cartList.estoreprice*cartList.buynum)).
			    		 append($("<td width='50'></td>").html($("<input>").attr("type","button").attr("value","删除").attr("id","deleteCart").attr("onclick","deleteCart("+cartList.id+")")))
			    		.appendTo("#table")	
						})
					$("#theCount").html("当前为第"+result.error_page+"页");	
					$("#pageIndex").val(result.error_page);
				}	
			}
	   })
	}
</script>
<script >
    // 下一页功能
	function goNextPage(){
		 var pageIndex =$("#pageIndex").val();
		   var uid = getCookie("id_cookie");
	   $.ajax({
		   "url":"${root}/cart/data/downPage.do",
			"type":"post",
			"dataType":"json",
			"data":{"uid":uid,"pageIndex":pageIndex},
			success:function(result){
				var code = result.error_code;
//				alert(result.error_msg);
				var cartList = result.error_msg ;
				if(code==1){
					$("tr[named=liPage]").remove();
					$.each(cartList,function(index,cartList){
						//	alert("循环遍历"+cartList.id);
						$("<tr></tr>").attr("id",cartList.id).attr("named","liPage").
			    		 append($("<td width='30'></td>").html($("<input>").attr("type","checkbox").attr("name","defualtAdd").attr("value",cartList.id).attr("onclick","add("+cartList.estoreprice*cartList.buynum+");"))).
			    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+cartList.titleimage+"'>")).
			    		 append($("<td width='150'></td>").html($("<a href='${root}/item/itemInfo.html/"+cartList.id+"' id='deleteCartId'>"+cartList.name+"</a>"))).
			    		 append($("<td width='50'></td>").html(cartList.estoreprice)).
			    		 append($("<td width='50'><input id='quantity' name='quantity' value="+cartList.buynum+" maxlength='4'  type='text' style='width:36px;'/><button typy='button' id='increase' class='increase' onclick='addItem("+cartList.estoreprice+")'>+</button>&nbsp;<button typy='button' id='decrease' class='decrease' onclick='decreaseTtem("+cartList.estoreprice+")'>-</button>&nbsp;</td>")).
			    		 append($("<td width='50' id='price'></td>").html(cartList.estoreprice*cartList.buynum)).
			    		 append($("<td width='50'></td>").html($("<input>").attr("type","button").attr("value","删除").attr("id","deleteCart").attr("onclick","deleteCart("+cartList.id+")")))
			    		.appendTo("#table")	
				    		
						})
					$("#theCount").html("当前为第"+result.error_page+"页");	
					$("#pageIndex").val(result.error_page);
				}	
			}
	   })
	}
</script>
<script type="text/javascript">

//商品加一
function addItem(marketprice){
	
	  var number = $("#quantity").val();
	  var price = $("#price").val()
	  if(number>99){
		  return false;
	  }
	  ++number;
	 price=number*marketprice;
	  $("#quantity").val(number);
	  $("#price").html(price);
//	  alert(number);
}

// 商品减一
function decreaseTtem(marketprice){
	  var number = $("#quantity").val();
	  var price = $("#price").val()
	  if(number<2){
		  return false;
	  }
	  --number;
	  price=number*marketprice;
	  $("#quantity").val(number);
	  $("#price").html(price);
	  
}
</script>

<script>
 function deleteAllCart(){
	 var uid = getCookie("id_cookie");
	 $.ajax({
		 "url":"${root}/cart/data/deleteAllCart.do",
			"type":"post",
			"dataType":"json",
			"data":{"uid":uid}, 
			success:function(result){
			   location.href="${root}/cart/shoppingCard1.html";
			}
	 })
 }
</script>
<<script type="text/javascript">
//  单个删除购物车
function deleteCart(gid){
	var  bol = confirm("确认删除？ ")
	 var uid = getCookie("id_cookie");
	 $.ajax({
		 "url":"${root}/cart/data/deleteCart.do",
			"type":"post",
			"dataType":"json",
			"data":{"uid":uid,"gid":gid}, 
			success:function(result){
		     location.href="${root}/cart/shoppingCard1.html";
			}
	 })
}



</script>
<script type="text/javascript">
//计算总积分和总钱数
/*计算总钱数和赠送积分总和*/
	   function add(){
	/*getElementsByName()方法可返回带有指定名称的对象的集合 
	  该方法查询元素的name属性，在一个文档中的name属性可能不唯一
	  (如HTML表单中的单选框和复选框常具有相同的name属性)
	  getElementsByName()方法返回的是元素与的数组，而不是一个元素
	*/
		    obj = document.getElementsByName("defualtAdd");
		    sum=0;
		    /* 
		    js中in是一种运算符，就是判断属性是否存在对象，如果存在，返回值为true
		            不存在，则为false
		    */
		    for(k in obj){
		        if(obj[k].checked){
		        	var id=$(obj[k]).val();
		        	/*children()方法返回备选元素的所有直接子元素*/
		        	/*eq是在遍历时所使用的一个函数，eq(index),index是从0开始的，
		        	  如果index为负数，则从集合中的元素最后一个往回数
		        	*/
		        	var onePrice = $("#"+id+"").children("td").eq(5).html();
		        	/* parseFloat()函数可解析一个字符串，并返回一个浮点数  
		        	*/
		        	sum+=parseFloat(onePrice);
		        }
		    }
		    $("#effectivePoint").text(sum);
		    $("#effectivePrice").text(sum);
	   }

</script>
<script type="text/javascript">
   function goToOrder(){
	   obj = document.getElementsByName("defualtAdd");
	   var uid = getCookie("id_cookie");
//	   alert(obj);
       var ids = [];
	   for(i in obj){
		   if(obj[i].checked){
			   //push将参数添加到原数组末尾，并返回数组的长度
			    ids.push(obj[i].value);				
		   }
	   }
		if(ids.length==0){
			alert("没有选择商品，请选择商品");
			  return false;
			
	  }else{
		//  alert("商品挑选好了");
		  location.href="${root}/order/orderInfo.html/"+ids+"";  
		  alert(ids);
		  
	  }
		
   }
</script>

</body>
</html>