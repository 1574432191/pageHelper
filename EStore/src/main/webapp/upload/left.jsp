<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<link href="${root }/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${root }/css/product.css" rel="stylesheet" type="text/css"/>
<div id="productCategory" class="hotProductCategory">
	
</div>

<script type="text/javascript" src="${root }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
   $(function(){
	   $.ajax({
		   "url":"${root}/category/data/getlist.do",
		   "dataType":"json",
		   "type":"post",
		   "success":function(result){
			   var error_code = result.error_code;
			   
			   if(error_code==0){
				   /*
				   $.each(a,function(index,value){}):这句话的意思是循环遍历a,其中a可以是数组，json等
				   function(index,value)中的index是下标，value是值。可以是数组，可以再次循环遍历
				   */
				   $.each(result.error_msg,function(index,category){
					   // <dl>标签为列表标签，<dt><dd>标签在使用时必需要用dl标签包裹，dt和dd属于同级标签
					  /*  <dl>
					   			<dt>列表标题</dt>
					   			<dt>列表内容</dt>
					   	  <dl>
					   */ 
					   $("#productCategory").append($("<dl></dl>").attr("class","last").attr("id",category.id).append($("<dt></dt>").html("<a href=''>"+category.type+"</a>")));
				   
				     $.each(category.lists,function(index,zi){
				    	 $("#"+category.id+"").append($("<dd></dd>").html("<a href=''>"+zi.type+"</a>"));
				     });
				   });
				  
			   }
		   }
	   });
   })
</script>