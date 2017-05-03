
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人博客：个人主页页面</title>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/blog.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="<%=path %>/js/jquery.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/prototype.js"></script>
<script src="<%=path %>/js/UpdateUserAjax.js"></script>
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
								href="/Blog/wp-admin/uploadPhoto">更改我的头像</a></th>
						</tr>
					</table>
				</div>

			</div>
			<!-- 中间 -->
			<div class="col-md-6" style="margin-top:1%">
				<div>
					<h4>
						用户名:
						<s:property value="#session.user.getName()" />
					</h4>
				</div>
				<div style="height: 450px">
					<form id="form1" name="form1" method="post" action="">
						<table class="table table-hover">
							<tr>
								<th style="width: 80px"><h5>新 密  码:</h5></th>
								<th style="width: 100px"><input type="password"
									name="password" id="password" /></th>
								<th><input type="button" value="修改" class="btn btn-primary"
									onClick="UpdatePsw();" />
								<th>
							</tr>
							<tr>
								<th><h5>确定密码:</h5></th>
								<th><input type="password" name="passwordAgain"
									id="passwordAgain" /></th>
								<th><label id="response" style="color: blue"> </label></th>
							</tr>
						</table>
					</form>
					<form id="form2" name="form2" method="post" action="">
						<table class="table table-hover">
							<tr>
								<th style="width: 80px"><h5>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</h5></th>
								<th style="width: 100px"><input type="text" name="email"
									id="email" value="${user.getEmail() }" /></th>
								<th><s:if test="%{#session.user.getEmail()==null}">
										<input type="button" value="设置" class="btn btn-primary"
											onClick="UpdateEmail();" />
									</s:if> <s:else>
										<input type="button" value="修改" class="btn btn-primary"
											onClick="UpdateEmail();" />
									</s:else>
								<th>
								<th><label id="response2" style="color: blue"> </label></th>
							</tr>
						</table>
					</form>
					<form id="form3" name="form3" method="post" action="">
						<table class="table table-hover">
							<tr>
								<th style="width: 80px"><h5>手机号码:</h5></th>
								<th style="width: 100px"><input type="text" name="phone"
									id="phone" value="${user.getPhone() }" /></th>
								<th><s:if test="%{#session.user.getPhone()==null}">
										<input type="button" value="设置" class="btn btn-primary"
											onClick="UpdatePhone();" />
									</s:if> <s:else>
										<input type="button" value="修改" class="btn btn-primary"
											onClick="UpdatePhone();" />
									</s:else>
								<th>
								<th><label id="response3" style="color: blue"> </label></th>
							</tr>
						</table>
					</form>
					<table class="table table-hover">
						<tr>
							<th style="width: 80px"><h5>现居住地:</h5></th>
							<th style="width: 120px"><select class="form-control"
								id="select1" name="select1" onChange="UpdatePro()">
									<s:if test="%{#session.user.getProvince()==null}">
										<option>-&nbsp;-&nbsp;省&nbsp;-&nbsp;-</option>
									</s:if>
									<s:else>
										<option><h5>
												<s:property value="#session.user.getProvince().getName()" />
											</h5>
										</option>
									</s:else>
									<s:iterator value="#session.province" id="selectNum1">
										<option value='${selectNum1.getId() }'>
											${selectNum1.getName() }</option>
									</s:iterator>
							</select></th>
							<th style="width: 10px"><h5>-</h5></th>
							<th style="width: 120px"><select id="select2" name="select2"
								class="form-control">
									<s:if test="%{#session.user.getProvince()==null}">
										<option>-&nbsp;-&nbsp;市&nbsp;-&nbsp;-</option>
									</s:if>
									<s:else>
										<option><h5>
												<s:property value="#session.user.getCity().getName()" />
											</h5>
										</option>
									</s:else>
							</select></th>

							<th><s:if test="%{#session.user.getProvince()==null}">
									<input type="button" value="设置" class="btn btn-primary"
										onClick="UpdateHome();" />
									<th><label id="Responce3" style="color: blue"> </label></th>
								</s:if> <s:else>
									<input style="width: 60px" type="button" value="修改"
										class="btn btn-primary" onClick="UpdateHome();" />
									<th><label id="Responce3" style="color: blue"> </label></th>
								</s:else></th>
						</tr>
					</table>
					<table class="table table-hover">
						<tr>
							<th style="width: 80px"><h5>注册时间:</h5></th>
							<th><h5>${user.getCreatetime() }</h5></th>
						</tr>
					</table>
				</div>
				<!--
                      <div style="height: 300px">
                           <h4>留言板</h4>
                            
                      </div>
                        -->
			</div>
			<!-- 右边 -->
			<div class="col-md-3"></div>
		</div>
	</div>
	<footer class="blog-footer">
	<p>
		Copyright © 2017 Powered by @zmcheng
	</p>
	</footer>
</body>
</html>


