
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
<style type="text/css">
div {
	width: 100%;
}
</style>
</head>

<body>
	<%@ include file="head.jsp"%>
	<div class="container">
		<div class="row" style="height: 400px">
			<!-- 左半部分 -->
			<div class="col-md-9">
				<h4 style="color: blue">撰写新文章:</h4>
				<div class="main" style="margin: 20px 0px;">
					<form method="post" action="/Blog/text/write">
						<table class="table">
							<tr>
								<th style="width: 50px">标题：</th>
								<th><input type="text" name="title" id="articleTitle"
									required="required"></th>
							</tr>
							<tr>
								<th>分类：</th>
								<th><select class="title_input" name="types">
										<option value="0">----选择分类----</option>
										<s:iterator value="list" id="selectNum1">
											<option value="${selectNum1.getId()}">${selectNum1.getName()}</option>
										</s:iterator>
								</select></th>
							</tr>
							<tr>
								<th>简述：</th>
								<th><textarea class="form-control" rows="3" name="brief"></textarea></th>
							</tr>
							<tr>
								<th colspan="2"><textarea id="myEditor"
										style="height: 270px; margin: 5px 0px;" name="content"></textarea></th>
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