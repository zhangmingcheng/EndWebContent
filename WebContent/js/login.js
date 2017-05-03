$(function(){
	
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');
		
		});
	$('#switch_login').click(function(){
		
		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});
		
		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
		});
	if(getParam("a")=='0')
	{
		$('#switch_login').trigger('click');
	}

	});
	
function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');
	
}

function login() {
	 document.getElementById("loginregistry").innerHTML = "用户登录";
	 document.getElementById("quickLogin").innerHTML = "快速登录请注意输入格式"; 
}

function registry() {
     document.getElementById("loginregistry").innerHTML = "用户注册";
    //document.getElementById("userCue").innerHTML = "快速注册请注意输入格式"; 
}

//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) { 
    var params = location.search.substr(1); // 获取参数 平且去掉？ 
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        //只有一个参数的情况 
        return params.split('=')[1]; 
    } 
    else { 
         //多个参数参数的情况 
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  
function registryIndentify(){
	if (!/^[A-Za-z0-9]+$/.test($('#user').val())) {
		$('#user').focus().css({
			border: "1px solid red",
			boxShadow: "0 0 2px red"
		});
		$('#userCue').html("<font color='red'><b>×用户名只能为数字或字母</b></font>");
		return false;
	}
	else {
		$('#user').css({
		  border: "1px solid #D7D7D7",
		   boxShadow: "none"
		 });
	}

   if ($('#user').val().length < 5 || $('#user').val().length > 16) {
		$('#user').focus().css({
			border: "1px solid red",
			boxShadow: "0 0 2px red"
		});
		$('#userCue').html("<font color='red'><b>×用户名长度为5-16字符</b></font>");
			return false;
		} else {
			$('#user').css({
			border: "1px solid #D7D7D7",
			boxShadow: "none"
		});
	 }

	if ($('#passwd').val().length <5 || $('#passwd').val().length > 12 ) {
		$('#passwd').focus();
		$('#passwd').focus().css({
			border: "1px solid red",
			boxShadow: "0 0 2px red"
		});
		$('#userCue').html("<font color='red'><b>×密码不能为空，且要求长度为5-12位</b></font>");
			return false;
		} else {
			$('#passwd').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
		}
		 
		 var reg=/^[A-Za-z0-9]+$/;  //验证密码 只能数字 或 字母
		if(!reg.test($('#passwd').val())) {
			  
			$('#passwd').focus();
			$('#passwd').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×密码只能为数字和字母</b></font>");
			return false;
		}else {
			$('#passwd').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
		}
		if ($('#passwd2').val() != $('#passwd').val()) {
			$('#passwd2').focus();
			$('#passwd2').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
			return false;
		}else {
			$('#passwd2').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
		}
		if ($('#identifycode').val().length < 4 || $('#identifycode').val().length >4 ){
			$('#identifycode').focus();
			$('#identifycode').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×您输入的验证码有误！</b></font>");
			return false;
		}else {
			$('#identifycode').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
		}
}

