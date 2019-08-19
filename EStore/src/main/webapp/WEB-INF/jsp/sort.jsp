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
<div class="container productList">
		<div class="span6">
		<!--jsp标签需要一个结束符，不然会报如下错误
org.apache.jasper.JasperException: 
/WEB-INF/jsp/sort.jsp (line: [21], column: [2]) Expecting "jsp:pa
		  -->
		  <!--引入左边导航栏页面  -->
				<jsp:include page="comm/left.jsp"/>				
		</div>
		<div class="span18 last">
			
			<form id="productForm" action="./image/蔬菜 - Powered By Mango Team.htm" method="get">
				<input type="hidden" id="brandId" name="brandId" value="">
				<input type="hidden" id="promotionId" name="promotionId" value="">
				<input type="hidden" id="orderType" name="orderType" value="">
				<input type="hidden" id="pageNumber" name="pageNumber" value="1">
				<input type="hidden" id="pageSize" name="pageSize" value="20">
					
				<div id="result" class="result table clearfix">
						<ul id="item" named="divPage">
						  
						</ul>
				</div>
	<div class="pagination" id="page">
		<input type="button" id="firstPage" value="首页" onclick="goFirstPage()" >
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
	</div>
			</form>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="${root}/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a >关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a >诚聘英才</a>
						|
					</li>
					<li>
						<a >法律声明</a>
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
						<a  target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a >官网</a>
						|
					</li>
					<li>
						<a >论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright©2005-2015 网上商城 版权所有</div>
	</div>
</div>
<jsp:include page="comm/footer.jsp"/>
<script type="text/javascript" src="${root}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${root}/js/cookie_util.js"></script>
<script type="text/javascript" >
	$(function(){
		$.ajax({
			"url":"${root}/item/data/findItemByCount.do",
			"type":"post",
			"dataType":"json",
			success:function(result){
				var code = result.error_code;
	//			alert(result.error_msg);
				$.each(result.error_msg,function(index,list){
					$("#item").append($("<li><a href='${root}/item/itemInfo.html/"+list.id+"' ><img src='${root}/image/"+list.titleimage+"' width='170' height='170' style='display: inline-block;'> <span style='color:green'> "+list.name+"</span><span class='price'>商城价： ￥"+list.marketprice+"/份</span></a></li>").attr("named","liPage1"))
				})
			}
		})
	});
	//分页操作
	$(function(){
		$.ajax({
			"url":"${root}/item/data/findCount.do",
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
//		alert(pageIndex);
		if(pageIndex==null){
			return false;
		}else{
			$.ajax({
				"url":"${root}/item/data/findCountTZ.do",
				"type":"post",
				"dataType":"json",
				"data":{"pageIndex":pageIndex},
				success:function(result){
					$("li[named=liPage1]").remove();
					$("li[named=liPage]").remove();
					$("div[named=divPage]").remove();
					var code = result.error_code;
					if(code==1){
						$.each(result.error_msg,function(index,list){
							$("#item").append($("<li><a href='${root}/item/itemInfo.html/"+list.id+"'><img src='${root}/image/"+list.titleimage+"' width='170' height='170' style='display: inline-block;'> <span style='color:green'> "+list.name+"</span><span class='price'>商城价： ￥"+list.marketprice+"/份</span></a></li>").attr("named","liPage"))
						})
						$("#theCount").html("当前为第"+result.error_page+"页");	
						$("#pageIndex").val(result.result.error_page);
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
	   $.ajax({
		   "url":"${root}/item/data/findUpPage.do",
			"type":"post",
			"dataType":"json",
			"data":{"pageIndex":pageIndex},
			success:function(result){
				var code = result.error_code;
				//alert(result.error_msg);
				if(code==1){
					$("li[named=liPage1]").remove();
					$("li[named=liPage]").remove();
					$("div[named=divPage]").remove();
					$.each(result.error_msg,function(index,list){
						$("#item").append($("<li><a href='${root}/item/itemInfo.html/"+list.id+"'><img src='${root}/image/"+list.titleimage+"' width='170' height='170' style='display: inline-block;'> <span style='color:green'> "+list.name+"</span><span class='price'>商城价： ￥"+list.marketprice+"/份</span></a></li>").attr("named","liPage"))
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
		   "url":"${root}/item/data/findNextPage.do",
			"type":"post",
			"dataType":"json",
			"data":{"pageIndex":pageIndex},
			success:function(result){
				var code = result.error_code;
				//alert(result.error_page);
				if(code==1){
					$("li[named=liPage1]").remove();
					$("li[named=liPage]").remove();
					$("div[named=divPage]").remove();
					$.each(result.error_msg,function(index,list){
						$("#item").append($("<li><a href='${root}/item/itemInfo.html/"+list.id+"'><img src='${root}/image/"+list.titleimage+"' width='170' height='170' style='display: inline-block;'> <span style='color:green'> "+list.name+"</span><span class='price'>商城价： ￥"+list.marketprice+"/份</span></a></li>").attr("named","liPage"))
					})
					$("#theCount").html("当前为第"+result.error_page+"页");	
					$("#pageIndex").val(result.error_page);
				}	
			}
	   })
	}
</script>


<script type="text/javascript">
//  跳转到首页的功能
   function goFirstPage(){
	   $.ajax({
			"url":"${root}/item/data/findItemByCount.do",
			"type":"post",
			"dataType":"json",
			success:function(result){
				var code = result.error_code;
//				alert(result.error_msg);
				if(code==0){
					$("li[named=liPage1]").remove();
					$("li[named=liPage]").remove();
					$("div[named=divPage]").remove();
					$.each(result.error_msg,function(index,list){
						$("#item").append($("<li><a href='${root}/item/itemInfo.html/"+list.id+"' ><img src='${root}/image/"+list.titleimage+"' width='170' height='170' style='display: inline-block;'> <span style='color:green'> "+list.name+"</span><span class='price'>商城价： ￥"+list.marketprice+"/份</span></a></li>").attr("named","liPage1"))
					})
					$("#pageCount").html("共"+result.error_msg+"页");	
					$("#theCount").html("当前为第"+1+"页");	
					$("#pageIndex").val("1")
				}
			}
		})
   }

</script>
</body>
</html>