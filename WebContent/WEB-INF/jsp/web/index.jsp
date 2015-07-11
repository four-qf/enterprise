<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>辰泽自动化设备有限公司</title>
<link rel="stylesheet" type="text/css" href="/enterprise/css/style.css" />
<script type="text/javascript" src="/enterprise/js/jquery-1.9.1.min.js"></script>
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
  <div class="logo"><a href="#"><img src="/enterprise/images/logo_02.png" width="319" height="92" /></a></div>
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
          <c:forEach items="${productkinds }" var="product" begin="1" end="5">
          <p><a href='/enterprise/web/product/list/${product.productkindid }'>${product.productkindname }</a></p>
          </c:forEach>
          <p><a href='/enterprise/web/product/list' class="privilege">更多...</a></p>
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
      <li><a href="#">首页</a></li>
    </ul>
  </div>
</div>

<div id="banner">

  <div class="dw">

    <div class=slide> 

	<a class="banner_a" style="display: none" id="focus1"><img src="/enterprise/images/banner_20.jpg" width="1440" height="485"></a>

	<a class="banner_a" id="focus2"><img src="/enterprise/images/banner_02.jpg" width="1440" height="485"></a> 

	<a class="banner_a" style="display: none" id="focus3"><img src="/enterprise/images/banner_03_02.jpg" width="1440" height="485"></a>

      <ul>

        <li id="change1" onmousemove="setFocus(1)">

          <dl>
            <dt><a href="#"><img src="/enterprise/images/img_03.jpg"></a></dt>
            <dd class="tl"><a href="#">经营理念</a></dd>
            <dd style="*margin-top:-20px;"><a href="#">我们秉承价值投资理念强调通过精深研究发现</a></dd>
          </dl>

        </li>
        <li id="change2" onmousemove="setFocus(2)">
          <dl>
            <dt><a href="#"><img src="/enterprise/images/img_05.jpg"></a></dt>
            <dd class="tl"><a href="#">我们的宗旨</a></dd>
            <dd style="*margin-top:-20px;"><a href="#">提供“达标、准时、快速响应”的产品和服务</a></dd>
          </dl>
        </li>

        <li id="change3" class="current" onmousemove="setFocus(3)">
          <dl>
            <dt><a href="#"><img src="/enterprise/images/img_07.jpg"></a></dt>
            <dd class="tl"><a href="#">管理团队</a></dd>
            <dd style="*margin-top:-20px;"><a href="#">志同道合，丰富的企业运作与投资经验。</a></dd>
          </dl>

        </li>

        </li>

      </ul>

    </div>

  </div>

  <script type=text/javascript>var rollPeriod = 3000;var rollCount = 3;setFocus(1);</script> 

</div>

<div id="main">

  <div class="new">

  <h2><a href="/enterprise/web/news/newslist" class="privilege">新闻资讯</a></h2>

    <ul>
     <c:forEach items="${newslist }" var="news" begin="0" end="3">
        <li><a class="privilege" href="/enterprise/web/news/shownews/${news.newsid }" style="width:250px; overflow:hidden; display:inline-block;height:26px;">${news.newstitle }</a>
        <span><fmt:formatDate value="${news.createtime }" type="date"/> </span></li>
     </c:forEach> 
    </ul>

  </div>

  <div class="about">

  <h2><A href="#">关于我们</A></h2>

    <p><A href="#">
    公司主营为阀门，卫浴，汽车，医疗等领域产品提供配套检测、实验机械设备，使得应用产品符合各种国际及国家标准，公司在阀门，卫浴，汽车，医疗测试领域，已经为众多企业提供优质的测试设备，...</A></p>

  </div>

  <div class="case">

  <h2><A href="#">热门产品</A></h2>
    <div class="container">
      <div class="folio_block">
        <div class="main_view">
          <div class="window">
            <div style="width: 3160px;" class="image_reel">
			   <c:forEach items="${productlist }" var="product" begin="0" end="3">
			    <dl>
                <dt><a class="privilege" ><img src="/enterprise/uploadFiles/${product.imagesnewname }" height="57"></a></dt>
                <dd>${product.productname }</dd>
                </dl>
              </c:forEach>
            </div>
          </div>
          <div style="display: block;" class="paging">
            <a class="active" rel="1"></a>
            <a rel="2"></a>
            <a rel="3"></a>
            <a rel="4"></a>
            </div>
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

</body>
</html>

