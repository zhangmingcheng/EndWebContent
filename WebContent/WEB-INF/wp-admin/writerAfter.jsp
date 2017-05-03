
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
</head>
<body>
	<%@ include file="head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<table class="table table-hover table-bordered">
					<tr>
						<th>
							<h4 style="padding-left: 15%">操作</h4>
						</th>
					</tr>
					<tr>
						<th>
							<h4>
								<a href="/Blog/wp-admin/writeArticle">» 添加新随笔</a>
							</h4>
						</th>
					</tr>
				</table>
			</div>
			<div class="col-md-10"
				style="height: 250px; background-color: #F0F0F0">
				<table class="table table-hover table-bordered">
					<tr>
						<th style="height: 50px; background-color: #FFFFFF; width: 100%"
							class="glyphicon glyphicon-ok">发布成功</th>
					</tr>
					<tr>
						<th class="info">随笔标题:<s:property value="title" /></th>
					</tr>
					<tr>
						<th class="info"><a href="/Blog/text/open?id=${articleId}">»
								立即查看</a></th>
					</tr>
					<tr>
						<th class="info"><a href="/Blog/text/edit?id=${articleId}">»
								立即编辑</a></th>
					</tr>
					<tr>
						<th class="info">» 后台首页</th>
					</tr>
					<tr>
						<th class="info">»博客首页</th>
					</tr>
				</table>
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