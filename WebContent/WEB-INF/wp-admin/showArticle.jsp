
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
<script src="<%=path %>/js/prototype.js"></script>
<script src="<%=path %>/js/UpdateUserAjax.js"></script>
<script src="<%=path %>/js/showArticleMessage.js"></script>
</head>

<body>
	<%! int flag=0;%>
	<%!int temp=0;%>
	<%flag=0;%>
	<%@ include file="head.jsp"%>
	<div class="container">
		<div class="row">
			<!-- 左半部分 -->
			<div class="col-md-9">
				<div style="height: 40px; width: 100%; text-align: center;">
					<h3>${title}</h3>
					<h5>${user.getName()}&nbsp;&nbsp;
						<s:if test="%{types!=0}">
 							分类:${typesValue}&nbsp;&nbsp;
 					</s:if>
						阅读（${readNum}）&nbsp;&nbsp;${postdate}
					</h5>
				</div>
				<HR size=2>
				<!-- 一条线 -->
				<div>${content}</div>
				<div style="background-color: #F0F0F0; text-align: center;">
					未经允许不得转载</div>
				<button id="ZAN" style="margin-top: 20px; margin-left: 45%"
					type="button" class="btn btn-info glyphicon glyphicon-thumbs-up"
					onClick="UpdateZan(${id});">&nbsp;赞(${zanNum})</button>
				<HR size=2>
				<div>
					<h4>评论：</h4>
					<form method="post" name="ADDArticleReply" id="ADDArticleReply">
						<div style="display: none;">
							<input type="text" name="articleId" value="${id}">
						</div>
						<table style="width: 100%">
							<tr>
								<th><textarea placeholder="说点什么吧,必填..."
										class="form-control" rows="3" name="content"></textarea></th>
							</tr>
							<tr>
								<th><br /></th>
							</tr>
							<tr>
								<th>用户名：<input type="text" placeholder="必填" name="sender"></th>
							</tr>
							<tr>
								<th><br /></th>
							</tr>
							<tr>
								<th><input type="button" value="提交" class="btn btn-primary"
									onClick="AddArticleReply();" /></th>
							</tr>
						</table>
					</form>
				</div>
				<!-- 留言内容区域 -->
				<div id="ALLArticleMessage">
					<s:iterator value="list" id="selectNum1">
						<!-- 留言默认头像 -->
						<div style="float: none">
							<div style="float: left; width: 60px">
								<img class="img-circle" title="用户头像"
									style="height: 50px; width: 50px;"
									src="<%=path%>/images/default.jpg">
							</div>
							<!-- 留言内容区 -->
							<div style="margin-left: 10%">
								<h5 style="font-size: 18px; color: blue">
									${selectNum1.getSender()}：</h5>
								<!-- -->

								<%temp=0; %>
								<s:iterator value="#selectNum1.getMessages()" id="selectNum2">
									<div>
										<div style="background-color: #F0F0F0">
											<h5 style="font-size: 15px">
												&nbsp;&nbsp;<%=++temp %>楼:&nbsp;&nbsp;&nbsp;<span
													style="color: #272727">${selectNum2.getSender()}：</span>
												&nbsp;&nbsp;<span style="font-size: 12px">${selectNum2.getContent()}&nbsp;&nbsp;&nbsp;${selectNum2.getTime()}
													&nbsp;&nbsp;<a href="#"
													onclick="showPopup('pop<%=++flag%>');">回复</a> <s:if
														test="#selectNum2.getStatus()==0">
	                                  &nbsp;&nbsp;未审核
	                                  </s:if>
												</span>
											</h5>
										</div>
										<!-- 弹框 -->
										<div id="pop<%=flag%>" style="display: none">
											<form method="post" id="message<%=++flag%>"
												name="message<%=flag%>">
												<table style="width: 100%">
													<tr>
														<th><textarea placeholder="说点什么吧,必填..."
																class="form-control" rows="2" name="content"></textarea></th>
													</tr>
													<tr>
														<th><br /></th>
													</tr>
													<tr>
														<th>用户名：<input type="text" placeholder="必填"
															name="sender"></th>
													</tr>
													<tr>
														<th><div style="display: none;">
																<input type="text" name="replyId"
																	value="${selectNum1.getReplyId()}">
															</div></th>
													</tr>
													<tr>
														<th><br /></th>
													</tr>
													<tr>
														<th><input type="button" value="提交"
															class="btn btn-primary"
															onClick="AddArticleMessage(${selectNum1.getArticleId()},<%=flag%>)" /></th>
													</tr>
												</table>
											</form>
										</div>
									</div>
									<!--  -->
								</s:iterator>
								<!-- -->
								<h5 style="font-size: 13px">
									&nbsp;&nbsp;${selectNum1.getContent()}</h5>
								<h5 style="font-size: 12px">
									${selectNum1.getTime()}&nbsp;&nbsp;<a href="#"
										onclick="showPopup('pop<%=++flag %>');">回复</a>
									<s:if test="#selectNum1.getStatus()==0">
	                                  &nbsp;&nbsp;未审核
	                                  </s:if>
								</h5>
							</div>
						</div>

						<div id="pop<%=flag %>" style="display: none">
							<form method="post" id="message<%=++flag%>"
								name="message<%=flag%>">
								<table style="width: 100%">
									<tr>
										<th><textarea placeholder="说点什么吧,必填..."
												class="form-control" rows="2" name="content"></textarea></th>
									</tr>
									<tr>
										<th><br /></th>
									</tr>
									<tr>
										<th>用户名：<input type="text" placeholder="必填" name="sender"></th>
									</tr>
									<tr>
										<th><br /></th>
									</tr>
									<s:if test="#selectNum1.replyId==null">
										<tr>
											<th><div style="display: none;">
													<input type="text" name="replyId"
														value="${selectNum1.getId()}">
												</div></th>
										</tr>
										<tr>
											<th><input type="button" value="提交"
												class="btn btn-primary"
												onClick="AddArticleMessage(${selectNum1.getArticleId()},<%=flag%>)" /></th>
										</tr>
									</s:if>
									<s:else>
										<tr>
											<th><div style="display: none;">
													<input type="text" name="replyId"
														value="${selectNum1.getReplyId()}">
												</div></th>
										</tr>
										<tr>
											<th><input type="button" value="提交"
												class="btn btn-primary"
												onClick="AddArticleMessage(${selectNum1.getArticleId()},<%=flag%>)" /></th>
										</tr>
									</s:else>
								</table>
							</form>
						</div>

						<hr color="black">
					</s:iterator>
				</div>
				<!-- 留言内容区域 -->
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