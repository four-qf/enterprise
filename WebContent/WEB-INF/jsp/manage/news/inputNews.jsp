<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<%@ taglib prefix="ckfinder" uri="http://cksource.com/ckfinder" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 <style>
  .alsp{ 
       font-family: "微软简隶书";
	   font-size: 36px;  
       }
 </style>
 <script type="text/javascript" src="/enterprise/ckeditor/ckeditor.js"></script>
 <script type="text/javascript" src="/enterprise/ckfinder/ckfinder.js"></script>

<body>
    <form:form action="/enterprise/manager/saveOrUpdateNews" method="post" modelAttribute="news" acceptCharset="utf-8">
       <div style="background-color:#B6E2F5;height:66px;">
          <div class="alsp" style="margin-left: 50px"> 
             <table>   
                 <form:hidden path="newsid"/>
                <tr><td> 标 题：</td><td><form:input path="newstitle" style="height: 27px;width: 300px" /></td></tr>
             </table>   
          </div> 
          <div align="right">
          	分类：<form:select path="newskind.kindid" items="${newskinds }" itemLabel="kindname" itemValue="kindid"></form:select>
          </div>
       </div>
    <textarea rows="20" cols="60" id="onlineArticle.text" name="newscontent">${news.newscontent }
	</textarea>
	</form:form>
	<ckfinder:setupCKEditor basePath="/enterprise/ckfinder/" editor="onlineArticle.text"/>
	<ckeditor:replace replace="onlineArticle.text" basePath="/enterprise/ckeditor/"></ckeditor:replace>
	
</body>
</html>