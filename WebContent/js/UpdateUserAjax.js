         function addHosts(){
            	var url = '/Blog/ajax/addHosts.action';
            	var param = Form.serialize('form20');
            	var myAjax = new Ajax.Request(
                    	  url,{method: 'post', parameters: param, onComplete: showResponse20, asynchronous: true} ); 
            }
         function showResponse20(request){
       	  $("response20").innerHTML = request.responseText.evalJSON();
       }
        function UpdatePsw(){
        	var url = '/Blog/ajax/updatePsw.action';
        	//将表单域的值转换成请求参数
        	var param = Form.serialize('form1');
        	//创建一个Ajax.Request对象来发送请求
        	var myAjax = new Ajax.Request(
              	  url,{method: 'post', parameters: param, onComplete: showResponse, asynchronous: true}    	 
              	); 
        }
        	 //该方法为异步处理响应信息的函数
            function showResponse(request){
            	  //将返回的JSON格式信息显示在页面上
            	  $("response").innerHTML = request.responseText.evalJSON();
            }
            function UpdateEmail(){
            	var url = '/Blog/ajax/updateEmail.action';
            	var param = Form.serialize('form2');
            	var myAjax = new Ajax.Request(
                    	  url,{method: 'post', parameters: param, onComplete: showResponse2, asynchronous: true} ); 
            }
            function showResponse2(request){
            	  $("response2").innerHTML = request.responseText.evalJSON();
            }
        function UpdatePhone(){
        	var url = '/Blog/ajax/updatePhone.action';
        	var param = Form.serialize('form3');
        	var myAjax = new Ajax.Request(
                	  url,{method: 'post', parameters: param, onComplete: showResponse3, asynchronous: true} ); 
        }
        function showResponse3(request){
      	  $("response3").innerHTML = request.responseText.evalJSON();
      }
        function UpdatePro(){
   	      var myselect=document.getElementById("select1");
	      var index=myselect.selectedIndex ; //拿到选中项的索引,selectedIndex代表的是你所选中项的index
	      var Id = myselect.options[index].value;//拿到选中项options的value	
         var url = '/Blog/ajax/getCitys.action';
         var param = 'ProId='+Id;
        var myAjax = new Ajax.Request(
         	  url,{method: 'post', parameters: param, onComplete: showResponse4, asynchronous: true}    	 
         	); 
   }
     function showResponse4(request){
       var temp = request.responseText.evalJSON();
       var strs='<option>-&nbsp;-&nbsp;市&nbsp;-&nbsp;-</option>';
       for(var n=0;n<temp.length;n++){  
    	 strs+= '<option value='+temp[n].id+'>'+temp[n].name+'</option>';	
       }
       $("select2").innerHTML = strs;
     }  
     function UpdateHome(){
    	var myselect=document.getElementById("select2");
    	var index=myselect.selectedIndex ; //拿到选中项的索引,selectedIndex代表的是你所选中项的index
    	var Id =myselect.options[index].value;
    	 var url = '/Blog/ajax/updateHome.action';
         var param = 'CityId='+Id;
         var myAjax = new Ajax.Request(
             	  url,{method: 'post', parameters: param, onComplete: showResponse5, asynchronous: true}    	 
             	); 
       }
         function showResponse5(request){
           var temp = request.responseText.evalJSON();
           $("Responce3").innerHTML =temp;      
         }  
       //得到赞数
         function UpdateZan(num){
         	 var url = '/Blog/ajax/zanCount.action';
              var param = 'id='+num;
              var myAjax = new Ajax.Request(
                  	  url,{method: 'post', parameters: param, onComplete: showResponse6, asynchronous: true}    	 
                  	); 
            }
              function showResponse6(request){
                $("ZAN").innerHTML ='赞（'+request.responseText.evalJSON()+'）';
              }  
           
