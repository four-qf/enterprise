<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="/enterprise/css/admin.css" type="text/css" rel="stylesheet">
</head>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TR height=28>
    <TD background=/enterprise/images/title_bg1.jpg>当前位置: </TD></TR>
  <TR>
    <TD bgColor=#b1ceef height=1></TD></TR>
  <TR height=20>
    <TD background=/enterprise/images/shadow_bg.jpg></TD></TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
  <TR height=100>
    <TD align=middle width=100><IMG height=100 src="/enterprise/images/admin_p.gif" 
      width=90></TD>
    <TD width=60>&nbsp;</TD>
    <TD>
      <TABLE height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TR> <TD>欢迎进入网站管理中心！</TD></TR>
       </TABLE> 
     </TD>
     </TR>   
  <TR>
    <TD colSpan=3 height=10></TD>
  </TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=/enterprise/images/title_bg2.jpg>您的相关信息</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
    
  <TR height=20>
    <TD></TD></TR></TABLE>
  <div align="center">
  <TABLE cellSpacing=0 cellPadding=2 width="95%"  border=0>
  <TR>
    <TD align=right width=100 height="50px"><font size="5">帐号：</font></TD>
    <TD style="COLOR: #880000"><font size="5">${man.managerid }</font></TD>
  </TR>
 
  <TR>
    <TD align=right width=100 height="50px"><font size="5">姓名：</font></TD>
    <TD style="COLOR: #880000"><font size="5">${man.managername }</font></TD>
  </TR>
  <TR>
    <TD align=right width=100 height="50px"><font size="5">职位：</font></TD>
    <TD style="COLOR: #880000"><font size="5">${man.position }</font></TD>
  </TR>
  <TR>
    <TD align=right width=100 height="50px"><font size="5">部门：</font></TD>
    <TD style="COLOR: #880000">
    <c:if test="${man.department ==null }">
    <font size="5">
       ${man.position }
    </font>
    </c:if>
     <c:if test="${man.department !=null }">
    <font size="5">
    
       ${man.department.departmentname }
    </font>
    </c:if>
    </TD>
  </TR>
  </TABLE> 
 </div>
</BODY>
</HTML>