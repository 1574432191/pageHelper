<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统</title>
<link type="text/css" rel="stylesheet" href="${root}/css/style.css" />
<link href="${root}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${root}/css/product.css" rel="stylesheet" type="text/css"/>
<link href="${root}/css/cart.css" rel="stylesheet" type="text/css"/>
<%-- <script type="text/javascript" src="${root}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${root}/js/menu.js"></script> --%>
</head>
<body>
<div class="top"></div>
<div id="header">
	<div class="logo">***后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="">张山</a></li>
			<li><a href="">修改密码</a></li>
			<li><a href="">设置</a></li>
			<li><a href="">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
	  
				<ul id="nav_dot">
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li><img src="${root}/image/home.png"></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">系统公告</a></li>
								<li>></li>
								<li><a href="#">最新公告</a></li>
								<li>></li>
								<li><a href="">下架商品列表</a></li>
							
						</ul>
			</div>
			<div class="main">
	<div class="container cart">
		<div class="span24">
			<div class="step step1">
				<table id="table" style="text-align: center;">
					<tbody><tr>
						<th>图片</th>
						<th>商品名称</th>
						<th>市场价</th>
						<th>商城价</th>
						<th>数量</th>
						<th>生成日期</th>
						<th>保质期</th>
						<th>商品上架</th>
					</tr>
					
				</tbody></table>
				<div class="pagination" id="page">
		<input type="button" id="upPage" value="上一页"  onclick="goUpPage()">
		<input type="button" id="nextPage" value="下一页" onclick="goNextPage()" >
		<input type="text" id="pageIndex" value="">
		<input type="button" id="but" value="跳转" onclick="tiaoZhuan()">
		<span id="pageCount"></span>
		<span id="theCount"></span>
			</div>
		</div>
		
</div>
<!-- <div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  来源:<a href="http://h2design.taobao.com/" target="_blank">氢设计</a></p></div>
 <script>navList(12);</script>  -->
<script type="text/javascript" src="${root}/js/cookie_util.js"></script>
<script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>

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
	$.ajax({
		"url":"${root}/admin/toIndex.do",
		"type":"post",
		"dataType":"json",
		success:function(result){
			var code = result.error_code;
			//alert(result.error_msg);
			if(code==1){
				$.each(result.error_msg,function(index,lim){
					//alert(lim.url);
					 $("#nav_dot").append($("<dl></dl>").html($("<div><h2 style='text-align:center;'><a href='"+lim.url+"'>"+lim.info+"</a><h2></div>")))
				})
				
			}
		}
	})
})
</script>
<script type="text/javascript">

//显示第一页商品
	$(function(){
		
		$.ajax({
			"url":"${root}/item/data/findItemByStatus.do",
			"type":"post",
			"dataType":"JSON",
			
			success:function(result){
				var code = result.error_code;
				var good = result.error_msg ;
				
				if(code==0){
					$.each(good,function(index,item){
						var dateStr=new Date(item.production_date);
						var dateStr1=new Date(item.expiry_date);
					//	alert("循环遍历"+cartList.id);
						$("<tr></tr>").attr("id",item.id).attr("named","liPage").
			    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+item.titleimage+"'>")).
			    		 append($("<td width='100'></td>").html($("<a href='${root}/item/itemInfo.html/"+item.id+"' id='deleteCartId'>"+item.name+"</a>"))).
			    		 append($("<td width='50'></td>").html(item.marketprice)).
			    		 append($("<td width='50'></td>").html(item.estoreprice)).
			    		 append($("<td width='50'></td>").html(item.num)).
			    		 append($("<td width='50' id='price'></td>").html(dateStr.format("yyyy-MM-dd hh:mm:ss"))).
			    		 append($("<td width='50'></td>").html(dateStr.format("yyyy-MM-dd hh:mm:ss"))).
			    		 append($("<td width='50'></td>").html($("<a href='javascript:void(0)' onclick='upItem("+item.id+")'>上架该商品商品</a>")))
			    		.appendTo("#table")
			    		
					})
					
					
				}
				
			}
		});
	})
</script> 

<script type="text/javascript">

//分页操作
//分页操作
	$(function(){
		$.ajax({
			"url":"${root}/item/data/findCountByStatus.do",
			"type":"post",
			"dataType":"json",
			success:function(result){
				var code = result.error_code;
//				alert(result.error_msg);
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
		
	//	alert(pageIndex);
		if(pageIndex==null){
			return false;
		}else{
			$.ajax({
				"url":"${root}/item/data/findCountTZ1.do",
				"type":"post",
				"dataType":"json",
				"data":{"pageIndex":pageIndex},
				success:function(result){
					$("tr[named=liPage]").remove();
					var code = result.error_code;
					var item = result.error_msg ;
					if(code==1){
						$.each(item,function(index,item){
							var dateStr=new Date(item.production_date);
							var dateStr1=new Date(item.expiry_date);
							//	alert("循环遍历"+cartList.id);
								$("<tr></tr>").attr("id",item.id).attr("named","liPage").
					    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+item.titleimage+"'>")).
					    		 append($("<td width='100'></td>").html($("<a href='${root}/item/itemInfo.html/"+item.id+"' id='deleteCartId'>"+item.name+"</a>"))).
					    		 append($("<td width='50'></td>").html(item.marketprice)).
					    		 append($("<td width='50'></td>").html(item.estoreprice)).
					    		 append($("<td width='50'></td>").html(item.num)).
					    		 append($("<td width='50' id='price'></td>").html(dateStr.format("yyyy-MM-dd hh:mm:ss"))).
					    		 append($("<td width='50'></td>").html(dateStr.format("yyyy-MM-dd hh:mm:ss"))).
					    		 append($("<td width='50'></td>").html($("<a href='javascript:void(0)' onclick='upItem("+item.id+")'>上架该商品商品</a>")))
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
<script>
 // 上一页功能
	function goUpPage(){
	   var pageIndex =$("#pageIndex").val();
	   $.ajax({
		   "url":"${root}/item/data/upPage2.do",
			"type":"post",
			"dataType":"json",
			"data":{"pageIndex":pageIndex},
			success:function(result){
				var code = result.error_code;
				//alert(result.error_msg);
				var cartList = result.error_msg ;
				if(code==1){
					var good = result.error_msg ;
					$("tr[named=liPage]").remove();
					$.each(good,function(index,item){
						var dateStr=new Date(item.production_date);
						var dateStr1=new Date(item.expiry_date);
						//	alert("循环遍历"+cartList.id);
							$("<tr></tr>").attr("id",item.id).attr("named","liPage").
				    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+item.titleimage+"'>")).
				    		 append($("<td width='100'></td>").html($("<a href='${root}/item/itemInfo.html/"+item.id+"' id='deleteCartId'>"+item.name+"</a>"))).
				    		 append($("<td width='50'></td>").html(item.marketprice)).
				    		 append($("<td width='50'></td>").html(item.estoreprice)).
				    		 append($("<td width='50'></td>").html(item.num)).
				    		 append($("<td width='50' id='price'></td>").html(dateStr.format("yyyy-MM-dd hh:mm:ss"))).
				    		 append($("<td width='50'></td>").html(dateStr.format("yyyy-MM-dd hh:mm:ss"))).
				    		 append($("<td width='50'></td>").html($("<a href='javascript:void(0)' onclick='upItem("+item.id+")'>上架该商品商品</a>")))
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
		  
	   $.ajax({
		   "url":"${root}/item/data/downPage2.do",
			"type":"post",
			"dataType":"json",
			"data":{"pageIndex":pageIndex},
			success:function(result){
				var code = result.error_code;
//				alert(result.error_msg);
			
				if(code==1){
					var good = result.error_msg ;
					$("tr[named=liPage]").remove();
					$.each(good,function(index,item){
						//	alert("循环遍历"+cartList.id);
						var dateStr=new Date(item.production_date);
						var dateStr1=new Date(item.expiry_date);
							$("<tr></tr>").attr("id",item.id).attr("named","liPage").
				    		 append($("<td width='60'></td>").html("<img src='${root}/image/"+item.titleimage+"'>")).
				    		 append($("<td width='100'></td>").html($("<a href='${root}/item/itemInfo.html/"+item.id+"' id='deleteCartId'>"+item.name+"</a>"))).
				    		 append($("<td width='50'></td>").html(item.marketprice)).
				    		 append($("<td width='50'></td>").html(item.estoreprice)).
				    		 append($("<td width='50'></td>").html(item.num)).
				    		 append($("<td width='50' id='price'></td>").html(dateStr.format("yyyy-MM-dd hh:mm:ss"))).
				    		 append($("<td width='50'></td>").html(dateStr.format("yyyy-MM-dd hh:mm:ss"))).
				    		 append($("<td width='50'></td>").html($("<a href='javascript:void(0)' onclick='upItem("+item.id+")'>上架该商品商品</a>")))
				    		.appendTo("#table")
				    		
						})
					$("#theCount").html("当前为第"+result.error_page+"页");	
					$("#pageIndex").val(result.error_page);
				}	
			}
	   })
	}
</script>
<script>
   function deleteItem(id){
		$.ajax({
			"url":"${root}/item/data/updateStatus.do",
			"type":"post",
			"dataType":"json",
			"data":{"id":id},
			success:function(result){
				location.href="${root}/admin/good.do";
			}
		})
    }

</script>
<script>
   function upItem(id){
		$.ajax({
			"url":"${root}/item/data/upItemStatus.do",
			"type":"post",
			"dataType":"json",
			"data":{"id":id},
			success:function(result){
				location.href="${root}/item/downgood.do";
			}
		})
    }

</script>





</body>
</html>