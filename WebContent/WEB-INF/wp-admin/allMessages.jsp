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
<script src="<%=path %>/js/jquery.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/prototype.js"></script>
<script type="text/javascript">
   var current;
   function statusMessage(id,currentPage){
	    current=currentPage;
		 var url = '/Blog/ajax/statusMessage.action';
		var param = 'id='+id+'&currentPage='+currentPage;
		var myAjax = new Ajax.Request(
	         	  url,{method: 'post', parameters: param, onComplete: updateStatus, asynchronous: true}    	 
	         	); 
	   }
       function updateStatus(request){
    	   var temp = request.responseText.evalJSON();
    	   var strs =  '<tr style="height:30px">'+
           '<th>标题</th><th>作者</th><th>日期</th><th>审批情况</th><th>删除</th></tr>';
           for(var n = 0;n<temp.length;n++){
        	   strs+='<tr style="height:50px"><td>'+temp[n].sender+'</td><td>'+temp[n].content+'</td><td>'+temp[n].time+'</td>';
        	   strs+='<td style="width: 100px"><button type="button" class="btn btn-info" onclick="statusMessage(';
        	   strs=strs+temp[n].id+','+current;
        	   if(temp[n].status==0){     			
        		    strs+=')">未审批，点击按钮进行审批</button></td>';
        	   }
        	   else{
        		   strs+=')">已审批</button></td>';
        	   }
        	strs+= '<td><button type="button" class="btn btn-success" onclick="deleteMessage('+temp[n].id+')">删除</button></td></tr>';
           }          
         $("updateMessageInfo").innerHTML = strs;
       }
       //删除留言
       function deleteMessage(id){
  		 var url = '/Blog/ajax/deleteMessage.action';
  		var param = 'id='+id;
  		var myAjax = new Ajax.Request(
  	         	  url,{method: 'post', parameters: param, onComplete: deleteMessage2, asynchronous: true}    	 
  	         	); 
       }
       function deleteMessage2(request){
    	   var temp = request.responseText.evalJSON();
    	   var strs =  '<tr style="height:30px">'+
           '<th>标题</th><th>作者</th><th>日期</th><th>审批情况</th><th>删除</th></tr>';
           for(var n = 0;n<temp.length;n++){
        	   strs+='<tr style="height:50px"><td>'+temp[n].sender+'</td><td>'+temp[n].content+'</td><td>'+temp[n].time+'</td>';
        	   strs+='<td style="width: 100px"><button type="button" class="btn btn-info" onclick="statusMessage(';
        	   strs=strs+temp[n].id;
        	   if(temp[n].status==0){     			
        		    strs+=')">未审批，点击按钮进行审批</button></td>';
        	   }
        	   else{
        		   strs+=')">已审批</button></td>';
        	   }
        	strs+= '<td><button type="button" class="btn btn-success" onclick="deleteMessage('+temp[n].id+')">删除</button></td></tr>';
           }          
         $("updateMessageInfo").innerHTML = strs;
       }
   </script>
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
								href="/Blog/wp-admin/userInformation">个人主页</a></th>
						</tr>
						<tr class="success">
							<th><a style="margin-left: 20%; margin-buttom: 10px;"
								href="/Blog/text/articleTypes">写文章</a></th>
						</tr>
						<tr class="success">
							<th><a style="margin-left: 20%; margin-buttom: 10px;"
								href="/Blog/wp-admin/allMessages">留言板</a></th>
						</tr>
					</table>
				</div>
			</div>
			<!-- 右半部分 -->
			<div class="col-md-9">

				<table class="table table-hover table-bordered"
					id="updateMessageInfo">
					<tr style="height: 30px">
						<th>发送者</th>
						<th>内容</th>
						<th>日期</th>
						<th>审批情况</th>
						<th>删除</th>
					</tr>
					<s:iterator value="list" id="selectNum1">
						<tr style="height: 50px">
							<td>${selectNum1.getSender()}</td>
							<td>${selectNum1.getContent()}</td>
							<td>${selectNum1.getTime()}</td>
							<s:if test="#selectNum1.getStatus()==0">
								<td style="width: 100px"><button type="button"
										class="btn btn-info"
										onclick="statusMessage(${selectNum1.getId()},'<s:property value="currentPage"/>')">未审批，点击按钮进行审批</button></td>
							</s:if>
							<s:else>
								<td style="width: 100px"><button type="button"
										class="btn btn-info">已审批</button></td>
							</s:else>
							<td><button type="button" class="btn btn-success"
									onclick="deleteMessage(${selectNum1.getId()})">删除</button></td>
						</tr>
					</s:iterator>
				</table>
				<nav>
				<ul class="pager">
					<s:if test="currentPage ==1">
						<li><a href="#">Previous</a></li>
					</s:if>
					<s:else>
						<li><a
							href="/Blog/text/allMessages?currentPage=<s:property value="currentPage-1"/>">Previous</a></li>
					</s:else>
					<s:if test="currentPage !=totalPage">
						<li><a
							href="/Blog/text/allMessages?currentPage=<s:property value="currentPage+1"/>">Next</a></li>
					</s:if>
					<s:else>
						<li><a href="#">Next</a></li>
					</s:else>
				</ul>
				</nav>

			</div>
		</div>
	</div>

	<footer class="blog-footer">
	<p>
		Blog template built by <a href="https://www.zmcheng.net">@zmcheng</a>.
	</p>
	</footer>
</body>
</html>