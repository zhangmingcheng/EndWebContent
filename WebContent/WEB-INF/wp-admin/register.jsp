<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%String path = request.getContextPath(); %>
<link href="<%=path %>/css/styles/clicki.web.css?V=20120501"
	media="screen" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/styles/clicki.loginandreg.css?V=20120501"
	media="screen" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/styles/clicki.webkitanimation.css?V=20120501"
	media="screen" rel="stylesheet" type="text/css" />
<title>注册--代码改变世界</title>
</head>
<style type="text/css">
.theCenterBox {
	width: 670px;
	margin-top: 200px;
}
</style>
<body>

	<div class="theCenterBox" style="">
		<div class="theLoginBox" style="width: 657px">
			<div class="loginTxt">免费注册---代码改变世界</div>
			<form id="leftForm" action="/Blog/user/register.action" method="post">
				<div class="theLoginArea" id="loginBox">
					<p style="position: relative;">
						<label for="LoginForm_email">用户名：</label> <input
							placeholder="请输入您的用户名" required="required" name="name"
							type="text" maxlength="255" /> <span>请输入您的用户名</span>
					</p>
					<p style="position: relative;">
						<label for="LoginForm_password">密码设置：</label> <input
							placeholder="请输入您的密码" required="required" name="password"
							type="password" maxlength="16" /> <span>请输入您的密码</span>
					</p>
					<p style="position: relative;">
						<label for="LoginForm_password">验证密码：</label> <input
							placeholder="请再次输入您的密码" required="required" name="passwordAgain"
							type="password" maxlength="16" /> <span>请输入您的密码</span>
					</p>

					<div class="loginSubmitBnt">
						<div class="reg_submit">
							<input class="theSubmitButton" value="" type="submit" />
							<s:property value="#request.usererror" />
						</div>
					</div>
				</div>
				<div class="theRegArea fixRegHeight" id="reg_reg">
					<h2>已经有账号？</h2>
					<br /> <a class="reg_login" href="/Blog/wp-admin/login"></a>
				</div>
			</form>
		</div>

	</div>
</body>
</html>