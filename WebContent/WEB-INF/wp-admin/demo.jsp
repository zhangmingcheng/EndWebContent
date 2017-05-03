<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人博客注册页面</title>
<%String path = request.getContextPath(); %>
<link type="text/css" href="<%=path %>/css/reset.css" rel="stylesheet">
<link type="text/css" href="<%=path %>/css/register.css" rel="stylesheet">
<script src="<%=path %>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery.form.js" type="text/javascript"></script>
<script src="<%=path %>/js/json.parse.js" type="text/javascript"></script>
<script src="<%=path %>/js/blogutil.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$(".btn").click(function(){
				var agreenMent=$("#agreement").attr("data");//值为1代表同意
				var userName= $("#username").val();
				var userPass= $("#password1").val();
				var userPass2=$("#password2").val();
				var userEmail=$("#mail").val();
				var vercode =$("#varcode").val();
				
				userPass=$.trim(userPass);
				userPass2=$.trim(userPass2);
				
				$(".input_div1 span,.input_div2 span,.input_div3 span,.input_div4 span,.input_div6 span,.input_div5 span").html("");
				$(".btn").val('注册中...').attr('disabled','disabled');
				
				if(!isRegisterUserName(userName)){
					$(".input_div1 span").html('<img src="${pageContext.request.contextPath}/images/text_error.png"><font color=red>账户名格式不正确!</font>');
					$("#username").focus();
					$(".btn").val('注册').removeAttr('disabled');
					return false;
				}else if(!isEmail(userEmail)){
					$(".input_div2 span").html('<img src="${pageContext.request.contextPath}/images/text_error.png"><font color=red>邮箱格式不正确!</font>');
					$("#mail").focus();
					$(".btn").val('注册').removeAttr('disabled');
					return false;
				}else if(userPass.length <8){
					$(".input_div3 span").html('<img src="${pageContext.request.contextPath}/images/text_error.png"><font color=red>密码格式不正确!</font>');
					$("#password1").focus();
					$(".btn").val('注册').removeAttr('disabled');
					return false;
				}else if(userPass != userPass2){
					$(".input_div4 span").html('<img src="${pageContext.request.contextPath}/images/text_error.png"><font color=red>两次输入的密码不一致!</font>');
					$("#password2").focus();
					$(".btn").val('注册').removeAttr('disabled');
					return false;
				} else if(vercode ==''){
					$(".input_div5 span").html('<img src="${pageContext.request.contextPath}/images/text_error.png"><font color=red>输入图片验证码</font>').fadeIn();
					$("#varcode").focus();
					$(".btn").val('注册').removeAttr('disabled');
					return false;
				} else if(agreenMent != '1'){
					//$(".agreenment-tips").html('请先同意用户条款!').fadeIn();
					$(".input_div6 span").html('<img src="${pageContext.request.contextPath}/images/v3/text_error.png"><font color=red>请先同意用户条款!</font>');
					$(".btn").val('注册').removeAttr('disabled');
					return false;
				}else{
					$("#registerForm").ajaxSubmit(function(e){
						var obj=json_parse(e);
						var code=obj.code;
						var info = '<img src="themes/images/v3/text_error.png"><font color=red>'+obj.info+"</font>";
						if(code=='-1' || code=='-5'){
							$(".input_div1 span").html(info);
							$("#username").focus();
						}else if(code =='-2' || code == '-4'){
							$(".input_div2 span").html(info);
							$("#password1").focus();
						}else if(code =='-3' || code == '-7'){
							$(".input_div2 span").html(info);
							$("#mail").focus();
						}else if(code == '-8'){
							$(".input_div6 span").html(info);							
							$("#varcode").focus();
						}else if(code == '-99'){
							$(".input_div3 span").html(info);							
							$("#mail").focus();
						}else if(code == '1'){
							//alert('恭喜您，注册成功!');
							//window.location.href='register/success';
							window.location.href=obj.acturl;
						}
						//flushCode();
						$(".change").click();
						$(".btn").val('注册').removeAttr('disabled');
					})
				}
				
		})
	
	$(".change").click(function(){
		$("#imgcode").attr('src','vercode');
	})
	
	$('.check2').click(function(){
		var rel = $('#agreement').attr("data");
		if(rel =='1'){
			$('#agreement').attr("data","0");
		}else{
			$('#agreement').attr("data","1");
		}
		$('.check2').toggleClass("check1");
	});
	
});
</script>
<style>
.input_div span{ background:#FFF;}
</style>
</head>
<body>
	<div class="register_content">
	
		<ul class="step_ul step1 clear">
			<li class="li1">01、填写资料</li>
			<li class="li2">02、完成注册</li>
		</ul>
		
		 <form name="registerForm" id='registerForm' action="/Blog/user/register.action" method="post" style="padding:3% 3% 3% 3%;font-family:Microsoft Yahei">
			<div class="div_form clear ">
				<label>用户名：</label>
				<div class="input_div input_div1">
					<input id="username" name="username" type="text" placeholder="格式6-24位数字字母组合" maxlength="24">
					<span></span>
				</div>
			</div>
			<div class="div_form clear ">
				<label>邮箱：</label>
				<div class="input_div input_div2" >
					<input id="mail" name="useremail"  type="text" placeholder="请填写正确的邮箱" maxlength="64">
					<span></span>
				</div>
			</div>
			<div class="div_form clear ">
				<label>密码：</label>
				<div class="input_div input_div3">
					<input id="password1" name="userpass" type="password" placeholder="最少 8 个字符，区分大小写" maxlength="32">
					<span></span>
				</div>
			</div>
			<div class="div_form clear ">
				<label>确认密码：</label>
				<div class="input_div input_div4">
					<input id="password2" name="userpass2" type="password" placeholder="再次输入密码" maxlength="32">
					<span></span>
				</div>
			</div>
			<div class="div_form clear ">
				<label>输入计算结果：</label>
				<div class="input_div input_div5">
					<input id="varcode" name="vercode" type="text" maxlength="2">
					<a class="change" href="javascript:;">点击换一张</a>
					<span></span>
				</div>
			</div>
			<div class="div_form clear ">
				<label></label>
				<div class="input_div check2 input_div6" data="0" id="agreement">
					我已阅读并接受《JS代码网用户服务协议》
                    <span></span>
				</div>
			</div>
            
			<div class="div_form clear ">
				<label></label>
				<div class="input_div">
					<input id="btn" class="btn" type="button" value="注册" />
				</div>
			</div>
			
		</form>
		
		<div class="reg_login">
			<p>已有帐号？</p>
			<a class="btn2" href="/Blog/user/login.action">登录</a>
		</div>
		<div class="bg"></div>
	</div>
</body>
</html>
