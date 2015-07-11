<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理中心</title>
<style type="text/css">

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}
.BORDER {
	outline: none;
}


a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.STYLE7 {font-size: 12}

</style>

<script type="text/javascript" src="/enterprise/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
   $(function(){
	  $("#checkall").click(function(){
		  if(this.checked){
			  $("input[name='account']").each(function(){
				  this.checked = true;
			  });
		  }else {
			  $("input[name='account']").each(function(){
				  this.checked = false;
			  });
		  }
	  }); 
   });
   
</script>
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
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="/enterprise/images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="/enterprise/images/tab_05.gif"><img src="/enterprise/images/311.gif" width="16" height="16" /> <span class="STYLE4">管理员列表</span></td>
        <td width="281" background="/enterprise/images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="60">
              <form action="/enterprise/manager/user/delete" method="post">
              <table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1">
                    
                    <div align="center" >
                        <input type="checkbox" id="checkall" value="checkbox"  />
                    </div>
                    </td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
              </table></td>
             
              <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="/enterprise/images/083.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1 ">
                      <div align="center" class="BORDER">
                        <input type="hidden" name="_method" value="DELETE"/>
                        <input type="submit" value="删除" class="delete"></input>
                      </div></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
        <td width="14"><img src="/enterprise/images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="/enterprise/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="6%" height="26" background="/enterprise/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">选择</div></td>
            <td width="8%" height="18" background="/enterprise/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">账号</div></td>
            <td width="24%" height="18" background="/enterprise/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">姓名</div></td>
            <td width="10%" height="18" background="/enterprise/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">邮箱</div></td>
          </tr>
        
         
         
           <c:forEach items="${userlist }" var="user" begin="${(pageNow-1)*pageSize }" end="${pageNow*pageSize-1 }">
          <tr>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input id="account" name="account" type="checkbox" class="STYLE2" value="${user.account}" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">${user.account }</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">${user.username }</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">${user.email }</div></td>
          </tr>
           </c:forEach>
        </table></td>
        </form>
        <td width="9" background="/enterprise/images/tab_16.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="29"><img src="/enterprise/images/tab_20.gif" width="15" height="29" /></td>
        <td background="/enterprise/images/tab_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1">共${managers.size() }条纪录，当前第${pageNow }页，每页${pageSize }条纪录</span></td>
            <td width="75%" valign="top" class="STYLE1"><div align="right">
              <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="62" height="22" valign="middle"><a href="/enterprise/manager/user/getPageNow/1"><div align="right"><img src="/enterprise/images/first.gif" width="37" height="15" /></div></a></td>
                  <c:if test="${pageNow>1 }">
                  <td width="50" height="22" valign="middle"><a href="/enterprise/manager/user/getPageNow/${pageNow-1 }"><div align="right"><img src="/enterprise/images/back.gif" width="43" height="15" /></div></a></td>
                  </c:if>
                  <c:if test="${pageNow <pageCount }">
                  <td width="54" height="22" valign="middle"><a href="/enterprise/manager/user/getPageNow/${pageNow+1 }"><div align="right"><img src="/enterprise/images/next.gif" width="43" height="15" /></div></a></td>
                  </c:if>
                  <td width="49" height="22" valign="middle"><a href="/enterprise/manager/user/getPageNow/${pageCount }"><div align="right"><img src="/enterprise/images/last.gif" width="37" height="15" /></div></a></td>
                  <form action="/enterprise/manager/user/getPageNow" method="post">
                  <td width="59" height="22" valign="middle"><div align="right">转到第</div></td>
                  <td width="25" height="22" valign="middle"><span class="STYLE7">
                    <select name="pageNow">
                        <c:forEach var="i" begin="1" end="${pageCount }">
                        <option value="${i }">${i }</option>
                        </c:forEach>
                    </select>
                  </span></td>
                  <td width="23" height="22" valign="middle">页</td>
                  <td width="30" height="22" valign="middle"><input type="submit" value="跳转"></td>
                  </form>
                </tr>
              </table>
            </div></td>
          </tr>
        </table></td>
        <td width="14"><img src="/enterprise/images/tab_22.gif" width="14" height="29" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
