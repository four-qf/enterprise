<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>台州辰泽自动化设备有限公司</title>
<link rel="stylesheet" type="text/css" href="/enterprise/css/style.css" />
<script type="text/javascript" src="/enterprise/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/enterprise/js/index.js"></script>
<script type="text/javascript" src="/enterprise/js/banner.js"></script>
<script type="text/javascript" src="/enterprise/js/nav.js"></script>
</head>

<body>
<div id="banner2"> <img src="/enterprise/images/tzzgx-banner_02.jpg" width="1440" height="214" /> </div>
<div style="background:#fff;">
<div id="main2">
  <div class="tittle"></div>
 <div class="tittle2">用户登录/ <b>User</b></div>
  <div class="left">
    <div class="left-nav">
      <ul>
       <li><a href='#' class='red'>用户登录</a></li>  
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
 <div class="right"><div class="weizhi">您现在的位置：<a href="#">用户登录</a> </div>
    <div class="invesy-login">
      <div class="login">登录信息</div>
      <div class="login-tb">
       
    <form action="login" method="POST">
        <input type="hidden" name="fmdo" value="login">
        <input type="hidden" name="dopost" value="login">
    <table width="605" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
        <tbody><tr>
        <td colspan="3" width="680" height="36" style="color:#af1911; padding-top:3PX; padding-left:111PX; font-size:13PX;">台州辰泽自动化设备有限公司</td>
        </tr>
        <tr>
        <td height="33" width="202" align="right" style="color:#af1911">帐　　号</td>
        <td width="230" align="right"><input type="text" class="name" name="account" id="account"></td>
        <td valign="middle">*　必填</td>
        </tr>
        <tr>
        <td height="31" width="202" align="right" style="color:#af1911">登录密码</td>
        <td width="230" align="right"><input type="password" class="password" name="password" id="pwd"></td>
        <td valign="middle">*　必填</td>
        </tr>
        <tr>
        <tr>
        <td height="31" width="202" align="right" style="color:#af1911">验  证  码</td>
        <td width="230">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" class="checkcode" size="12" name="checkcode" id="checkcode"> &nbsp; 
        <img style=" vertical-align: middle; " src="/enterprise/CheckCodeServlet">
        </td>
        <td><a href="/enterprise/manager/login"><font color="blue">看不清换一张</font></a></td>
        </tr>
        <tr>
        <td height="25" width="202" align="right" style="color:#af1911">&nbsp;</td>
        <td width="230" align="left"><input type="submit" class="login2" value="">
       
        </td>
        <td> <a href="/enterprise/web/regist" >没有账号，去注册</a></td>
        </tr>
        
    </tbody></table>
        <br/><br/>
        <center><font color="red">${error }</font></center>
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
</div></body>
</html>
