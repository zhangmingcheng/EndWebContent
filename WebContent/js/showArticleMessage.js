  function showPopup(IdNum){ 
		    var popUp = document.getElementById(IdNum); 
		    popUp.style.display="block";
		} 
		  function AddArticleReply(){
		       	var url ='/Blog/ajax/addArticleReplys.action';
		       	var param = Form.serialize('ADDArticleReply');       
		       	var myAjax = new Ajax.Request(
		             	  url,{method: 'post', parameters: param, onComplete:  AddArticleReplyResponse, asynchronous: true}    	 
		             	); 
		       }     
		      function  AddArticleReplyResponse(request){
		    	  var str='';
		    	var temp  = request.responseText.evalJSON();     
		    	 var Temp = 0;
		    	 for(var i=0;i<temp.length;i++){
		    		   str+='<div style="float: none"><div style="float:left;width:60px"><img class="img-circle" title="用户头像" style="height: 50px; width: 50px;" src="../images/default.jpg"></div> ';
		    		   str+='<div style="margin-left:10%"><h5 style="font-size: 18px;color:blue">'+temp[i].sender+'：</h5>';
		    		   var temp2 = temp[i].messages;
		    		   var Flag = 0;
		    		  for(var j=0;j<temp2.length;j++){
		    			  str+='<div><div style="background-color: #F0F0F0"><h5 style="font-size: 15px">&nbsp;&nbsp;'+(++Flag)+'楼:&nbsp;&nbsp;&nbsp;<span style="color:#272727">';
		    			  str+=temp2[j].sender;
		    			  str+='：</span> &nbsp;&nbsp;<span style="font-size: 12px">'
		    			  str+=temp2[j].content;
		    			  str+='&nbsp;&nbsp;&nbsp;';
		    			  str+=temp2[j].time;
		    			  str+=' &nbsp;&nbsp;<a href="#" onclick="showPopup('+(++Temp)+');" >回复</a>';
		    			  if(temp2[j].status==0){
		    				  str+='&nbsp;&nbsp;未审核'
		    			  }
		    			  str+='</span></h5></div><div id="'+Temp+'" style="display: none">';
		    			  str+=' <form method="post"  id="message'+(++Temp)+'"  name="message'+Temp+'">';
		    			  str+=' <table style="width:100%"><tr><th><textarea  placeholder="说点什么吧,必填..." class="form-control" rows="2" name="content"></textarea></th></tr>';
		    			  str+='<tr><th><br/></th></tr> <tr><th>用户名：<input type="text" placeholder="必填" name="sender"></th></tr><tr><th><div style="display: none;">';
		    			  str+='<input  type="text"  name="replyId" value="'+temp[i].replyId+'"></div></th></tr><tr><th><br/></th></tr>';
		    			  str+='<tr><th><input type="button" value="提交" class="btn btn-primary" onClick="AddArticleMessage('+temp[i].articleId+','+Temp+')"/></th></tr>';
		    			  str+='</table></form></div></div>';      
		    		  }
		    		  str+='<h5 style="font-size: 13px"> &nbsp;&nbsp;'+temp[i].content+'</h5>';
		    		  str+=' <h5 style="font-size: 12px">'+temp[i].time+'&nbsp;&nbsp;<a href="#" onclick="showPopup('+(++Temp)+');" >回复</a>';
		    		  if(temp[i].status==0){
		    			  str+='  &nbsp;&nbsp;未审核';
		    		  }
		    		  str+='</h5></div></div>';
		    		  str+='<div id="'+Temp+'" style="display: none">';
		    		  str+=' <form method="post"  id="message'+(++Temp)+'"  name="message'+Temp+'">';
					  str+=' <table style="width:100%"><tr><th><textarea  placeholder="说点什么吧,必填..." class="form-control" rows="2" name="content"></textarea></th></tr>';
					  str+='<tr><th><br/></th></tr> <tr><th>用户名：<input type="text" placeholder="必填" name="sender"></th></tr><tr><th><br/></th></tr>';
					  if(temp[i].replyId==null){
						str+='<tr><th><div style="display: none;"><input  type="text"  name="replyId" value="'+temp[i].id+'"></div></th></tr>';                            
		                str+='<tr><th><input type="button" value="提交" class="btn btn-primary" onClick="AddArticleMessage('+temp[i].articleId+','+Temp+')"/></th></tr>';
					  }
					  else{
						    str+='<tr><th><div style="display: none;"><input  type="text"  name="replyId" value="'+temp[i].replyId+'"></div></th></tr>';                            
			                str+='<tr><th><input type="button" value="提交" class="btn btn-primary" onClick="AddArticleMessage('+temp[i].articleId+','+Temp+')"/></th></tr>';
					  }
		              str+='</table> </form></div><hr color="black">';           
		       }
		    	  $("ALLArticleMessage").innerHTML=str;
		       }
function AddArticleMessage(ArticleId,Flag){
    	
    	 	var url ='/Blog/ajax/addArticleReplys.action';
    		var param = Form.serialize('message'+Flag);
    		param+='&articleId='+ArticleId;
    		var myAjax = new Ajax.Request(
    				url,{method: 'post', parameters: param, onComplete:  AddArticleReplyResponse2, asynchronous: true}    	 
               	); 
      }
function  AddArticleReplyResponse2(request){
    	  var Temp = 0;
    	  var temp  = request.responseText.evalJSON();     
    	  var str='';
    	  for(var i=0;i<temp.length;i++){
    		   str+='<div style="float: none"><div style="float:left;width:60px"><img class="img-circle" title="用户头像" style="height: 50px; width: 50px;" src="../images/default.jpg"></div> ';
    		   str+='<div style="margin-left:10%"><h5 style="font-size: 18px;color:blue">'+temp[i].sender+'：</h5>';
    		   var temp2 = temp[i].messages;
    		   var Flag = 0;
    		  for(var j=0;j<temp2.length;j++){
    			  str+='<div><div style="background-color: #F0F0F0"><h5 style="font-size: 15px">&nbsp;&nbsp;'+(++Flag)+'楼:&nbsp;&nbsp;&nbsp;<span style="color:#272727">';
    			  str+=temp2[j].sender;
    			  str+='：</span> &nbsp;&nbsp;<span style="font-size: 12px">'
    			  str+=temp2[j].content;
    			  str+='&nbsp;&nbsp;&nbsp;';
    			  str+=temp2[j].time;
    			  str+=' &nbsp;&nbsp;<a href="#" onclick="showPopup('+(++Temp)+');" >回复</a>';
    			  if(temp2[j].status==0){
    				  str+='&nbsp;&nbsp;未审核'
    			  }
    			  str+='</span></h5></div><div id="'+Temp+'" style="display: none">';
    			  str+=' <form method="post"  id="message'+(++Temp)+'"  name="message'+Temp+'">';
    			  str+=' <table style="width:100%"><tr><th><textarea  placeholder="说点什么吧,必填..." class="form-control" rows="2" name="content"></textarea></th></tr>';
    			  str+='<tr><th><br/></th></tr> <tr><th>用户名：<input type="text" placeholder="必填" name="sender"></th></tr><tr><th><div style="display: none;">';
    			  str+='<input  type="text"  name="replyId" value="'+temp[i].replyId+'"></div></th></tr><tr><th><br/></th></tr>';
    			  str+='<tr><th><input type="button" value="提交" class="btn btn-primary" onClick="AddArticleMessage('+temp[i].articleId+','+Temp+')"/></th></tr>';
    			  str+='</table></form></div></div>';      
    		  }
    		  str+='<h5 style="font-size: 13px"> &nbsp;&nbsp;'+temp[i].content+'</h5>';
    		  str+=' <h5 style="font-size: 12px">'+temp[i].time+'&nbsp;&nbsp;<a href="#" onclick="showPopup('+(++Temp)+');" >回复</a>';
    		  if(temp[i].status==0){
    			  str+='  &nbsp;&nbsp;未审核';
    		  }
    		  str+='</h5></div></div>';
    		  str+='<div id="'+Temp+'" style="display: none">';
    		  str+=' <form method="post"  id="message'+(++Temp)+'"  name="message'+Temp+'">';
			  str+=' <table style="width:100%"><tr><th><textarea  placeholder="说点什么吧,必填..." class="form-control" rows="2" name="content"></textarea></th></tr>';
			  str+='<tr><th><br/></th></tr> <tr><th>用户名：<input type="text" placeholder="必填" name="sender"></th></tr><tr><th><br/></th></tr>';
			  if(temp[i].replyId==null){
				str+='<tr><th><div style="display: none;"><input  type="text"  name="replyId" value="'+temp[i].id+'"></div></th></tr>';                            
                str+='<tr><th><input type="button" value="提交" class="btn btn-primary" onClick="AddArticleMessage('+temp[i].articleId+','+Temp+')"/></th></tr>';
			  }
			  else{
				    str+='<tr><th><div style="display: none;"><input  type="text"  name="replyId" value="'+temp[i].replyId+'"></div></th></tr>';                            
	                str+='<tr><th><input type="button" value="提交" class="btn btn-primary" onClick="AddArticleMessage('+temp[i].articleId+','+Temp+')"/></th></tr>';
			  }
              str+='</table> </form></div><hr color="black">';           
       }
    	  $("ALLArticleMessage").innerHTML=str;
      }
                                      