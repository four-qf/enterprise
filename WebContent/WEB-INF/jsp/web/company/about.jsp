<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>辰泽自动化设备有限公司</title>
<link rel="stylesheet" type="text/css" href="/enterprise/css/style.css" />
<script type="text/javascript" src="/enterprise/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/enterprise/js/index.js"></script>
<script type="text/javascript" src="/enterprise/js/banner.js"></script>
<script type="text/javascript" src="/enterprise/js/nav.js"></script>

<script type="text/javascript">
	$(function(){
		$.ajaxSetup({async:false});
		$(".privilege").click(function(){
			var url = this.href;
			var flag = true;
			$.get(url,{"time": new Date()}, function(data){
				if(data == '0' ) {
					alert("登录后才能访问");
					flag = false;
				}
			});
			return flag;
		});
	});
</script>

</head>

<body>

<div id="header">
  <div class="logo"><a href="/"><img src="/enterprise/images/logo_02.png" width="319" height="92" /></a></div>
  <div class="nav">
      <div class="languages"><A href="/enterprise/web/login" class="bg">登录</A>|<a href="/enterprise/web/regist"><b>注册</b></a></div>
    
               <ul>
      <li  class="last"><a href='/enterprise/web/contact'>联系我们</a>
        <div class='secondary n2'>
          <div class='secondary2'>
          <p><a href='/enterprise/web/user/leavewords' class="privilege">在线留言</a></p>
          <p><a href='/enterprise/web/contact'>联系方式</a></p>
          </div>
          <div class='img-li'><img src='/enterprise/images/1-1302251S924393.jpg' width='104' height='67' /></div>
        </div>
      </li>
  
      <li><a href='/enterprise/web/product/list' class="privilege">产品中心</a>
        <div class='secondary'>
          <div class='secondary2'>
          <c:forEach items="${productkinds }" var="productkind" begin="1" end="5">
          <p><a class="privilege" href='/enterprise/web/product/list/${productkind.productkindid }'>${productkind.productkindname }</a></p>
          </c:forEach>
          <p><a class="privilege" href='/enterprise/web/product/list'>更多...</a></p>
          </div>
          <div class='img-li'><img src='/enterprise/images/1-1302251SS4W9.jpg' width='104' height='67' /></div>
        </div>
      </li>
      <li><a href='/enterprise/web/news/list' class="privilege">新闻资讯</a>
	      <div class='secondary'>
		  <div class='secondary2'>
          <c:forEach items="${newskinds }" var="newskind">
          <p><a class="privilege" href='/enterprise/web/news/list/${newskind.kindid }'>${newskind.kindname }</a></p>
          </c:forEach>
          </div>
		  <div class='img-li'><img src='/enterprise/images/1-1302251SS4W9.jpg' width='104' height='67' /></div>
	  </li>
      <li><a href='/enterprise/web/companyBrief'>关于我们</a>
      </li>
      <li><a href="/enterprise">首页</a></li>
    </ul>
  </div>
</div>

<div id="banner2"> <img src="/enterprise/images/1418723619.jpg" width="1430" height="214" /> </div>
<div style="background:#FFF; width:100%;">
<div id="main2">
  <div class="tittle"></div>
  <div class="tittle2">关于我们 / <b>About us</b></div>
  <div class="left">
    
    <div class="phone-bj">
      <div class="phone">
        <h2>联系我们 <b>Contact  Us</b></h2>
        <div class="phone-cn">
          <p>传真：0576-12345678</p>
          <p>电话：0576-12345678</p>
          <p>邮箱：web@xxxxxx.com</p>
          <p>地址：浙江省台州市玉环县</p>
        </div>
      </div>
    </div>
  </div>
  <div class="right">
    <div class="weizhi">您现在的位置：<a href='#'>关于我们</a> 
    <div class="about-jj">
      <dl>
        <dt><img src="/enterprise/images/1-13022611415S21.jpg" width="222" height="433" /></dt>
        <dd>
<p>台州辰泽自动化设备有限公司销售中心位于浙江省玉环县，在浙江省、广州市、福建省厦门市设有办事处。在昆山市和玉环县拥有办公、研发场地近500平方米，生产装配和调试车间1000余平方米。公司有富有经验和活力的研发团队，专业设计自动化技术、机械制造技术、流体机械、仪表检测技术、计算机软件技术等，形成了在测试与工业自动化控制系统研究、开发方面具有深厚理论功底和开发经验的团队。</p>

<p>公司主营为阀门，卫浴，汽车，医疗等领域产品提供配套检测、实验机械设备，使得应用产品符合各种国际及国家标准，公司在阀门，卫浴，汽车，医疗测试领域，已经为众多企业提供优质的测试设备，包括著名知名的阀门，卫浴，汽车零配件，医疗产品生产商，国际国内权威的检测认证机构以及国家、地方质量检验检测监督局等单位。</p>

<p>我们的宗旨：提供“达标、准时、快速响应”的产品和服务，始终如一地达到和超越客户的满意度。</p>
        </dd>
      </dl>
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
</body>
</html>
