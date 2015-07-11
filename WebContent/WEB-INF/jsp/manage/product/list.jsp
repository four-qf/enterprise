<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<HEAD>
<TITLE>产品中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
<LINK href="YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="/enterprise/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#checkall").click(function(){
		if(this.checked) {
			$("input[name='productid']").each(function(){
				this.checked = true;
			});
		}else {
			$("input[name='productid']").each(function(){
				this.checked = false;
			});
		}
	});
});

$(function(){
	
	$("select[name='productkindid']").change(function(){
		var productkindid = $("#productkindid").val();
		var url = "/enterprise/manager/productlist/" +productkindid;
		location.href = url;
		
	});
		
});
</script>
</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="/enterprise/YHChannelApply.files/new_019.jpg" border=0></TD>
    <TD width="100%" background=/enterprise/YHChannelApply.files/new_020.jpg height=20></TD>
    <TD width=15><IMG src="/enterprise/YHChannelApply.files/new_021.jpg" 
  border=0></TD></TR></TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15 background=/enterprise/YHChannelApply.files/new_022.jpg><IMG 
      src="/enterprise/YHChannelApply.files/new_022.jpg" border=0> </TD>
    <TD vAlign=top width="100%" bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
        <TR>
          <TD class=manageHead>当前位置：管理首页 &gt; 管理中心 &gt; 产品中心</TD>
          <td></td>
          <td>
          <form action="addProductKind" method="post">
                                        添加类别 ：
                <input type="text" name="productkindname">
                <input type="submit" value="添加">
          </form>      
          </td>
          </TR>
        <TR>
          <TD height=2></TD></TR></TABLE>
      <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" 
      align=center border=0>
        <TBODY>
        <TR>
          <TD height=25>
            <TABLE cellSpacing=0 cellPadding=2 border=0>
              <TBODY>
              <TR>
                <TD>产品分类：</TD>
               </TR>
               <tr> 
                 <td><td> 
                 <c:forEach items="${productkinds }" var="productkind" >
                
	            <td> <a href="/enterprise/manager/productlist/ ${productkind.productkindid }">${productkind.productkindname} </a>&nbsp; </td>
                 </c:forEach>
                
               </tr>
              </TBODY>
             </TABLE>
           </TD>
          
         </TR>
        <TR>
          <TD>
          
            <TABLE id=grid 
            style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" 
            cellSpacing=1 cellPadding=2 rules=all border=0>
              <TBODY>
              <c:if test="${productlist.size() == 0 }">
                   <center>  <font color="red" size="5">该类 暂时没有商品！！！ </font> </center>
            </c:if>
               <c:if test="${productlist.size() != 0 }">
              <TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                <TD>商品名</TD>
                <TD>商品种类</TD>
                <TD>发布人</TD>
                <TD>发布时间</TD>
                <TD>详细</TD>
                <TD>操作</TD></TR>
             <c:forEach items="${productlist }" var="product" begin="${(pageNow-1)*pageSize }" end="${pageNow*pageSize-1 }">
              <TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
                <TD>${product.productname }</TD>
                <TD>${product.productkind.productkindname }</TD>
                <TD>${product.manager.managername }</TD>
                <TD>${product.markettime }</TD>
                <TD><A href="/enterprise/manager/inputProduct/${product.productid}">查看</A> 
                </TD>
                <TD>
                <form action="deleteProduct" method="post">
                <input name="_method" type="hidden" value="DELETE">
                <INPUT id=productid type=checkbox value="${product.productid }" name="productid"> 
                </TD></TR>
              </c:forEach>
              </c:if>
              </TBODY></TABLE></TD></TR>
              
        <TR>
          <TD align=right height=25>
            <INPUT id="checkall" type=checkbox name=checkall> 
            全选&nbsp;&nbsp;&nbsp; 
            <input type="submit" value="删除">
            </form>
            </TD></TR>
        <TR>
          <TD>
            <div align="right">
            <form action="/enterprise/manager/getProductNow" method="post">
            <c:if test="${pageNow >1 }">
            [<A href="/enterprise/manager/getProductNow/${pageNow=pageNow-1 }">前一页</A>] 
            </c:if>
            <A class="" href="#">${pageNow }</A> 
            <c:if test="${pageNow<pageCount }">
            [<A class="" href="/enterprise/manager/getProductNow/${pageNow=pageNow+1 }">后一页</A>] 
            </c:if>
                        
            <SELECT name="pageNow">
            <c:forEach var="i" begin="1" end="${pageCount }">
               <OPTION value="${i }">第${i }页</OPTION>
            </c:forEach>
            </SELECT>
            <input type="submit" value="跳转">
            </form>
            
            </DIV></TD></TR></TBODY></TABLE></TD>
           
    <TD width=15 background=/enterprise/YHChannelApply.files/new_023.jpg>
    <IMG src="/enterprise/YHChannelApply.files/new_023.jpg" border=0>
    </TD></TR></TBODY></TABLE>
     
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="/enterprise/YHChannelApply.files/new_024.jpg" border=0></TD>
    <TD align=middle width="100%" background=/enterprise/YHChannelApply.files/new_025.jpg 
    height=15></TD>
    <TD width=15><IMG src="/enterprise/YHChannelApply.files/new_026.jpg" 
  border=0></TD></TR></TBODY></TABLE>
</BODY></HTML>
