<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0"/>
<title>个人博客登陆页面</title>
<link type="text/css" href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquerysession.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
<h1 id="loginregistry">用户登陆</h1>
<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch">
            <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7" onclick="login()">快速登录</a>
			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8" onclick="registry()">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>    
  
    <!--登录开始-->
    <div class="web_qr_login" id="web_qr_login" style="display: block;height:270px;">    
            <div class="web_login" id="web_login">
               <div class="login-box">
               <form action="/Blog/user/login.action" method="post">
			      <div class="login_form">			      
			          <div id="quickLogin" class="cue">		        
			           <s:if test="%{#request.usererror==null}">
					               快速登录请注意输入格式
					   </s:if>
					   <s:else>
						 <font color='red'><b> <s:property value="#request.usererror" /></b></font>		
					   </s:else>	           
			          </div>
                      <div class="uinArea" id="uinArea">
                        <label class="input-tips" for="user">账号：</label>
                        <div class="inputOuter" id="uArea">                 
                              <input type="text" id="username" name="name" class="inputstyle" required="required" value="${username}"/>
                        </div>
                      </div>
                      <div class="pwdArea" id="pwdArea">
                          <label class="input-tips" for="password">密码：</label> 
                          <div class="inputOuter" id="pArea">
                               <input type="password" id="password" name="password" class="inputstyle" required="required" value="${password}"/>
                         </div>
                      </div>                        
                      <div style="padding-left:50px;margin-top:20px;"><input id="login" type="submit" value="登 录" style="width:150px;" class="button_blue"/></div>                          
                  </div>   
                 </form>      
            	</div> 
            </div>    
     </div>
     <!--登录结束-->

     <!--注册开始-->
     <div class="qlogin" id="qlogin" style="display: none; ">
        <div class="web_login">
         <form name="regUser" id="regUser" accept-charset="utf-8"  action="/Blog/user/register" method="post">
	        <input type="hidden" name="to" value="reg"/>
		    <input type="hidden" name="did" value="0"/>
            <ul class="reg_form" id="reg-ul">       		
                 <li><div id="userCue" class="cue">
                  <s:if test="%{#request.registryerror==null}">
					               快速注册请注意输入格式                
					   </s:if>
					   <s:else>
						 <font color='red'><b> <s:property value="#request.registryerror" /></b></font>		
					   </s:else>	    
                 </div></li>
                  <li>            	
                    <label for="user"  class="input-tips2" >账号：</label>
                    <div class="inputOuter2">
                        <input type="text" id="user"  name="name" maxlength="16" class="inputstyle2" required="required" value="${username}"/>
                    </div> 
                  </li>               
                  <li>
                     <label for="passwd" class="input-tips2">密码：</label>
                     <div class="inputOuter2">
                        <input type="password" id="passwd"  name="password" maxlength="16" class="inputstyle2" required="required" value="${password}"/>
                     </div>                  
                  </li>
                  <li>
                      <label for="passwd2" class="input-tips2">确认密码：</label>
                      <div class="inputOuter2">
                        <input type="password" id="passwd2" name="passwordAgain" maxlength="16" class="inputstyle2" required="required" value="${passwordAgain}"/>
                      </div>        
                  </li>   
                  <li>
                       <label for="identifycode" class="input-tips2">验证码：</label>
                       <div class="inputOuter2">
                         <input type="text" id="identifycode" name="identifycode" class="inputstyle2" maxlength="50" style="width:105px;" required="required"/>&nbsp;
                         <img src="/Blog/user/identifycode.action" onclick="this.src='/Blog/user/identifycode.action?'+ Math.random()" title="点击图片刷新验证码"/><br> 
                       </div>      
                  </li>             
                  <li>
                      <div class="inputArea">
                        <input type="submit" id="reg"  style="margin-top:10px;margin-left:80px;width:150px;" class="button_blue" value="注册" onClick="registryIndentify();">                  
                      </div>      
                  </li>
             </ul>
           </form>
       </div>
    </div>
    <!--注册结束-->
</div>
<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</body>
<script type="text/javascript">
    var registryerror = '${requestScope.registryerror}'; 
    if(registryerror!=''){
    	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});
    	$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
    }
</script>
</html>