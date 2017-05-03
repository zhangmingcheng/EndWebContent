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
				style="margin-left: 3%; background-color: #FFFFFF; margin-top: 10px">
				<h3>搜集了一些常用的技术网站</h3>
				<h5>Tips:会不断持续更新，大家有什么好的网站下面没有的，也可互相联系</h5>
				<table cellpadding="5px" cellspacing="5px" width="90%"
					class="table table-hover">
					<tr class="success">
						<td width="50%"><a target="_blank"
							href="http://www.csdn.net/">CSDN</a><span>CSDN，全球最大中文IT社区。</span></td>
						<td width="50%"><a target="_blank"
							href="http://www.w3school.com.cn/">W3School在线教程</a><span>W3School，领先的Web技术教程，免费、全面。</span></td>
					</tr>
					<tr class="warning">
						<td><a target="_blank" href="http://www.oschina.net/">开源中国</a><span>中国最大的开源技术社区。</span></td>
						<td><a target="_blank" href="http://www.51cto.com/">51CTO</a><span>中国领先的IT技术网站。</span></td>
					</tr>
					<tr class="danger">
						<td><a target="_blank" href="http://www.itpub.net/">ITPUB</a><span>中国领先的IT互动平台。</span></td>
						<td><a target="_blank" href="http://www.cnblogs.com/">博客园</a><span>一个面向开发者的知识分享社区。</span></td>
					</tr>
					<tr class="info">
						<td><a target="_blank" href="http://bbs.bccn.net/">编程论坛</a><span>中国最大的编程社区。</span></td>
						<td><a target="_blank" href="http://www.iteye.com/">ITeye</a><span>程序员交流社区。</span></td>
					</tr>
					<tr class="success">
						<td><a target="_blank" href="http://www.chinaitlab.com/">中国it实验室</a><span>中国最早最大的IT专家门户。</span></td>
						<td><a target="_blank" href="http://www.w3cfuns.com/">前端网</a><span>中国第一Web前端开发综合性网站。</span></td>
					</tr>
					<tr class="warning">
						<td><a target="_blank" href="http://www.bootcss.com/">Bootstrap中文网</a><span>提供了简洁、直观、强悍的前端开发框架。</span></td>
						<td><a target="_blank" href="http://jquery.com/">jQuery</a><span>jQuery官网</span></td>
					</tr>
					<tr class="danger">
						<td><a target="_blank" href="http://www.runoob.com/">菜鸟教程</a><span>提供了最全的编程技术基础教程</span></td>
						<td><a target="_blank" href="http://cn.jarfire.org/">jarfire</a><span>提供数千个jar包、上万个jar文件的下载。</span></td>
					</tr>
				</table>
			</div>
			<div class="sidebar block col-md-11"
				style="margin-left: 3%; background-color: #FFFFFF; margin-top: 10px">
				<h3>友情链接</h3>
				<p style="font-size: 13px; color: red; font-weight: normal;">Tips:若网站内容不符合国家规定或者与收录时的网站内容不符，将会撤销友链</p>
				<div style="font: none">
					<div style="float: left; width: 50%">
						<table class="table table-hover">
							<s:iterator value="list" id="selectNum" status='st'>
								<s:if test="#st.Odd">
									<tr class="info">
										<th><a href="${selectNum.getUrl()}" target="_blank">${selectNum.getName()}</a></th>
									</tr>
								</s:if>
							</s:iterator>
						</table>
					</div>
					<div style="float: right; width: 50%">
						<table class="table table-hover">
							<s:iterator value="list" id="selectNum" status='st'>
								<s:if test="#st.Even">
									<tr class="success">
										<th><a href="${selectNum.getUrl()}" target="_blank">${selectNum.getName()}</a></th>
									</tr>
								</s:if>
							</s:iterator>
						</table>
					</div>
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