<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="blog-masthead">
	<div class="container">
		<div class="col-md-10">
			<ul class="nav nav-pills">
				<li><a class="blog-nav-item active"
					href="/Blog/wp-admin/userInformation">个人主页</a></li>
				<li><a class="blog-nav-item" href="/Blog/text/articles">文章管理</a></li>
				<li><a class="blog-nav-item" href="/Blog/text/articleTypes">写文章</a></li>
				<li><a class="blog-nav-item" href="/Blog/text/allLink">友情链接</a></li>
				<li><a class="blog-nav-item" href="/Blog/text/allType">文章分类</a></li>
				<li><a class="blog-nav-item" href="/Blog/text/allMessages"">留言管理</a></li>
			</ul>
		</div>
		<div class="col-md-1">
			<h4>
				<s:property value="#session.user.getName()" />
			</h4>
		</div>
		<div class="col-md-1">
			<a class="blog-nav-item" href="/Blog/user/quit.action">退出</a>
		</div>

	</div>
</div>