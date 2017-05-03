<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人博客--代码改变世界</title>
<%String path = request.getContextPath(); %>
<link href="<%=path %>/css/blog.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="<%=path %>/js/jquery.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/prototype.js"></script>
<script type="text/javascript">
   function deleteArticle(id){
   	 var url = '/Blog/ajax/deleteArticle.action';
   	//将表单域的值转换成请求参数
   	var param = 'id='+id;
   	//创建一个Ajax.Request对象来发送请求
   	var myAjax = new Ajax.Request(
         	  url,{method: 'post', parameters: param, onComplete: showResponse7, asynchronous: true}    	 
         	); 
   }
   	 //该方法为异步处理响应信息的函数
       function showResponse7(request){
    	   var temp = request.responseText.evalJSON();
    	   var strs =  '<tr style="height:30px">'+
           '<th>标题</th><th>作者</th><th>日期</th><th>编辑</th><th>删除</th>'+
           '</tr>';
           for(var n = 0;n<temp.length;n++){
        	   strs+='<tr style="height:50px"><td><a href="/Blog/text/open?id='+temp[n].id+'">'+temp[n].title+'</a></td><td>'+temp[n].user.name+'</td><td>'+temp[n].postdate+'</td>'+
        	   '<td><a href="/Blog/text/edit?id='+temp[n].id+'"><button type="button" class="btn btn-info">编辑</button></a></td>'+
        	 '<td><button type="button" class="btn btn-success" onclick="deleteArticle('+temp[n].id+')">删除</button></td></tr>';
           }          
         $("deleteArt").innerHTML = strs;
       }
   </script>
</head>
<body>

	<%@ include file="head.jsp"%>
	<div class="container">
		<div class="row">
			<!-- 左半部分 -->
			<div class="col-md-3">
				<div style="height: 260px; margin-top: 10px;">
					<s:if test="%{#session.user.photo==null}">
						<img class="img-circle" title="用户头像"
							style="height: 240px; width: 90%;"
							src="<%=path%>/images/default.jpg">
					</s:if>
					<s:else>
						<!-- 浏览器解析html时，只要发现存在一个img标签，便会向服务器要图片，所以要解决缓存 -->
						<img class="img-circle" title="用户头像"
							style="height: 240px; width: 90%;"
							src="<%=path%>/images/${user.name}/${user.photo}?temp=<%=Math.random()%>">
					</s:else>
				</div>
				<div>
					<table class="table table-hover">
						<tr class="success">
							<th style="width: 80px"><a
								style="margin-left: 20%; margin-buttom: 10px;"
								href="/Blog/wp-admin/userInformation">个人主页</a></th>
						</tr>
						<tr class="success">
							<th><a style="margin-left: 20%; margin-buttom: 10px;"
								href="/Blog/text/articleTypes">写文章</a></th>
						</tr>
						<tr class="success">
							<th><a style="margin-left: 20%; margin-buttom: 10px;"
								href="/Blog/text/allMessages">留言板</a></th>
						</tr>
					</table>
				</div>
			</div>
			<!-- 右半部分 -->
			<div class="col-md-9">

				<table class="table table-hover table-bordered" id="deleteArt">
					<tr style="height: 30px">
						<th>标题</th>
						<th>作者</th>
						<th>日期</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
					<s:iterator value="list" id="selectNum1">
						<tr style="height: 50px">
							<td><a href="/Blog/text/open?id=${selectNum1.getId()}">${selectNum1.getTitle()}</a></td>
							<td>${selectNum1.getUser().getName()}</td>
							<td>${selectNum1.getPostdate()}</td>
							<td><a href="/Blog/text/edit?id=${selectNum1.getId()}"><button
										type="button" class="btn btn-info">编辑</button></a></td>
							<td><button type="button" class="btn btn-success"
									onclick="deleteArticle(${selectNum1.getId()})">删除</button></td>
						</tr>
					</s:iterator>
				</table>
				<nav>
				<ul class="pager">
					<s:if test="currentPage ==1">
						<li><a href="#">Previous</a></li>
					</s:if>
					<s:else>
						<li><a
							href="/Blog/text/articles?currentPage=<s:property value="currentPage-1"/>">Previous</a></li>
					</s:else>
					<s:if test="currentPage !=totalPage">
						<li><a
							href="/Blog/text/articles?currentPage=<s:property value="currentPage+1"/>">Next</a></li>
					</s:if>
					<s:else>
						<li><a href="#">Next</a></li>
					</s:else>
				</ul>
				</nav>

			</div>
		</div>
	</div>

	<footer class="blog-footer">
	<p>
		Blog template built by <a href="https://www.zmcheng.net">@zmcheng</a>.
	</p>
	</footer>
</body>
</html>