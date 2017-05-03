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
<body>
	<%@ include file="head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div style="height: 280px; margin-top: 10px;">
					<s:if test="%{#session.user.photo==null}">
						<img class="img-circle" title="用户头像"
							style="height: 280px; width: 100%;"
							src="<%=path%>/images/default.jpg">
					</s:if>
					<s:else>
						<!-- 浏览器解析html时，只要发现存在一个img标签，便会向服务器要图片，所以要解决缓存 -->
						<img class="img-circle" title="用户头像"
							style="height: 280px; width: 100%;"
							src="<%=path%>/images/${user.name}/${user.photo}?temp=<%=Math.random()%>">
					</s:else>
				</div>
				<div style="text-align: center; color: blue;">
					<h3>当前头像</h3>
				</div>
			</div>
			<div class="col-md-9">
				<form action="/Blog/user/uploadphotoaction" method="post"
					enctype="multipart/form-data">
					<table class="table table-bordered table-hover">
						<tr>
							<td class="active"><div
									style="text-align: center; color: blue;">
									<h3>上传头像</h3>
								</div></td>
						</tr>
						<tr style="height: 50px">
							<td class="active"><input type="file" name="upload" /></td>
						</tr>
						<tr style="height: 50px">
							<th class="active"><font>支持 JPG、JPEG、GIF、BMP 和
									PNG文件格式，最大4M。 头像高度超出宽度1.5倍的部分会被切除。</font></th>
						</tr>
						<tr style="height: 50px">
							<th class="active"><input type="submit" value="上传头像"
								class="sub" style="margin-bottom: 1%" /></th>
						</tr>
					</table>
				</form>
				<div style="color: red">
					<s:property value="result" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
