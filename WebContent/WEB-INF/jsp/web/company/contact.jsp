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
  
      <li><a href='/enterprise/web/product/list'>产品中心</a>
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
        <li><a href='/enterprise/web/contact' >联系方式</a></li>
        <li><a href='/enterprise/web/user/leavewords' class="privilege">在线留言</a></li>
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

    <div class="weizhi">您现在的位置：<a href='#'>联系我们</a> > <a href='#'>联系方式</a></div>

    <div class="contact-lxfs">

      <p><strong>地址：</strong>浙江省台州市玉环县芦浦镇</p>

      <p><strong>总机：</strong>0576-12345678</p>

      <p><strong>传真：</strong>0576-12345678</p>

      <p><strong>邮箱：</strong>web@xxxx.com</p>


        <div style="width:586px;height:396px;border:#ccc solid 1px;font-size:12px; margin-top:20px; margin-left:30px;" id="map"></div>
     
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=BiOyGk48pHhPoGVuXG8CaBiY"></script>
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
    //创建和初始化地图函数：
    function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件
      addMapControl();//向地图添加控件
      addMapOverlay();//向地图添加覆盖物
    }
    function createMap(){ 
      map = new BMap.Map("map"); 
      map.centerAndZoom(new BMap.Point(121.261286,28.203743),13);
    }
    function setMapEvent(){
      map.enableScrollWheelZoom();
      map.enableKeyboard();
      map.enableDragging();
      map.enableDoubleClickZoom()
    }
    function addClickHandler(target,window){
      target.addEventListener("click",function(){
        target.openInfoWindow(window);
      });
    }
    function addMapOverlay(){
      var markers = [
        {content:"我的备注",title:"我的标记",imageOffset: {width:-46,height:-21},position:{lat:28.207563,lng:121.247775}}
      ];
      for(var index = 0; index < markers.length; index++ ){
        var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
        var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
          imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
        })});
        var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
        var opts = {
          width: 200,
          title: markers[index].title,
          enableMessage: false
        };
        var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
        marker.setLabel(label);
        addClickHandler(marker,infoWindow);
        map.addOverlay(marker);
      };
    }
    //向地图添加控件
    function addMapControl(){
      var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
      scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
      map.addControl(scaleControl);
      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
      map.addControl(navControl);
      var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:false});
      map.addControl(overviewControl);
    }
    var map;
      initMap();
  </script>
</body>

</html>