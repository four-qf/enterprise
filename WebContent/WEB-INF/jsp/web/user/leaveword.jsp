<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
      <li><a class="privilege" href='/enterprise/web/news/list'>新闻资讯</a>
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

<div id="banner2"> <img src="/enterprise/images/jhyw-banner_02.jpg" width="1440" height="214" /> </div>

<div style="background:#fff;">
<div id="main2">

  <div class="tittle"></div>

 <div class="tittle2">加华业务 / <b>Business</b></div>

  <div class="left">

    <div class="left-nav">

      <ul>
        <li><a href='/enterprise/web/contact' class='red'>联系方式</a></li>
        <li><a href='#' >在线留言</a></li>
      </ul>

    </div>

    <div class="phone-bj">
      <div class="phone">
        <h2>联系我们 <b>Contact  Us</b></h2>
        <div class="phone-cn">
          <p>传真：0576-12345678</p>
          <p>电话：0576-12345678</p>
          <p>邮箱：web@xxxxxx.com</p>
          <p>地址：浙江省台州市玉环县芦浦镇</p>
        </div>
      </div>
    </div>

  </div>

  <div class="right">

    <div class="weizhi">您现在的位置：<a href='#'>联系我们</a> > <a href='#'>在线留言</a></div>

   

     <div class="words-zx">
      <c:if test="${wordslist == null }">
          <font color="red" size="6">暂时没有留言 ，请留言</font>
      </c:if>
    <c:if test="${wordslist !=null }">
    <ul>
        <c:forEach items="${wordslist }" var="words" begin="${(pageNow-1)*pageSize }" end="${pageNow*pageSize -1 }">
		<li>
		 <div style="margin-left: 20px;margin-top: 5px;height: 15px">
		   <font color="red">${words.user.username }: </font>
		  </div>
		  <div style="margin-left: 45px">${words.wordcontent } 
		  <span>${words.createtime }</span>
		  </div>
		 <c:forEach items="${replylist }" var="reply">
		 <c:if test="${words.wordid == reply.leaveWords.wordid }">
		 <div style="margin-left: 30px">回复：
		   ${reply.replycontent }
		 </div>
		 </c:if>
		 </c:forEach>
		
		</li>
    	</c:forEach>
    </ul>
        <div class="page"><span>共<b>${pageCount }</b>页</span>
        <c:if test="${pageNow>1 }">
        	<a href='/enterprise/web/user/getPageNow/${pageNow -1 }'><img src='/enterprise/images/back.gif' width='34' height='13' /></a>
        </c:if>
		<a class="b">${pageNow }</a>
		<c:if test="${pageNow <pageCount }">
		<a href='/enterprise/web/user/getPageNow/${pageNow +1 }'><img src='/enterprise/images/next.gif' width='34' height='13' /></a>
		</c:if>
		</div>
		<hr/>
</c:if>
    

    <form action="/enterprise/web/user/leave" method="post">

        <table>
            <tr>
                <td>留言:</td>
            </tr>
            <tr><td><br/></td><td></td></tr>
            <tr>
            <td><td>
            <td>
                    <textarea rows="5" cols="80" name="wordcontent"></textarea>
                </td>
            </tr>
         </table>   
		<div align="right">
			<input value="留言" type="submit" style="margin-top:20px;">
        </div>
		
        <br class="clear">
    </form>
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