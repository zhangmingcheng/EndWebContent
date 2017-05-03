
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人博客--代码改变世界</title>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/blog.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=path%>/ueditor/themes/default/css/ueditor.min.css"
	rel="stylesheet" type="text/css" />
<!-- 配置文件 -->
<script src="<%=path%>/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script src="<%=path%>/ueditor/ueditor.all.min.js"></script>
<script charset="utf-8" src="<%=path%>/js/baiduUE/zh-cn.js"></script>
<script src="<%=path %>/js/prototype.js"></script>
<style type="text/css">
div {
	width: 100%;
}
</style>
<script type="text/javascript">
   var current;
   function statusArticleMessage(id,articleId){
		 var url = '/Blog/ajax/statusArticleMessage.action';
		var param = 'id='+id+'&articleId='+articleId;
		var myAjax = new Ajax.Request(
	         	  url,{method: 'post', parameters: param, onComplete: updateArticleStatus, asynchronous: true}    	 
	         	); 
	   }
       function updateArticleStatus(request){
    	   var temp = request.responseText.evalJSON();
    	   var strs =  '<tr style="height:30px">'+
           '<th>标题</th><th>作者</th><th>日期</th><th>审批情况</th><th>删除</th></tr>';
           for(var n = 0;n<temp.length;n++){
        	   strs+='<tr style="height:50px"><td>'+temp[n].sender+'</td><td>'+temp[n].content+'</td><td>'+temp[n].time+'</td>';
        	   strs+='  <td style="width: 100px"><input type="button" class="btn btn-info" onclick="statusArticleMessage(';
        	   strs=strs+temp[n].id+','+temp[n].articleId;
        	   if(temp[n].status==0){     			
        		    strs+=' )" value="未审批，点击按钮进行审批"/></td>';
        	   }
        	   else{
        		   strs+=')" value="已审批"/></td>';
        	   }
        	   strs+='<td><input type="button" class="btn btn-success" onclick="deleteArticleMessage('+temp[n].id+','+temp[n].articleId+')" value="删除"/></td></tr>';
           }          
         $("updateArticleMessageInfo").innerHTML = strs;
       }
       //删除留言
       function deleteArticleMessage(id,articleId){
  		 var url = '/Blog/ajax/deleteArticleMessage.action';
  		var param = 'id='+id+'&articleId='+articleId;
  		var myAjax = new Ajax.Request(
  	         	  url,{method: 'post', parameters: param, onComplete: deleteArticleMessage2, asynchronous: true}    	 
  	         	); 
       }
       function deleteArticleMessage2(request){
    	   var temp = request.responseText.evalJSON();
    	   var strs =  '<tr style="height:30px">'+
           '<th>标题</th><th>作者</th><th>日期</th><th>审批情况</th><th>删除</th></tr>';
           for(var n = 0;n<temp.length;n++){
        	   strs+='<tr style="height:50px"><td>'+temp[n].sender+'</td><td>'+temp[n].content+'</td><td>'+temp[n].time+'</td>';
        	   strs+='  <td style="width: 100px"><input type="button" class="btn btn-info" onclick="statusArticleMessage(';
        	   strs=strs+temp[n].id+','+temp[n].articleId;
        	   if(temp[n].status==0){     			
        		    strs+=' )" value="未审批，点击按钮进行审批"/></td>';
        	   }
        	   else{
        		   strs+=')" value="已审批"/></td>';
        	   }
        	   strs+='<td><input type="button" class="btn btn-success" onclick="deleteArticleMessage('+temp[n].id+','+temp[n].articleId+')" value="删除"/></td></tr>';
           }          
         $("updateArticleMessageInfo").innerHTML = strs;
       }
   </script>
</head>

<body>
	<%@ include file="head.jsp"%>
	<div class="container">
		<div class="row" style="height: 400px">
			<!-- 左半部分 -->
			<div class="col-md-9">
				<h4 style="color: blue">编辑文章:</h4>
				<div class="main" style="margin: 20px 0px;">
					<form method="post" action="/Blog/text/edit2.action">
						<div style="display: none;">
							<input type="text" name="id" value="${id}">
						</div>
						<table class="table">
							<tr>
								<th style="width: 50px">标题：</th>
								<th><input type="text" name="title" id="articleTitle"
									value="${title}" required="required"></th>
							</tr>
							<tr>
								<th>分类：</th>
								<th><select class="title_input" name="types">
										<s:if test="%{types==0}">
											<option value="0">----选择分类----</option>
										</s:if>
										<s:else>
											<option value="${types}">${typesValue}</option>
										</s:else>
										<s:iterator value="list2" id="selectNum1">
											<option value="${selectNum1.getId()}">${selectNum1.getName()}</option>
										</s:iterator>
								</select></th>
							</tr>
							<tr>
								<th>简述：</th>
								<th><textarea class="form-control" rows="3" name="brief"
										id="brief">${brief}</textarea></th>
							</tr>
							<tr>
								<th colspan="2"><textarea id="myEditor"
										style="height: 270px; margin: 5px 0px;" name="content"
										id="editArticle">${content }</textarea></th>
							</tr>
							<tr>
								<th><input type="submit" value="提交" type="button"
									class="btn btn-primary"></th>
								<th><input type="reset" value="重置" type="button"
									class="btn btn-primary" onclick="setContentNull()"></th>
							</tr>
						</table>
					</form>
				</div>
				<script type="text/javascript">
					var editor = new baidu.editor.ui.Editor();
					editor.render("myEditor");
				</script>
				<!-- 编辑文章留言-->
				<table class="table table-hover table-bordered"
					id="updateArticleMessageInfo">
					<tr style="height: 30px">
						<th>发送者</th>
						<th>内容</th>
						<th>日期</th>
						<th>审批情况</th>
						<th>删除</th>
					</tr>
					<s:iterator value="list" id="selectNum1">
						<tr style="height: 50px">
							<td>${selectNum1.getSender()}</td>
							<td>${selectNum1.getContent()}</td>
							<td>${selectNum1.getTime()}</td>
							<s:if test="#selectNum1.getStatus()==0">
								<td style="width: 100px"><input type="button"
									class="btn btn-info"
									onclick="statusArticleMessage(${selectNum1.getId()},${selectNum1.getArticleId()})"
									value="未审批，点击按钮进行审批" /></td>
							</s:if>
							<s:else>
								<td style="width: 100px"><button type="button"
										class="btn btn-info">已审批</button></td>
							</s:else>
							<td><input type="button" class="btn btn-success"
								onclick="deleteArticleMessage(${selectNum1.getId()},${selectNum1.getArticleId()})"
								value="删除" /></td>
						</tr>
					</s:iterator>
				</table>
				<!-- 编辑文章留言 -->
			</div>
			<!-- 右半部分 -->
			<div class="col-md-3" style="background-color: green; height: 600px">
				sssss</div>
		</div>
	</div>

	<footer class="blog-footer">
	<p>
		Blog template built by <a href="https://www.zmcheng.net">@zmcheng</a>.
	</p>
	</footer>
</body>
</html>