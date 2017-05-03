<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*"%>
<%@ page import="net.zmcheng.model.*"%>
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
<style type="text/css">
</style>
<script src="<%=path %>/js/jquery.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/prototype.js"></script>
<script type="text/javascript">
   function showPopup(IdNum){ 
       var popUp = document.getElementById(IdNum); 
       popUp.style.display="block";
   } 
   function showPopup2(IdNum){ 
	   var popUp = document.getElementById(IdNum); 
	   popUp.style.display="block";
	 } 
   </script>
<body style="background-color: #E0E0E0">
</head>
<body>
	<%! int flag=0;%>
	<%flag=0;%>
	<%@ include file="head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-7"
				style="margin-left: 3%; background-color: #FFFFFF; margin-top: 10px">
				<div>
					<h3 style="text-align: center;">留言板</h3>
					<form method="post" name="message"
						action="/Blog/head/addMessage.action">
						<table style="width: 100%">
							<tr>
								<th><textarea placeholder="说点什么吧..." class="form-control"
										rows="3" name="content"></textarea></th>
							</tr>
							<tr>
								<th><br /></th>
							</tr>
							<tr>
								<th>用户名：<input type="text" placeholder="必填" name="sender"
									required="required"></th>
							</tr>
							<tr>
								<th><br /></th>
							</tr>
							<tr>
								<th><input type="submit" class="btn btn-success" value="提交"></th>
							</tr>
						</table>
						<h5 style="color: red">${result}</h5>
					</form>
				</div>
				<h5>共${allRow}条评论</h5>
				<hr color="black">
				<h5 style="color: red">${replyResult}</h5>
				<div id="AllMessage">
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
								<%! int temp=0;%>
								<%temp=0; %>
								<s:iterator value="#selectNum1.getMessages()" id="selectNum2">
									<div>
										<div style="background-color: #F0F0F0">
											<h5 style="font-size: 15px">
												&nbsp;&nbsp;<%=++temp %>楼:&nbsp;&nbsp;&nbsp;<span
													style="color: #272727">${selectNum2.getSender()}：</span>
												&nbsp;&nbsp;<span style="font-size: 12px">${selectNum2.getContent()}&nbsp;&nbsp;&nbsp;${selectNum2.getTime()}
													&nbsp;&nbsp;<a href="#"
													onclick="showPopup2('pop2<%=++flag %>');">回复</a> <s:if
														test="#selectNum2.getStatus()==0">
	                                  &nbsp;&nbsp;未审核
	                                  </s:if>
												</span>
											</h5>
										</div>
										<!-- 弹框 -->
										<div id="pop2<%=flag%>" style="display: none">
											<form method="post" id="message2<%=++flag%>"
												action=" /Blog/head/addReplyMessage.action">
												<table style="width: 100%">
													<tr>
														<th><textarea placeholder="说点什么吧..."
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
																<input type="text" name="messageId"
																	value="${selectNum1.getReplyId()}">
															</div></th>
													</tr>
													<tr>
														<th><br /></th>
													</tr>
													<tr>
														<th><input type="submit" class="btn btn-success"
															value="回复"></th>
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
								action=" /Blog/head/addReplyMessage.action">
								<table style="width: 100%">
									<tr>
										<th><textarea placeholder="说点什么吧..." class="form-control"
												rows="2" name="content"></textarea></th>
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
													<input type="text" name="messageId"
														value="${selectNum1.getId()}">
												</div></th>
										</tr>
										<tr>
											<th><input type="submit" class="btn btn-success"
												value="回复"></th>
										</tr>
									</s:if>
									<s:else>
										<tr>
											<th><div style="display: none;">
													<input type="text" name="messageId"
														value="${selectNum1.getReplyId()}">
												</div></th>
										</tr>
										<tr>
											<th><input type="submit" class="btn btn-success"
												value="回复"></th>
										</tr>
									</s:else>
								</table>
							</form>
						</div>

						<hr color="black">
					</s:iterator>
				</div>
				<nav>
				<ul class="pager">
					<s:if test="currentPage ==1">
						<li><a href="#">Previous</a></li>
					</s:if>
					<s:else>
						<li><a
							href="/Blog/head/messages?currentPage=<s:property value="currentPage-1"/>">Previous</a></li>
					</s:else>
					<s:if test="currentPage !=totalPage">
						<li><a
							href="/Blog/head/messages?currentPage=<s:property value="currentPage+1"/>">Next</a></li>
					</s:if>
					<s:else>
						<li><a href="#">Next</a></li>
					</s:else>
				</ul>
				</nav>

			</div>
			<div>
				<!-- 第一部分 -->
				<div class="col-md-4"
					style="margin-left: 5%; background-color: #FFFFFF; margin-top: 10px">
					<div
						style="text-align: left; font-weight: bold; font-size: 17px; padding-top: 5px;">
						关于博客
						<hr>
					</div>
					<div
						style="font-weight: bold; font-size: 15px; text-align: center; padding-bottom: 5px">张明成的个人博客</div>
					<div style="margin-left: 1%; margin-right: 1%">
						<p>
							本博客是多用户团体博客，用于记录团体的生活、学习和工作中遇到的一些问题和心得。
							当然，目前此博客只有我在使用，欢迎志趣相投的人加入我的团体，一起使用我的博客系统，我可以告诉您进入后台的地址，
							另外，本博客中所有内容均为原创，如需转载，请注明出处（<a href="http://www.zmcheng.net">http://www.zmcheng.net</a>）。
							本人不是大神，但是现在正在向着大神努力，如果您发现博客中有错误或者可以改进的地方，敬请指正！
						</p>
					</div>
					<div>
						<hr>
					</div>
					<div
						style="margin-left: 1%; text-align: left; font-weight: bold; font-size: 15px; padding-top: 5px;">
						联系方式：<br />
						<br />
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
				<!---->
				<div class="col-md-4"
					style="margin-left: 5%; background-color: #FFFFFF; margin-top: 15px">
					<div
						style="text-align: left; font-weight: bold; font-size: 17px; padding-top: 5px;">
						站内搜索
						<hr>
					</div>
					<div style="margin-left: 5%">
						<form method="post" action="/Blog/head/keySearch">
							<table>
								<tr>
									<th><input type="text" name="keyWord" style="height: 30px"
										required="required" />&nbsp;&nbsp;
										<button type="submit" class="btn btn-info"
											style="height: 30px; width: 100px">搜索</button></th>
								</tr>
							</table>
						</form>
						<br />
					</div>
				</div>
				<!--  -->

			</div>
		</div>
	</div>
	<br />
	<div class="blog-footer" style="height: 40px">
		Blog template built by <a href="https://www.zmcheng.net">@zmcheng</a>.
	</div>

</body>
</html>
