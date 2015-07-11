<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>
  
     	
     
	    
<link rel="stylesheet" href="/enterprise/css/regist.css">

<script type="text/javascript" src="/enterprise/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="/enterprise/js/easyform.js"></script>

</head>
<body>
<div style="margin-top: 100px">
<div class="form-div">
   <form:form action="/enterprise/manager/saveOrUpdate" method="POST" modelAttribute="manager" acceptCharset="utf-8">
${error}
        <table>
            <c:if test="${manager.managerid != null }">
     	<tr height="30px"><td >编号：</td><td align="left">&nbsp; ${manager.managerid }</td></tr>
     	<form:hidden path="managerid"/>
     	</c:if>
     	<c:if test="${manager.managerid == null }">
     	 <form:hidden path="managerid"/>
     	</c:if>
        <tr height="30px"><td >姓名：</td><td align="left"><form:input path="managername"/></td></tr>
     	<tr height="30px"><td >职位：</td>
     	 <td align="left">&nbsp;
     	 <select name="position">
     	  <option value="员工">员工</option>
     	  <option value="经理">总经理</option>
     	  </select></td></tr>
     	<tr height="30px"><td >部门： </td><td align="left">&nbsp;&nbsp;<form:select path="department.departmentid" 
			  items="${departments }" itemLabel="departmentname" itemValue="departmentid">
			</form:select>
          </td> 
        </tr> 
        </table>
		<div class="buttons">
			<input value="提交" type="submit" style="margin-right:20px; margin-top:20px;">
        </div>
		
        <br class="clear">
    </form:form>
</div>
</div>
</body>
</html>