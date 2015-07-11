<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="/enterprise/css/regist.css" />
<link rel="stylesheet" type="text/css" href="/enterprise/css/style.css" />
<script type="text/javascript" src="/enterprise/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="/enterprise/js/easyform.js"></script>
<script type="text/javascript">
	$(function(){
		$("input[name='account']").change(function(){
			var account = $("#account").val();
			url="/enterprise/web/checkAccount/"+account ;
			$.post(url,{},function(data){
			   if(data == "-1"){
				   $("#account").val("");
				   alert("该账户存在");
				  
			   }
			});
		});
	});
</script>
</head>
<body>

<div id="banner2"> <img src="/enterprise/images/tzzgx-banner_02.jpg" width="1440" height="214" /> </div>
<div style="background:#fff;">
<div id="main2">
  <div class="tittle"></div>
 <div class="tittle2">用户注册/ <b>User</b></div>
  <div class="left">
    <div class="left-nav">
      <ul>
       <li><a href='#' class='red'>用户注册</a></li>  
      </ul>
    </div>
    <div class="phone-bj">
      <div class="phone">
        <h2>联系我们 <b>Contact  Us</b></h2>
        <div class="phone-cn">
          <p>传真：0576-12345678</p>
          <p>电话：0576-12345678</p>
          <p>邮箱：web@xxxxxx.com</p>
          <p>地址:四川省自贡市自流井区</p>
        </div>
      </div>
    </div>
  </div>
 <div class="right"><div class="weizhi">您现在的位置：<a href="#">用户注册</a> &gt; <a href="#">管理员登录登录</a></div>
    <div class="invesy-login">
      <div class="login">注册信息</div>
       <div class="form-div">
    <form id="reg-form" action="/enterprise/web/regist" method="post">

        <table>
            <tr>
                <td>账户</td>
                <td><input name="account" type="text" id="account" easyform="length:11;char-normal;real-time;" message="账号为11位手机号" easytip="disappear:lost-focus;theme:blue;" ajax-message="用户名已存在!">
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input name="password" type="password" id="password" easyform="length:6-16;" message="密码必须为6—16位" easytip="disappear:lost-focus;theme:blue;"></td>
            </tr>
            <tr>
                <td>确认密码</td>
                <td><input name="psw2" type="password" id="psw2" easyform="length:6-16;equal:#password;" message="两次密码输入要一致" easytip="disappear:lost-focus;theme:blue;"></td>
            </tr>
            <tr>
                <td>email</td>
                <td><input name="email" type="text" id="email" easyform="email;real-time;" message="Email格式要正确" easytip="disappear:lost-focus;theme:blue;" ajax-message="这个Email地址已经被注册过，请换一个吧!"></td>
            </tr>
            <tr>
                <td>昵称</td>
                <td><input name="username" type="text" id="username" easyform="length:2-16" message="昵称必须为2—16位" easytip="disappear:lost-focus;theme:blue;"></td>
            </tr>            
        </table>

		<div class="buttons">
			<input value="注 册" type="submit" style="margin-right:20px; margin-top:20px;">
			<a href="/enterprise/web/login" style="margin-right:50px; ">我有账号，立即登录</a>
        </div>
		
        <br class="clear">
    </form>
</div>



    </div>
</div>
</div>
</div>
<div id="footer">
  <div class="foot-l">
    <p class="affiliated"> 
    <a href="#" target="_blank">法律条款</a><span>|</span>
    <a href="#" target="_blank">隐私声明</a><span>|</span>
    <a href="#" target="_blank">站点地图</a><span>|</span>
    <a href="#" target="_blank">联系方式</a><span>|</span>
    <a href="#" target="_blank">关于我们</a> </p>

    <div class="icu">Copyright © 2015 台州辰泽自动化设备有限公司 All Rights Reserved <br/><A href="http://www.tzsiju.com/" target="_blank" style="color:#5f5f5f;text-decoration:none"> 网站建设：思聚网络</A></div>

  </div>
  <div class="foot-r">
    <p>客户服务热线：<span>0576-12345678</span></p>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#reg-form').easyform();
});
</script>
</body>
</html>
