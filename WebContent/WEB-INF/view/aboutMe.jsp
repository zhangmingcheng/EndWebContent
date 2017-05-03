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
			<div class="col-md-11"
				style="margin-left: 3%; background-color: #FFFFFF">
				<div style="margin-top: 20px">
					<h3>about blog|关于博客</h3>
					<div style="background-color: #EEE8AA">一些关于博客的信息</div>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;博客从开发到上线前后用了大概二十天的时间。做这个博客的原因一方面是要锻炼一下自己所学的知识，查缺补漏；
						另外，也是最重要的把平时遇到的技术难点或者生活感悟记录下来，并且分享给大家，编程是需要互相交流学习的，我认为只有多分享多沟通，自己的技术才能更上一层楼。
						本博客系统是一个多用户的团体博客系统，采用的是Java语言,SSH框架(struts2+hibernate4+Spring4)框架，MySQL数据库，如果大家发现系统有什么Bug,请于博主联系，万分感谢!
					</p>
				</div>

				<div style="margin-top: 20px">
					<h3>about me|关于我</h3>
					<div style="background-color: #EEE8AA">这时博主本人的资料</div>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前我是山东理工大学的一名大三学生，软件工程专业，英语过四级，参加过ACM亚洲区域赛(西安赛区)，目前打算在大三学期结束前找到
						一份实习工作，求各位大神介绍工作啊，本人热爱运动，富有集体荣誉感，喜欢结交朋友（有共同爱好者）。另外本人喜欢户外，对爬山涉水情有独钟。
						2016五月于淄博</p>
				</div>

				<div style="margin-top: 20px">
					<h3>technical ability|技术能力</h3>
					<div style="background-color: #EEE8AA">博主的技术栈</div>

					<h5>喜欢算法，熟练运用所学算法</h5>
					<h5>熟练使用Java语言开发Web项目</h5>
					<h5>掌握SSH框架</h5>
					<h5>熟练掌握EL、OGNL、正则表达式</h5>
					<h5>熟练掌握HTML5、CSS、JavaScript</h5>
					<h5>了解ajax工作原理及实现方法</h5>
					<h5>熟悉MySQL数据库</h5>
					<h5>熟练掌握github</h5>
					<h5>最重要的一点：喜欢接收新事物，有一定的自学能力</h5>

				</div>
				<div>
					<h3>联系方式：</h3>
					<table class="table table-hover">
						<tr class="warning">
							<th>QQ: 1249736987</th>
						</tr>
						<tr class="danger">
							<th>邮箱：zmc@zmcheng.net</th>
						</tr>
						<tr class="info">
							<th>微信：1249736988</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<br />
	<div class="blog-footer" style="height: 50px; text-align: center;">
		Blog template built by <a href="https://www.zmcheng.net">@zmcheng</a>.
	</div>

</body>
</html>