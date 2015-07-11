<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/enterprise/css/admin.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" background="/enterprise/images/header_bg.jpg" border=0>
  <TR height=56>
    <TD width=260><IMG height=56 src="/enterprise/images/header_left.jpg" 
    width=260></TD>
    <TD style="FONT-WEIGHT: bold; COLOR: #fff; PADDING-TOP: 20px" align=middle>当前用户:${man.managername } &nbsp;&nbsp; 
    <A style="COLOR: #fff" href="/enterprise/manager/updatePassword" target="main">修改口令</A> &nbsp;&nbsp; 
    <A style="COLOR: #fff" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="/enterprise/manager/exit" target="manager" >退出系统</A> 
    </TD>
    <TD align=right width=268><IMG height=56 src="/enterprise/images/header_right.jpg" width=268></TD>
  </TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TR bgColor=#1c5db6 height=4>
    <TD></TD>
  </TR>
</TABLE>
</BODY>
</HTML>
