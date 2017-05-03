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
</head>
<body style="background-color: #E0E0E0">
	<%@ include file="head.jsp"%>

	<div class="container">
		<div class="row">
			<h3>标签：${flagName}</h3>
			<div class="col-md-11" style="margin-left: 3%">

				<s:iterator value="list3" id="selectNum1">
					<div style="background-color: #FFFFFF; magin-top: 10px">
						<div style="margin-left: 5%; padding-bottom: 2%">
							<h5>&nbsp;</h5>
							<h4 style="font-weight: bold; color: 004B97">
								<a href="/Blog/text/open?id=${selectNum1.getId()}">${selectNum1.getTitle()}</a>
							</h4>
							<h5 style="color: #6C6C6C">${selectNum1.getUser().getName()}&nbsp;发布于&nbsp;${selectNum1.getPostdate()}&nbsp;&nbsp;阅读(${selectNum1.getReadNum()})&nbsp;&nbsp;
								评论(${ selectNum1.getMessageNum()})&nbsp;&nbsp;</h5>
							<p>${selectNum1.getBrief() }</p>
							<h5 style="font-weight: bold;">
								<a href="/Blog/head/open?id=${selectNum1.getId()}">【查看详情】</a>
							</h5>
						</div>
					</div>
				</s:iterator>
			</div>
		</div>
	</div>
	<br />
	<div class="blog-footer" style="height: 50px; text-align: center;">
		Blog template built by <a href="https://www.zmcheng.net">@zmcheng</a>.
	</div>

</body>
</html>