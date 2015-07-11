<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台中心</title>
</head>
<body>
   
  <div style="width: 700px;margin-left: 100px;margin-top: 100px;background-color: #CCCCCC">
    <br/>
    <div style="margin-left: 30px;height: 30px">  留  言： <Br/></div>
     <div style="margin-left: 70px;">
     ${leavewords.wordcontent }  <br/>
     </div>
     
     <div align="right" style="margin-right: 40px"> 
     ------ ${leavewords.user.username }
     </div>
     
	<br/>
	 <hr/>
	<div>
		<form:form action="/enterprise/manager/user/reply" method="post" modelAttribute="reply" acceptCharset="utf-8">
		   
		   <div style="margin-top: 20px">
		   		<div style="margin-left: 30px;height: 30px">回复：</div>
		   		<div style="margin-left: 70px">
		   		   <form:textarea path="replycontent" cols="60" rows="5"/>
		   		   <input type="hidden" name="wordid" value="${leavewords.wordid }">
		   		</div>
		   		<div align="right" style="margin-right: 40px"><input type="submit" value="提交"></div>
		   </div>
		</form:form>
	
	</div>
	</div> 
  	
</body>
</html>