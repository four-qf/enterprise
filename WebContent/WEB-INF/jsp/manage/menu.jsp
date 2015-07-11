<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="/enterprise/css/admin.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js" ></script>
<script type="text/javascript">
	$(function(){
		$.ajaxSetup({async:false});
		$(".privilege").click(function(){
			var url = this.href;
			var flag = true;
			$.get(url,{"time": new Date()}, function(data){
				if(data == '0' ) {
					alert("抱歉，你没有访问权限");
					flag = false;
				}
			});
			if(!flag){
				return false;
			}
		});
	});
</script>

<SCRIPT language=javascript>
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
</SCRIPT>
</HEAD>
<BODY>
<TABLE height="630px" cellSpacing=0 cellPadding=0 width=170 background=/enterprise/images/menu_bg.jpg border=0>
  <TR>
    <TD vAlign=top align=middle>
    
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TR>
          <TD height=10></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=/enterprise/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1) href="javascript:void(0);">关于我们</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
          <IMG height=9 src="/enterprise/images/menu_icon.gif" width=9>
          </TD>
          <TD><A href="#" >公司简介</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30>
              <IMG height=9 src="/enterprise/images/menu_icon.gif" width=9>
          </TD>
          <TD><A href="#">荣誉资质</A></TD>
        </TR>
        <TR height=4>
          <TD colSpan=2></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=/enterprise/images/menu_bt.jpg><A 
            class=menuParent onclick=expand(2) 
            href="javascript:void(0);">新闻中心</A></TD></TR>
        <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <c:forEach items="${newskinds }" var="newskind">
        <TR height=20>
          <TD align=middle width=30>
              <IMG height=9 src="/enterprise/images/menu_icon.gif" width=9></TD>
          <TD><A href="/enterprise/manager/newsList/${newskind.kindid}" class="privilege" target="main" >${newskind.kindname }</A></TD>
        </TR>
        </c:forEach>
        <TR height=20>
          <TD align=middle width=30>
              <IMG height=9 src="/enterprise/images/menu_icon.gif" width=9></TD>
          <TD><A href="/enterprise/manager/inputNews" target="main" class="privilege">发布新闻</A></TD>
        </TR>
        <TR height=4>
          <TD colSpan=2></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=/enterprise/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(3) href="javascript:void(0);">产品中心</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child3 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="/enterprise/images/menu_icon.gif" width=9></TD>
          <TD><A href="productlist" class="privilege" target="main">产品展示</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="/enterprise/images/menu_icon.gif" width=9></TD>
          <TD><A href="${pageContext.request.contextPath }/manager/inputProduct" target="main" class="privilege">最新产品</A></TD>
        </TR>
        <TR height=4>
          <TD colSpan=2></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=/enterprise/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(4) href="javascript:void(0);">客户管理</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child4 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
              <IMG height=9 src="/enterprise/images/menu_icon.gif" width=9>
          </TD>
          <TD><A href="userlist" class="privilege" target="main">客户名单</A></TD></TR>
       
        <TR height=4>
          <TD colSpan=2></TD></TR>
        
        <TR height=20>
          <TD align=middle width=30>
              <IMG height=9 src="/enterprise/images/menu_icon.gif" width=9>
          </TD>
          <TD><A class="privilege" href="/enterprise/manager/user/leavewords" target="main" >用户留言</A></TD></TR>
       
        <TR height=4>
          <TD colSpan=2></TD></TR>
       </TABLE>
     
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=/enterprise/images/menu_bt.jpg>
              <A class=menuParent onclick=expand(7) href="javascript:void(0);">系统管理</A>
          </TD>
        </TR>
        <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE id=child7 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
             <IMG height=9 src="/enterprise/images/menu_icon.gif" width=9>
          </TD>
          <TD><A href="managerlist" class="privilege" target="main">管理员列表</A></TD>
        </TR>
        
        <TR height=20>
          <TD align=middle width=30>
             <IMG height=9 src="/enterprise/images/menu_icon.gif" width=9>
          </TD>
          <TD><A href="input" target="main" class="privilege">添加管理员</A></TD>
        </TR>
        <TR height=4>
          <TD colSpan=2></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=4>
          <TD></TD>
        </TR>
      </TABLE>
      <TABLE style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30>
             <IMG height=9 src="/enterprise/images/menu_icon.gif" width=9>
          </TD>
          <TD>
            <A href="#">修改口令</A>
          </TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30>
              <IMG height=9 src="/enterprise/images/menu_icon.gif" width=9>
          </TD>
          <TD>
          <A onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="#">退出系统</A>
          </TD>
        </TR>
      </TABLE>
   </TD>
   <TD width=1 bgColor=#d1e6f7></TD>
  </TR>
 </TABLE>
</BODY>
</HTML>
