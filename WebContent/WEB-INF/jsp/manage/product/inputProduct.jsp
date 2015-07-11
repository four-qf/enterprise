<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品中心</title>
<link rel="stylesheet" href="/enterprise/css/regist.css">

<script type="text/javascript" src="/enterprise/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="/enterprise/js/easyform.js"></script>

</head>
<body>
<div style="margin-top: 100px">
<div class="form-div">
   <form:form action="/enterprise/manager/saveOrUpdateProduct" method="post" modelAttribute="product" acceptCharset="utf-8" enctype="multipart/form-data">
${error}
        <table>
            <tr>
                <td>产品类别：</td>
                <td align="left"  >&nbsp;&nbsp;<form:select path="productkind.productkindid" items="${productkinds }" itemLabel="productkindname" itemValue="productkindid"></form:select>
                </td>
            </tr>
            <tr>
                <td>产品名称：</td>
                <td align="left"><form:input path="productname"/></td>
            </tr>
            <tr>
                <td>产品简介:</td>
                <td align="left">&nbsp;&nbsp;<textarea rows="10" cols="38" name="productbrief" >${product.productbrief }</textarea></td>
            <input type="hidden" name="productid" value="${product.productid }">
            </tr>
            <tr><td><br/></td></tr>
            <c:if test="${product.productid != null }">
            
            <tr>
                <td> 产品图片：</td>
                <td align="left">&nbsp;&nbsp;<img src="/enterprise/uploadFiles/${product.imagesnewname }"></td>
            </tr>
            </c:if>
            <tr>
                <td>上传图片：</td>
                <td><input type="file" name="file"></td>
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
